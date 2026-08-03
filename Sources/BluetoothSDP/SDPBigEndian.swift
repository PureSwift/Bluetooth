//
//  SDPBigEndian.swift
//  Bluetooth
//
//  SDP PDUs are big-endian (network byte order), unlike most Bluetooth
//  wire formats in this package, which are little-endian. Rather than
//  reuse the little-endian-oriented `DataConvertible` conformances
//  elsewhere in this module (`UInt16.init(bytes:)` and friends encode
//  raw native/little-endian memory), every multi-byte integer in this
//  module is read and written explicitly, most-significant-byte-first,
//  through these two small generic helpers.
//
//  UInt128 gets its own non-generic overloads below rather than using
//  these: this package's `UInt128` only conforms to `FixedWidthInteger`
//  under `@available(macOS 15, ...)` (on Apple platforms before the
//  native stdlib type, it's a hand-rolled struct), so a generic
//  `FixedWidthInteger`-constrained call fails to compile for it on
//  earlier deployment targets. The concrete overloads instead go
//  through `ByteValue`'s tuple accessor, which has no such gate.
//

import Bluetooth

internal extension FixedWidthInteger {

    /// Parses `self` from `bytes`, most-significant byte first.
    init<Bytes: Sequence>(bigEndianBytes bytes: Bytes) where Bytes.Element == UInt8 {
        self = bytes.reduce(into: 0 as Self) { result, byte in
            result = (result << 8) | Self(truncatingIfNeeded: byte)
        }
    }

    /// The big-endian (network byte order) bytes of `self`, most
    /// significant byte first.
    var bigEndianBytes: [UInt8] {
        let byteCount = Self.bitWidth / 8
        return (0 ..< byteCount).reversed().map { shift in
            UInt8(truncatingIfNeeded: self >> (shift * 8))
        }
    }
}

internal extension UInt128 {

    /// Parses `self` from 16 big-endian (network byte order) bytes.
    init<Bytes: Collection>(bigEndianBytes bytes: Bytes) where Bytes.Element == UInt8 {
        let b = Array(bytes)
        self = UInt128(bytes: (
            b[15], b[14], b[13], b[12], b[11], b[10], b[9], b[8],
            b[7], b[6], b[5], b[4], b[3], b[2], b[1], b[0]
        ))
    }

    /// The big-endian (network byte order) bytes of `self`, most
    /// significant byte first.
    var bigEndianBytes: [UInt8] {
        let b = bytes
        return [b.15, b.14, b.13, b.12, b.11, b.10, b.9, b.8, b.7, b.6, b.5, b.4, b.3, b.2, b.1, b.0]
    }
}
