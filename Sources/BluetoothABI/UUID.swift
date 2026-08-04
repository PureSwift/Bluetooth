//
//  UUID.swift
//  Bluetooth
//
//  Swift implementations of the `bt_uuid_*` family, bound to the
//  declarations in the vendored `uuid.h`.
//
//  Reference semantics reproduced exactly:
//  128-bit values are stored big-endian, 16/32-bit values in host order;
//  `bt_uuid16_cmp` returns `1` for equal and `0` otherwise (including
//  NULL and non-16-bit arguments); string parsing accepts the five
//  reference paths, with the C-stdlib scans (`strtol`, `sscanf`)
//  delegated to libc so the accepted-input contract is identical.
//

import Bluetooth
import CBluetooth

/// The Bluetooth base UUID `00000000-0000-1000-8000-00805F9B34FB`.
private let bluetoothBaseUUID: (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8) = (
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00,
    0x80, 0x00, 0x00, 0x80, 0x5F, 0x9B, 0x34, 0xFB
)

// MARK: - Construction

/// `int bt_uuid16_create(bt_uuid_t *btuuid, uint16_t value)`
@c(bt_uuid16_create)
public func bt_uuid16_create(
    _ btuuid: UnsafeMutablePointer<bt_uuid_t>?,
    _ value: UInt16
) -> Int32 {
    var uuid = bt_uuid_t()
    uuid.type = BT_UUID16
    uuid.value.u16 = value
    btuuid!.pointee = uuid
    return 0
}

/// `int bt_uuid32_create(bt_uuid_t *btuuid, uint32_t value)`
@c(bt_uuid32_create)
public func bt_uuid32_create(
    _ btuuid: UnsafeMutablePointer<bt_uuid_t>?,
    _ value: UInt32
) -> Int32 {
    var uuid = bt_uuid_t()
    uuid.type = BT_UUID32
    uuid.value.u32 = value
    btuuid!.pointee = uuid
    return 0
}

/// `int bt_uuid128_create(bt_uuid_t *btuuid, uint128_t value)`
@c(bt_uuid128_create)
public func bt_uuid128_create(
    _ btuuid: UnsafeMutablePointer<bt_uuid_t>?,
    _ value: uint128_t
) -> Int32 {
    var uuid = bt_uuid_t()
    uuid.type = BT_UUID128
    uuid.value.u128 = value
    btuuid!.pointee = uuid
    return 0
}

// MARK: - Conversion

/// `void bt_uuid_to_uuid128(const bt_uuid_t *src, bt_uuid_t *dst)`
///
/// As in the reference, `dst` is left untouched for `BT_UUID_UNSPEC`.
@c(bt_uuid_to_uuid128)
public func bt_uuid_to_uuid128(
    _ src: UnsafePointer<bt_uuid_t>?,
    _ dst: UnsafeMutablePointer<bt_uuid_t>?
) {
    let source = src!.pointee
    switch source.type {
    case BT_UUID128:
        dst!.pointee = source
    case BT_UUID32:
        // 32-bit values replace bytes 0-3 of the base UUID, big-endian.
        var value = source.value.u32.bigEndian
        var uuid128 = uint128_t(data: bluetoothBaseUUID)
        withUnsafeMutableBytes(of: &uuid128.data) { data in
            withUnsafeBytes(of: &value) { data.copyMemory(from: $0) }
        }
        _ = bt_uuid128_create(dst, uuid128)
    case BT_UUID16:
        // 16-bit values replace bytes 2-3 of the base UUID, big-endian.
        var value = source.value.u16.bigEndian
        var uuid128 = uint128_t(data: bluetoothBaseUUID)
        withUnsafeMutableBytes(of: &uuid128.data) { data in
            withUnsafeBytes(of: &value) {
                data[2] = $0[0]
                data[3] = $0[1]
            }
        }
        _ = bt_uuid128_create(dst, uuid128)
    default:
        break
    }
}

/// `int bt_uuid_to_le(const bt_uuid_t *src, void *dst)`
@c(bt_uuid_to_le)
public func bt_uuid_to_le(
    _ src: UnsafePointer<bt_uuid_t>?,
    _ dst: UnsafeMutableRawPointer?
) -> Int32 {
    let source = src!.pointee
    switch source.type {
    case BT_UUID16:
        var value = source.value.u16.littleEndian
        withUnsafeBytes(of: &value) {
            dst!.copyMemory(from: $0.baseAddress!, byteCount: 2)
        }
        return 0
    case BT_UUID32, BT_UUID128:
        // Convert from 128-bit big-endian to little-endian.
        var uuid128 = bt_uuid_t()
        bt_uuid_to_uuid128(src, &uuid128)
        withUnsafeBytes(of: uuid128.value.u128.data) { data in
            let dst = dst!.assumingMemoryBound(to: UInt8.self)
            for index in 0..<16 {
                dst[15 - index] = data[index]
            }
        }
        return 0
    default:
        return negativeEINVAL
    }
}

// MARK: - Comparison

/// `int bt_uuid_cmp(const bt_uuid_t *uuid1, const bt_uuid_t *uuid2)`
///
/// The reference returns `memcmp` over the two 128-bit expansions, and
/// glibc's `memcmp` returns the signed difference of the first differing
/// bytes. C only specifies the sign, and at `-O` the optimizer is free
/// to substitute an implementation returning just ±1 — which it does.
/// The subtraction is therefore written out, so that the returned value
/// matches the reference exactly and does not depend on the optimization
/// level the library happened to be built at.
@c(bt_uuid_cmp)
public func bt_uuid_cmp(
    _ uuid1: UnsafePointer<bt_uuid_t>?,
    _ uuid2: UnsafePointer<bt_uuid_t>?
) -> Int32 {
    var u1 = bt_uuid_t()
    var u2 = bt_uuid_t()
    bt_uuid_to_uuid128(uuid1, &u1)
    bt_uuid_to_uuid128(uuid2, &u2)
    return withUnsafeBytes(of: u1.value.u128) { p1 in
        withUnsafeBytes(of: u2.value.u128) { p2 in
            for index in 0..<MemoryLayout<uint128_t>.size where p1[index] != p2[index] {
                return Int32(p1[index]) - Int32(p2[index])
            }
            return 0
        }
    }
}

/// `int bt_uuid16_cmp(const bt_uuid_t *uuid1, uint16_t uuid2)`
///
/// Note the inverted convention relative to `bt_uuid_cmp`: returns `1`
/// for equal and `0` for not equal — including a NULL or non-16-bit
/// first argument.
@c(bt_uuid16_cmp)
public func bt_uuid16_cmp(
    _ uuid1: UnsafePointer<bt_uuid_t>?,
    _ uuid2: UInt16
) -> Int32 {
    guard let uuid1, uuid1.pointee.type == BT_UUID16 else {
        return 0
    }
    return uuid1.pointee.value.u16 == uuid2 ? 1 : 0
}

/// `int bt_uuid_strcmp(const void *a, const void *b)`
@c(bt_uuid_strcmp)
public func bt_uuid_strcmp(
    _ a: UnsafeRawPointer?,
    _ b: UnsafeRawPointer?
) -> Int32 {
    var u1 = bt_uuid_t()
    var u2 = bt_uuid_t()
    guard bt_string_to_uuid(&u1, a?.assumingMemoryBound(to: CChar.self)) >= 0 else {
        return negativeEINVAL
    }
    guard bt_string_to_uuid(&u2, b?.assumingMemoryBound(to: CChar.self)) >= 0 else {
        return negativeEINVAL
    }
    return withUnsafePointer(to: u1) { p1 in
        withUnsafePointer(to: u2) { p2 in
            bt_uuid_cmp(p1, p2)
        }
    }
}

// MARK: - Strings

/// `int bt_uuid_to_string(const bt_uuid_t *uuid, char *str, size_t n)`
@c(bt_uuid_to_string)
public func bt_uuid_to_string(
    _ uuid: UnsafePointer<bt_uuid_t>?,
    _ str: UnsafeMutablePointer<CChar>?,
    _ n: Int
) -> Int32 {
    guard let uuid, uuid.pointee.type != BT_UUID_UNSPEC else {
        withCString("NULL") { snprint($0, length: 4, to: str, size: n) }
        return negativeEINVAL
    }
    // Convert to 128-bit format and print lowercase with the dashes of
    // the 8-4-4-4-12 layout.
    var uuid128 = bt_uuid_t()
    bt_uuid_to_uuid128(uuid, &uuid128)
    var output = [CChar](repeating: 0, count: 37)
    withUnsafeBytes(of: uuid128.value.u128.data) { data in
        output.withUnsafeMutableBufferPointer { buffer in
            let buffer = buffer.baseAddress!
            var offset = 0
            for index in 0..<16 {
                if index == 4 || index == 6 || index == 8 || index == 10 {
                    buffer[offset] = 0x2D  // '-'
                    offset += 1
                }
                writeHex(data[index], to: buffer, at: offset, uppercase: false)
                offset += 2
            }
        }
    }
    output.withUnsafeBufferPointer {
        snprint($0.baseAddress!, length: 36, to: str, size: n)
    }
    return 0
}

/// `int bt_string_to_uuid(bt_uuid_t *uuid, const char *string)`
///
/// The five reference accept paths: base-UUID 128-bit strings downgrade
/// to 16-bit; 36-character strings parse as 128-bit; 8- or 10-character
/// strings as 32-bit; 4- or 6-character strings as 16-bit (the longer
/// variants admit a `0x` prefix via `strtol`/`strtoul` semantics).
@c(bt_string_to_uuid)
public func bt_string_to_uuid(
    _ uuid: UnsafeMutablePointer<bt_uuid_t>?,
    _ string: UnsafePointer<CChar>?
) -> Int32 {
    guard let string else { return negativeEINVAL }
    if cbt_scan_base_uuid128(string) != 0 {
        return stringToUUID16(uuid, string + 4)
    }
    let length = strlen(string)
    if isUUID128(string, length) {
        return stringToUUID128(uuid, string)
    } else if length == 8 || length == 10 {
        return stringToUUID32(uuid, string)
    } else if length == 4 || length == 6 {
        return stringToUUID16(uuid, string)
    }
    return negativeEINVAL
}

private func isUUID128(_ string: UnsafePointer<CChar>, _ length: Int) -> Bool {
    length == 36
        && string[8] == 0x2D
        && string[13] == 0x2D
        && string[18] == 0x2D
        && string[23] == 0x2D
}

private func stringToUUID16(
    _ uuid: UnsafeMutablePointer<bt_uuid_t>?,
    _ string: UnsafePointer<CChar>
) -> Int32 {
    var endptr: UnsafeMutablePointer<CChar>? = nil
    let value = strtol(string, &endptr, 16)
    if let endptr, endptr.pointee == 0 || endptr.pointee == 0x2D {
        return bt_uuid16_create(uuid, UInt16(truncatingIfNeeded: value))
    }
    return negativeEINVAL
}

private func stringToUUID32(
    _ uuid: UnsafeMutablePointer<bt_uuid_t>?,
    _ string: UnsafePointer<CChar>
) -> Int32 {
    var endptr: UnsafeMutablePointer<CChar>? = nil
    let value = strtoul(string, &endptr, 16)
    if let endptr, endptr.pointee == 0 {
        return bt_uuid32_create(uuid, UInt32(truncatingIfNeeded: value))
    }
    return negativeEINVAL
}

private func stringToUUID128(
    _ uuid: UnsafeMutablePointer<bt_uuid_t>?,
    _ string: UnsafePointer<CChar>
) -> Int32 {
    var bytes = [UInt8](repeating: 0, count: 16)
    let scanned = bytes.withUnsafeMutableBufferPointer {
        cbt_scan_uuid128(string, $0.baseAddress)
    }
    guard scanned != 0 else { return negativeEINVAL }
    var value = uint128_t()
    withUnsafeMutableBytes(of: &value.data) { $0.copyBytes(from: bytes) }
    return bt_uuid128_create(uuid, value)
}

private func withCString<T>(_ string: StaticString, _ body: (UnsafePointer<CChar>) -> T) -> T {
    precondition(string.hasPointerRepresentation)
    return string.withUTF8Buffer { buffer in
        buffer.baseAddress!.withMemoryRebound(to: CChar.self, capacity: buffer.count) {
            body($0)
        }
    }
}
