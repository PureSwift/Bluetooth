//
//  UInt256.swift
//  Bluetooth
//
//  Created by Marco Estrella on 4/21/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// A 256 bit number stored according to host endianness.
public struct UInt256: ByteValue {
    
    public typealias ByteValue = (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8)
    
    public static var bitWidth: Int { return 256 }
    
    public var bytes: ByteValue
    
    public init(bytes: ByteValue = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)) {
        
        self.bytes = bytes
    }
}

public extension UInt256 {
    
    /// The minimum representable value in this type.
    public static var min: UInt256 { return UInt256(bytes: (.min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min, .min)) }
    
    /// The maximum representable value in this type.
    public static var max: UInt256 { return UInt256(bytes: (.max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max, .max)) }
    
    /// The value with all bits set to zero.
    public static var zero: UInt256 { return .min }
}

// MARK: - Equatable

extension UInt256: Equatable {
    
    public static func == (lhs: UInt256, rhs: UInt256) -> Bool {
        
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
            lhs.bytes.15 == rhs.bytes.15 &&
            lhs.bytes.16 == rhs.bytes.16 &&
            lhs.bytes.17 == rhs.bytes.17 &&
            lhs.bytes.18 == rhs.bytes.18 &&
            lhs.bytes.19 == rhs.bytes.19 &&
            lhs.bytes.20 == rhs.bytes.20 &&
            lhs.bytes.21 == rhs.bytes.21 &&
            lhs.bytes.22 == rhs.bytes.22 &&
            lhs.bytes.23 == rhs.bytes.23 &&
            lhs.bytes.24 == rhs.bytes.24 &&
            lhs.bytes.25 == rhs.bytes.25 &&
            lhs.bytes.26 == rhs.bytes.26 &&
            lhs.bytes.27 == rhs.bytes.27 &&
            lhs.bytes.28 == rhs.bytes.28 &&
            lhs.bytes.29 == rhs.bytes.29 &&
            lhs.bytes.30 == rhs.bytes.30 &&
            lhs.bytes.31 == rhs.bytes.31
    }
}

// MARK: - Hashable

extension UInt256: Hashable {
    
    public var hashValue: Int {
        
        return data.hashValue
    }
}

// MARK: - CustomStringConvertible

extension UInt256: CustomStringConvertible {
    
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
            + bytes.16.toHexadecimal()
            + bytes.17.toHexadecimal()
            + bytes.18.toHexadecimal()
            + bytes.19.toHexadecimal()
            + bytes.20.toHexadecimal()
            + bytes.21.toHexadecimal()
            + bytes.22.toHexadecimal()
            + bytes.23.toHexadecimal()
            + bytes.24.toHexadecimal()
            + bytes.25.toHexadecimal()
            + bytes.26.toHexadecimal()
            + bytes.27.toHexadecimal()
            + bytes.28.toHexadecimal()
            + bytes.29.toHexadecimal()
            + bytes.30.toHexadecimal()
            + bytes.31.toHexadecimal()
    }
}

// MARK: - Data Convertible

public extension UInt256 {
    
    public static var length: Int { return 32 }
    
    public init?(data: Data) {
        
        guard data.count == UInt128.length else { return nil }
        
        self.init(bytes: (data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7], data[8], data[9], data[10], data[11], data[12], data[13], data[14], data[15], data[16], data[17], data[18], data[19], data[20], data[21], data[22], data[23], data[24], data[25], data[26], data[27], data[28], data[29], data[30], data[31]))
    }
    
    public var data: Data {
        
        return Data(bytes: [bytes.0, bytes.1, bytes.2, bytes.3, bytes.4, bytes.5, bytes.6, bytes.7, bytes.8, bytes.9, bytes.10, bytes.11, bytes.12, bytes.13, bytes.14, bytes.15, bytes.16, bytes.17, bytes.18, bytes.19, bytes.20, bytes.21, bytes.22, bytes.23, bytes.24, bytes.25, bytes.26, bytes.27, bytes.28, bytes.29, bytes.30, bytes.31])
    }
}

// MARK: - Byte Swap

extension UInt256: ByteSwap {
    
    /// A representation of this integer with the byte order swapped.
    public var byteSwapped: UInt256 {
        
        return UInt256(bytes: (bytes.31,
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
                               bytes.0))
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension UInt256: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt64) {
        
        let bytes = value.bigEndian.bytes
        
        self = UInt256(bigEndian: UInt256(bytes: (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, bytes.0, bytes.1, bytes.2, bytes.3, bytes.4, bytes.5, bytes.6, bytes.7)))
    }
}
