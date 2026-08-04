//
//  Boundary.swift
//  Bluetooth
//
//  Conventions of the C boundary.
//
//  libbluetooth uses two distinct errno conventions, encoded here once
//  rather than decided per function:
//
//  1. The UUID family returns `0` on success and `-EINVAL` on failure
//     (a negated errno as the return value; `errno` itself is untouched).
//     Exception: `bt_uuid16_cmp` returns `1` for equal and `0` for not
//     equal — including `0` for a NULL or non-16-bit argument.
//
//  2. The socket family (implemented in BluetoothLinux) returns `-1` and
//     sets `errno`.
//
//  Ownership conventions crossing this boundary:
//
//  - `batostr` and `strtoba` return `bt_malloc`ed buffers the caller
//    frees with `bt_free`. Allocation stays in C (`cbt_alloc.c`) so the
//    contract is exactly the system allocator's.
//  - `ba2str`, `ba2strlc`, `ba2oui` and `bt_uuid_to_string` write into
//    caller-provided buffers.
//  - `bt_compidtostr` returns pointers with static lifetime.
//
//  `bdaddr_t` stores the least significant byte first (`b[0]` prints
//  last); `BluetoothAddress.bytes` is host-endian with `littleEndian`
//  matching the `bdaddr_t` layout, so every crossing goes through
//  `littleEndian`.
//

import Bluetooth
import CBluetooth

/// The UUID-family failure return value (`-EINVAL`).
@inlinable
internal var negativeEINVAL: Int32 { -EINVAL }

/// Lookup table for lowercase hexadecimal digits.
@usableFromInline
internal let lowercaseHexDigits: [UInt8] = Array("0123456789abcdef".utf8)

/// Lookup table for uppercase hexadecimal digits.
@usableFromInline
internal let uppercaseHexDigits: [UInt8] = Array("0123456789ABCDEF".utf8)

/// Writes the two hexadecimal digits of `byte` to `buffer` at `offset`.
@usableFromInline
internal func writeHex(
    _ byte: UInt8,
    to buffer: UnsafeMutablePointer<CChar>,
    at offset: Int,
    uppercase: Bool
) {
    let digits = uppercase ? uppercaseHexDigits : lowercaseHexDigits
    buffer[offset] = CChar(bitPattern: digits[Int(byte >> 4)])
    buffer[offset + 1] = CChar(bitPattern: digits[Int(byte & 0x0F)])
}

/// `snprintf`-style bounded copy: writes at most `size - 1` bytes of
/// `content` to `buffer` followed by a NUL terminator; writes nothing
/// when `size` is zero. `content` must be NUL-terminated ASCII.
@usableFromInline
internal func snprint(
    _ content: UnsafePointer<CChar>,
    length: Int,
    to buffer: UnsafeMutablePointer<CChar>?,
    size: Int
) {
    guard size > 0, let buffer else { return }
    let count = min(length, size - 1)
    for index in 0..<count {
        buffer[index] = content[index]
    }
    buffer[count] = 0
}

internal extension BluetoothAddress {

    /// Initialize from the C `bdaddr_t` layout (least significant byte first).
    init(bdaddr: bdaddr_t) {
        self.init(littleEndian: BluetoothAddress(bytes: bdaddr.b))
    }

    /// The C `bdaddr_t` representation (least significant byte first).
    var bdaddr: bdaddr_t {
        bdaddr_t(b: littleEndian.bytes)
    }
}
