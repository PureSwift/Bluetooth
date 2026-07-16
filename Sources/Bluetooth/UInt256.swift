//
//  UInt256.swift
//  Bluetooth
//
//  Created by Marco Estrella on 4/21/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

/// A 256 bit number stored according to host endianness.
@frozen
public struct UInt256: ByteValue, Comparable, Sendable {

    public typealias ByteValue = (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8)

    public static var bitWidth: Int { 256 }

    public var bytes: ByteValue

    public init(bytes: ByteValue = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)) {
        self.bytes = bytes
    }
}

public extension UInt256 {

    /// The minimum representable value in this type.
    static var min: UInt256 { return UInt256(bytes: (.min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min)) }

    /// The maximum representable value in this type.
    static var max: UInt256 { return UInt256(bytes: (.max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max)) }

    /// The value with all bits set to zero.
    static var zero: UInt256 { return .min }
}

// MARK: - Hashable

extension UInt256: Hashable {

    public func hash(into hasher: inout Hasher) {
        Swift.withUnsafeBytes(of: bytes) { hasher.combine(bytes: $0) }
    }
}

// MARK: - Data Convertible

extension UInt256: DataConvertible {

    public init?<Data: DataContainer>(data: Data) {
        guard data.count == Self.length else { return nil }
        self.init(bytes: (data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7], data[8], data[9], data[10], data[11], data[12], data[13], data[14], data[15], data[16], data[17], data[18], data[19], data[20], data[21], data[22], data[23], data[24], data[25], data[26], data[27], data[28], data[29], data[30], data[31]))
    }
}

// MARK: - Byte Swap

extension UInt256: ByteSwap {

    /// A representation of this integer with the byte order swapped.
    public var byteSwapped: UInt256 {

        return UInt256(
            bytes: (
                bytes.31,
                bytes.30,
                bytes.29,
                bytes.28,
                bytes.27,
                bytes.26,
                bytes.25,
                bytes.24,
                bytes.23,
                bytes.22,
                bytes.21,
                bytes.20,
                bytes.19,
                bytes.18,
                bytes.17,
                bytes.16,
                bytes.15,
                bytes.14,
                bytes.13,
                bytes.12,
                bytes.11,
                bytes.10,
                bytes.9,
                bytes.8,
                bytes.7,
                bytes.6,
                bytes.5,
                bytes.4,
                bytes.3,
                bytes.2,
                bytes.1,
                bytes.0
            ))
    }
}

// MARK: - ExpressibleByIntegerLiteral

@available(macOS 13.3, iOS 16.4, watchOS 9.4, tvOS 16.4, *)
extension UInt256: ExpressibleByIntegerLiteral {

    public init(integerLiteral value: StaticBigInt) {
        precondition(
            value.signum() >= 0,
            "\(value) overflows when stored into UInt256")
        precondition(
            value.bitWidth <= UInt256.bitWidth,
            "\(value) overflows when stored into UInt256")
        var bytes = [UInt8](repeating: 0, count: UInt256.bitWidth / 8)
        let wordSize = UInt.bitWidth / 8
        for wordIndex in 0..<(UInt256.bitWidth / UInt.bitWidth) {
            let word = value[wordIndex]
            let byteOffset = wordIndex * wordSize
            for (index, byte) in word.bytes.enumerated() {
                bytes[byteOffset + index] = byte
            }
        }
        self = UInt256(data: bytes)!
    }
}

// MARK: - CustomStringConvertible

extension UInt256: CustomStringConvertible {}
