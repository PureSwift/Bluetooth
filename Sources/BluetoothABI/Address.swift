//
//  Address.swift
//  Bluetooth
//
//  Swift implementations of libbluetooth's Bluetooth address entry
//  points, bound to the declarations in the vendored `bluetooth.h`.
//
//  Reference semantics reproduced exactly,
//  including `batostr` printing bytes in storage order (the historical
//  behavior) while `ba2str` prints display order.
//

import Bluetooth
import CBluetooth

/// `void baswap(bdaddr_t *dst, const bdaddr_t *src)`
@c(baswap)
public func baswap(
    _ dst: UnsafeMutablePointer<bdaddr_t>?,
    _ src: UnsafePointer<bdaddr_t>?
) {
    let b = src!.pointee.b
    dst!.pointee.b = (b.5, b.4, b.3, b.2, b.1, b.0)
}

/// `char *batostr(const bdaddr_t *ba)`
///
/// Returns an 18-byte `bt_malloc`ed string the caller frees with
/// `bt_free`. Note: prints `b[0]` first — the reversed (storage order)
/// representation, matching the reference implementation.
@c(batostr)
public func batostr(
    _ ba: UnsafePointer<bdaddr_t>?
) -> UnsafeMutablePointer<CChar>? {
    guard let str = bt_malloc(18)?.assumingMemoryBound(to: CChar.self) else {
        return nil
    }
    let b = ba!.pointee.b
    let bytes = [b.0, b.1, b.2, b.3, b.4, b.5]
    for (index, byte) in bytes.enumerated() {
        writeHex(byte, to: str, at: index * 3, uppercase: true)
        str[index * 3 + 2] = index == 5 ? 0 : 0x3A  // ':'
    }
    return str
}

/// `bdaddr_t *strtoba(const char *str)`
///
/// Returns a `bt_malloc`ed big-endian address the caller frees with
/// `bt_free`. As in the reference, a malformed string yields a zeroed
/// address, not NULL.
@c(strtoba)
public func strtoba(
    _ str: UnsafePointer<CChar>?
) -> UnsafeMutablePointer<bdaddr_t>? {
    guard let ba = bt_malloc(MemoryLayout<bdaddr_t>.size)?
        .assumingMemoryBound(to: bdaddr_t.self) else {
        return nil
    }
    var b = bdaddr_t()
    _ = withUnsafeMutablePointer(to: &b) { str2ba(str, $0) }
    withUnsafePointer(to: b) { baswap(ba, $0) }
    return ba
}

/// `int ba2str(const bdaddr_t *ba, char *str)`
@c(ba2str)
public func ba2str(
    _ ba: UnsafePointer<bdaddr_t>?,
    _ str: UnsafeMutablePointer<CChar>?
) -> Int32 {
    ba2str(ba!, str!, uppercase: true)
}

/// `int ba2strlc(const bdaddr_t *ba, char *str)`
///
/// Matches the kernel's lowercase printing of MAC addresses (`%pMR`).
@c(ba2strlc)
public func ba2strlc(
    _ ba: UnsafePointer<bdaddr_t>?,
    _ str: UnsafeMutablePointer<CChar>?
) -> Int32 {
    ba2str(ba!, str!, uppercase: false)
}

private func ba2str(
    _ ba: UnsafePointer<bdaddr_t>,
    _ str: UnsafeMutablePointer<CChar>,
    uppercase: Bool
) -> Int32 {
    let b = ba.pointee.b
    let bytes = [b.5, b.4, b.3, b.2, b.1, b.0]
    for (index, byte) in bytes.enumerated() {
        writeHex(byte, to: str, at: index * 3, uppercase: uppercase)
        str[index * 3 + 2] = index == 5 ? 0 : 0x3A  // ':'
    }
    return 17
}

/// `int str2ba(const char *str, bdaddr_t *ba)`
@c(str2ba)
public func str2ba(
    _ str: UnsafePointer<CChar>?,
    _ ba: UnsafeMutablePointer<bdaddr_t>?
) -> Int32 {
    guard bachk(str) == 0 else {
        ba!.pointee = bdaddr_t()
        return -1
    }
    // `bachk` guarantees 17 characters of `XX:XX:XX:XX:XX:XX` hex pairs.
    var bytes: (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8) = (0, 0, 0, 0, 0, 0)
    withUnsafeMutableBytes(of: &bytes) { buffer in
        for index in 0..<6 {
            let high = hexNibble(str![index * 3])
            let low = hexNibble(str![index * 3 + 1])
            // display order to `bdaddr_t` storage order
            buffer[5 - index] = (high << 4) | low
        }
    }
    ba!.pointee.b = bytes
    return 0
}

/// `int ba2oui(const bdaddr_t *ba, char *oui)`
@c(ba2oui)
public func ba2oui(
    _ ba: UnsafePointer<bdaddr_t>?,
    _ str: UnsafeMutablePointer<CChar>?
) -> Int32 {
    let b = ba!.pointee.b
    let bytes = [b.5, b.4, b.3]
    let str = str!
    for (index, byte) in bytes.enumerated() {
        writeHex(byte, to: str, at: index * 3, uppercase: true)
        str[index * 3 + 2] = index == 2 ? 0 : 0x2D  // '-'
    }
    return 8
}

/// `int bachk(const char *str)`
@c(bachk)
public func bachk(
    _ str: UnsafePointer<CChar>?
) -> Int32 {
    guard let str else { return -1 }
    guard strlen(str) == 17 else { return -1 }
    for index in 0..<17 {
        let char = UInt8(bitPattern: str[index])
        if index % 3 == 2 {
            guard char == 0x3A else { return -1 }  // ':'
        } else {
            guard isHexDigit(char) else { return -1 }
        }
    }
    return 0
}

private func isHexDigit(_ char: UInt8) -> Bool {
    switch char {
    case 0x30...0x39, 0x41...0x46, 0x61...0x66:  // 0-9 A-F a-f
        return true
    default:
        return false
    }
}

private func hexNibble(_ char: CChar) -> UInt8 {
    let char = UInt8(bitPattern: char)
    switch char {
    case 0x30...0x39:  // 0-9
        return char - 0x30
    case 0x41...0x46:  // A-F
        return char - 0x41 + 10
    case 0x61...0x66:  // a-f
        return char - 0x61 + 10
    default:
        return 0
    }
}
