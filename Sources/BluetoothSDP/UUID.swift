//
//  UUID.swift
//  Bluetooth
//
//  Swift implementations of SDP's `uuid_t` family, bound to the
//  declarations in the vendored `sdp_lib.h`.
//
//  This is a distinct type from `bt_uuid_t` (declared in `uuid.h` and
//  implemented in `BluetoothABI`) — same DTD-shaped tag values as the
//  rest of the SDP data model (`SDP_UUID16` = 0x19, not the 16 of
//  `BT_UUID16`), and the base-UUID expansion is written as the
//  reference's byte-level addition into an otherwise-zero region of
//  the base UUID, not a placement, in case a future base UUID ever
//  made that distinction observable.
//

import Bluetooth
import CBluetooth

private let bluetoothBaseUUID: (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8) = (
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00,
    0x80, 0x00, 0x00, 0x80, 0x5F, 0x9B, 0x34, 0xFB
)

/// `uuid_t *sdp_uuid16_create(uuid_t *u, uint16_t val)`
@discardableResult
@c(sdp_uuid16_create)
public func sdp_uuid16_create(
    _ u: UnsafeMutablePointer<uuid_t>?,
    _ value: UInt16
) -> UnsafeMutablePointer<uuid_t>? {
    u!.pointee = uuid_t()
    u!.pointee.type = UInt8(SDP_UUID16)
    u!.pointee.value.uuid16 = value
    return u
}

/// `uuid_t *sdp_uuid32_create(uuid_t *u, uint32_t val)`
@discardableResult
@c(sdp_uuid32_create)
public func sdp_uuid32_create(
    _ u: UnsafeMutablePointer<uuid_t>?,
    _ value: UInt32
) -> UnsafeMutablePointer<uuid_t>? {
    u!.pointee = uuid_t()
    u!.pointee.type = UInt8(SDP_UUID32)
    u!.pointee.value.uuid32 = value
    return u
}

/// `uuid_t *sdp_uuid128_create(uuid_t *u, const void *val)`
@discardableResult
@c(sdp_uuid128_create)
public func sdp_uuid128_create(
    _ u: UnsafeMutablePointer<uuid_t>?,
    _ value: UnsafeRawPointer?
) -> UnsafeMutablePointer<uuid_t>? {
    u!.pointee = uuid_t()
    u!.pointee.type = UInt8(SDP_UUID128)
    withUnsafeMutableBytes(of: &u!.pointee.value.uuid128) {
        $0.copyMemory(from: UnsafeRawBufferPointer(start: value, count: 16))
    }
    return u
}

/// `int sdp_uuid_cmp(const void *p1, const void *p2)`
///
/// Returns `0` if equal, else non-zero — via `memcmp` on the 128-bit
/// expansion, so the exact non-zero value carries the sign and
/// magnitude of the first differing byte, as with `bt_uuid_cmp`.
@c(sdp_uuid_cmp)
public func sdp_uuid_cmp(
    _ p1: UnsafeRawPointer?,
    _ p2: UnsafeRawPointer?
) -> Int32 {
    let u1 = sdp_uuid_to_uuid128(p1?.assumingMemoryBound(to: uuid_t.self))
    let u2 = sdp_uuid_to_uuid128(p2?.assumingMemoryBound(to: uuid_t.self))
    defer {
        bt_free(u1)
        bt_free(u2)
    }
    return sdp_uuid128_cmp(u1, u2)
}

/// `int sdp_uuid16_cmp(const void *p1, const void *p2)`
///
/// The reference is `memcmp` over the raw (host-endian, so
/// little-endian on this target) storage of the 16-bit field, not a
/// numeric comparison — comparing byte 0 (the low byte) before byte 1
/// reorders values that don't share a low byte. Reproduced exactly,
/// including that quirk, rather than the numerically "corrected"
/// comparison a reader might expect.
@c(sdp_uuid16_cmp)
public func sdp_uuid16_cmp(
    _ p1: UnsafeRawPointer?,
    _ p2: UnsafeRawPointer?
) -> Int32 {
    let u1 = p1!.assumingMemoryBound(to: uuid_t.self)
    let u2 = p2!.assumingMemoryBound(to: uuid_t.self)
    return withUnsafeBytes(of: u1.pointee.value.uuid16) { b1 in
        withUnsafeBytes(of: u2.pointee.value.uuid16) { b2 in
            for index in 0..<2 where b1[index] != b2[index] {
                return Int32(b1[index]) - Int32(b2[index])
            }
            return 0
        }
    }
}

/// `int sdp_uuid128_cmp(const void *p1, const void *p2)`
@c(sdp_uuid128_cmp)
public func sdp_uuid128_cmp(
    _ p1: UnsafeRawPointer?,
    _ p2: UnsafeRawPointer?
) -> Int32 {
    let u1 = p1!.assumingMemoryBound(to: uuid_t.self)
    let u2 = p2!.assumingMemoryBound(to: uuid_t.self)
    return withUnsafeBytes(of: u1.pointee.value.uuid128) { b1 in
        withUnsafeBytes(of: u2.pointee.value.uuid128) { b2 in
            for index in 0..<16 where b1[index] != b2[index] {
                return Int32(b1[index]) - Int32(b2[index])
            }
            return 0
        }
    }
}

/// `void sdp_uuid16_to_uuid128(uuid_t *uuid128, const uuid_t *uuid16)`
@c(sdp_uuid16_to_uuid128)
public func sdp_uuid16_to_uuid128(
    _ uuid128: UnsafeMutablePointer<uuid_t>?,
    _ uuid16: UnsafePointer<uuid_t>?
) {
    uuid128!.pointee.type = UInt8(SDP_UUID128)
    withUnsafeMutableBytes(of: &uuid128!.pointee.value.uuid128) { base in
        base.copyBytes(from: withUnsafeBytes(of: bluetoothBaseUUID) { Array($0) })
        var data1 = base.loadUnaligned(fromByteOffset: 2, as: UInt16.self)
        data1 &+= uuid16!.pointee.value.uuid16.bigEndian
        base.storeBytes(of: data1, toByteOffset: 2, as: UInt16.self)
    }
}

/// `void sdp_uuid32_to_uuid128(uuid_t *uuid128, const uuid_t *uuid32)`
@c(sdp_uuid32_to_uuid128)
public func sdp_uuid32_to_uuid128(
    _ uuid128: UnsafeMutablePointer<uuid_t>?,
    _ uuid32: UnsafePointer<uuid_t>?
) {
    uuid128!.pointee.type = UInt8(SDP_UUID128)
    withUnsafeMutableBytes(of: &uuid128!.pointee.value.uuid128) { base in
        base.copyBytes(from: withUnsafeBytes(of: bluetoothBaseUUID) { Array($0) })
        var data0 = base.loadUnaligned(fromByteOffset: 0, as: UInt32.self)
        data0 &+= uuid32!.pointee.value.uuid32.bigEndian
        base.storeBytes(of: data0, toByteOffset: 0, as: UInt32.self)
    }
}

/// `uuid_t *sdp_uuid_to_uuid128(const uuid_t *uuid)`
@c(sdp_uuid_to_uuid128)
public func sdp_uuid_to_uuid128(
    _ uuid: UnsafePointer<uuid_t>?
) -> UnsafeMutablePointer<uuid_t>? {
    guard let uuid128 = bt_malloc0(MemoryLayout<uuid_t>.size)?
        .assumingMemoryBound(to: uuid_t.self) else {
        return nil
    }
    let source = uuid!
    switch Int32(source.pointee.type) {
    case SDP_UUID128:
        uuid128.pointee = source.pointee
    case SDP_UUID32:
        sdp_uuid32_to_uuid128(uuid128, source)
    case SDP_UUID16:
        sdp_uuid16_to_uuid128(uuid128, source)
    default:
        break
    }
    return uuid128
}

/// `int sdp_uuid128_to_uuid(uuid_t *uuid)`
///
/// Converts in place to the 16- or 32-bit short form when the 128-bit
/// value is within the Bluetooth base UUID space. Returns `1` whenever
/// `uuid` ends up in short form (including if it already was), `0` if
/// it is 128-bit and outside the base UUID space (left unchanged).
@c(sdp_uuid128_to_uuid)
public func sdp_uuid128_to_uuid(
    _ uuid: UnsafeMutablePointer<uuid_t>?
) -> Int32 {
    let uuid = uuid!
    guard Int32(uuid.pointee.type) == SDP_UUID128 else { return 1 }

    let matches: Bool = withUnsafeBytes(of: uuid.pointee.value.uuid128) { u in
        withUnsafeBytes(of: bluetoothBaseUUID) { base in
            for index in 4..<16 where base[index] != u[index] {
                return false
            }
            return true
        }
    }
    guard matches else { return 0 }

    let data = withUnsafeBytes(of: uuid.pointee.value.uuid128) {
        $0.loadUnaligned(fromByteOffset: 0, as: UInt32.self).bigEndian
    }
    if data <= 0xffff {
        uuid.pointee.type = UInt8(SDP_UUID16)
        uuid.pointee.value.uuid16 = UInt16(data)
    } else {
        uuid.pointee.type = UInt8(SDP_UUID32)
        uuid.pointee.value.uuid32 = data
    }
    return 1
}

/// `int sdp_uuid_to_proto(uuid_t *uuid)`
@c(sdp_uuid_to_proto)
public func sdp_uuid_to_proto(
    _ uuid: UnsafeMutablePointer<uuid_t>?
) -> Int32 {
    var u = uuid!.pointee
    return withUnsafeMutablePointer(to: &u) { p -> Int32 in
        guard sdp_uuid128_to_uuid(p) != 0 else { return 0 }
        switch Int32(p.pointee.type) {
        case SDP_UUID16:
            return Int32(p.pointee.value.uuid16)
        case SDP_UUID32:
            return Int32(bitPattern: p.pointee.value.uuid32)
        default:
            return 0
        }
    }
}

/// `int sdp_uuid_extract(const uint8_t *p, int bufsize, uuid_t *uuid, int *scanned)`
@c(sdp_uuid_extract)
public func sdp_uuid_extract(
    _ buffer: UnsafePointer<UInt8>?,
    _ bufferSize: Int32,
    _ uuid: UnsafeMutablePointer<uuid_t>?,
    _ scanned: UnsafeMutablePointer<Int32>?
) -> Int32 {
    guard bufferSize >= 1 else { return -1 }
    var p = buffer!
    var remaining = bufferSize

    let type = p.pointee
    guard type == UInt8(SDP_UUID16) || type == UInt8(SDP_UUID32) || type == UInt8(SDP_UUID128) else {
        return -1
    }
    p += 1
    scanned!.pointee += 1
    remaining -= 1

    switch Int32(type) {
    case SDP_UUID16:
        guard remaining >= 2 else { return -1 }
        sdp_uuid16_create(uuid, bt_get_be16(p))
        scanned!.pointee += 2
    case SDP_UUID32:
        guard remaining >= 4 else { return -1 }
        sdp_uuid32_create(uuid, bt_get_be32(p))
        scanned!.pointee += 4
    default:
        guard remaining >= 16 else { return -1 }
        sdp_uuid128_create(uuid, p)
        scanned!.pointee += 16
    }
    return 0
}
