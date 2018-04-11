//
//  UInt128.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 12/4/17.
//

import Foundation

/// A 128 bit number stored according to host endianness.
///
/// Unlike `NSUUID` which is always stored in big endian.
public struct UInt128: ByteValue {
    
    public typealias ByteValue = (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8)
    
    public static var bitWidth: Int { return 128 }
    
    public var bytes: ByteValue
    
    public init(bytes: ByteValue = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)) {
        
        self.bytes = bytes
    }
}

public extension UInt128 {
    
    /// The minimum representable value in this type.
    public static var min: UInt128 { return UInt128(bytes: (.min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min)) }
    
    /// The maximum representable value in this type.
    public static var max: UInt128 { return UInt128(bytes: (.max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max)) }
    
    /// The value with all bits set to zero.
    public static var zero: UInt128 { return .min }
}

// MARK: - Equatable

extension UInt128: Equatable {
    
    public static func == (lhs: UInt128, rhs: UInt128) -> Bool {
        
        return lhs.bytes.0 == rhs.bytes.0 &&
                lhs.bytes.1 == rhs.bytes.1 &&
                lhs.bytes.2 == rhs.bytes.2 &&
                lhs.bytes.3 == rhs.bytes.3 &&
                lhs.bytes.4 == rhs.bytes.4 &&
                lhs.bytes.5 == rhs.bytes.5 &&
                lhs.bytes.6 == rhs.bytes.6 &&
                lhs.bytes.7 == rhs.bytes.7 &&
                lhs.bytes.8 == rhs.bytes.8 &&
                lhs.bytes.9 == rhs.bytes.9 &&
                lhs.bytes.10 == rhs.bytes.10 &&
                lhs.bytes.11 == rhs.bytes.11 &&
                lhs.bytes.12 == rhs.bytes.12 &&
                lhs.bytes.13 == rhs.bytes.13 &&
                lhs.bytes.14 == rhs.bytes.14 &&
                lhs.bytes.15 == rhs.bytes.15
    }
}

// MARK: - Hashable

extension UInt128: Hashable {
    
    public var hashValue: Int {
        
        return data.hashValue
    }
}

// MARK: - CustomStringConvertible

extension UInt128: CustomStringConvertible {
    
    public var description: String {
        
        let bytes = self.bigEndian.bytes
        
        return bytes.0.toHexadecimal()
            + bytes.1.toHexadecimal()
            + bytes.2.toHexadecimal()
            + bytes.3.toHexadecimal()
            + bytes.4.toHexadecimal()
            + bytes.5.toHexadecimal()
            + bytes.6.toHexadecimal()
            + bytes.7.toHexadecimal()
            + bytes.8.toHexadecimal()
            + bytes.9.toHexadecimal()
            + bytes.10.toHexadecimal()
            + bytes.11.toHexadecimal()
            + bytes.12.toHexadecimal()
            + bytes.13.toHexadecimal()
            + bytes.14.toHexadecimal()
            + bytes.15.toHexadecimal()
    }
}

// MARK: - Data Convertible

public extension UInt128 {
    
    public static var length: Int { return 16 }
    
    public init?(data: Data) {
        
        guard data.count == UInt128.length else { return nil }
        
        self.init(bytes: (data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7], data[8], data[9], data[10], data[11], data[12], data[13], data[14], data[15]))
    }
    
    public var data: Data {
        
        return Data(bytes: [bytes.0, bytes.1, bytes.2, bytes.3, bytes.4, bytes.5, bytes.6, bytes.7, bytes.8, bytes.9, bytes.10, bytes.11, bytes.12, bytes.13, bytes.14, bytes.15])
    }
}

// MARK: - Byte Swap

extension UInt128: ByteSwap {
    
    /// A representation of this integer with the byte order swapped.
    public var byteSwapped: UInt128 {
        
        return UInt128(bytes: (bytes.15,
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
                               bytes.0))
    }
}

// MARK: - NSUUID

public extension UInt128 {
    
    public init(uuid: Foundation.UUID) {
        
        /// UUID is always big endian
        let bigEndian = UInt128(bytes: uuid.uuid)
        
        self.init(bigEndian: bigEndian)
    }
}

public extension Foundation.UUID {
    
    public init(_ value: UInt128) {
        
        // UUID is always stored in big endian bytes
        let bytes = value.bigEndian.bytes
        
        self.init(bytes: (bytes.0,
                          bytes.1,
                          bytes.2,
                          bytes.3,
                          bytes.4,
                          bytes.5,
                          bytes.6,
                          bytes.7,
                          bytes.8,
                          bytes.9,
                          bytes.10,
                          bytes.11,
                          bytes.12,
                          bytes.13,
                          bytes.14,
                          bytes.15))
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension UInt128: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt64) {
        
        let bytes = value.bigEndian.bytes
        
        self = UInt128(bigEndian: UInt128(bytes: (0, 0, 0, 0, 0, 0, 0, 0, bytes.0, bytes.1, bytes.2, bytes.3, bytes.4, bytes.5, bytes.6, bytes.7)))
    }
}
