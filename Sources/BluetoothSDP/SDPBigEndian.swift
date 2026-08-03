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
