//
//  UInt512.swift
//  Bluetooth
//
//  Created by Marco Estrella on 4/21/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

/// A 512 bit number stored according to host endianness.
@frozen
public struct UInt512: ByteValue, Comparable, Sendable {

    public typealias ByteValue = (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8)

    public static var bitWidth: Int { 512 }

    public var bytes: ByteValue

    public init(bytes: ByteValue = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)) {

        self.bytes = bytes
    }
}

public extension UInt512 {

    /// The minimum representable value in this type.
    static var min: UInt512 { return UInt512(bytes: (.min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min)) }

    /// The maximum representable value in this type.
    static var max: UInt512 { return UInt512(bytes: (.max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max)) }

    /// The value with all bits set to zero.
    static var zero: UInt512 { return .min }
}

// MARK: - Hashable

extension UInt512: Hashable {

    public func hash(into hasher: inout Hasher) {
        Swift.withUnsafeBytes(of: bytes) { hasher.combine(bytes: $0) }
    }
}

// MARK: - Data Convertible

extension UInt512: DataConvertible {

    public init?<Data: DataContainer>(data: Data) {
        guard data.count == Self.length else { return nil }
        self.init(bytes: (data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7], data[8], data[9], data[10], data[11], data[12], data[13], data[14], data[15], data[16], data[17], data[18], data[19], data[20], data[21], data[22], data[23], data[24], data[25], data[26], data[27], data[28], data[29], data[30], data[31], data[32], data[33], data[34], data[35], data[36], data[37], data[38], data[39], data[40], data[41], data[42], data[43], data[44], data[45], data[46], data[47], data[48], data[49], data[50], data[51], data[52], data[53], data[54], data[55], data[56], data[57], data[58], data[59], data[60], data[61], data[62], data[63]))
    }
}

// MARK: - Byte Swap

extension UInt512: ByteSwap {

    /// A representation of this integer with the byte order swapped.
    public var byteSwapped: UInt512 {

        return UInt512(
            bytes: (
                bytes.63,
                bytes.62,
                bytes.61,
                bytes.60,
                bytes.59,
                bytes.58,
                bytes.57,
                bytes.56,
                bytes.55,
                bytes.54,
                bytes.53,
                bytes.52,
                bytes.51,
                bytes.50,
                bytes.49,
                bytes.48,
                bytes.47,
                bytes.46,
                bytes.45,
                bytes.44,
                bytes.43,
                bytes.42,
                bytes.41,
                bytes.40,
                bytes.39,
                bytes.38,
                bytes.37,
                bytes.36,
                bytes.35,
                bytes.34,
                bytes.33,
                bytes.32,
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
extension UInt512: ExpressibleByIntegerLiteral {

    public init(integerLiteral value: StaticBigInt) {
        precondition(
            value.signum() >= 0,
            "\(value) overflows when stored into UInt512")
        precondition(
            value.bitWidth <= UInt512.bitWidth,
            "\(value) overflows when stored into UInt512")
        var bytes = [UInt8](repeating: 0, count: UInt512.bitWidth / 8)
        let wordSize = UInt.bitWidth / 8
        for wordIndex in 0..<(UInt512.bitWidth / UInt.bitWidth) {
            let word = value[wordIndex]
            let byteOffset = wordIndex * wordSize
            for (index, byte) in word.bytes.enumerated() {
                bytes[byteOffset + index] = byte
            }
        }
        self = UInt512(data: bytes)!
    }
}

// MARK: - CustomStringConvertible

extension UInt512: CustomStringConvertible {}
