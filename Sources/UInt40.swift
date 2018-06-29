//
//  UInt40.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/28/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// A 40 bit number stored according to host endianness.
public struct UInt40: ByteValue {
    
    public typealias ByteValue = (UInt8, UInt8, UInt8, UInt8, UInt8)
    
    public static var bitWidth: Int { return 40 }
    
    public var bytes: ByteValue
    
    public init(bytes: ByteValue = (0, 0, 0, 0, 0)) {
        
        self.bytes = bytes
    }
}

public extension UInt40 {
    
    /// The minimum representable value in this type.
    public static var min: UInt40 { return UInt40(bytes: (.min, .min, .min, .min, .min)) }
    
    /// The maximum representable value in this type.
    public static var max: UInt40 { return UInt40(bytes: (.max, .max, .max, .max, .max)) }
    
    /// The value with all bits set to zero.
    public static var zero: UInt40 { return .min }
}

// MARK: - Equatable

extension UInt40: Equatable {
    
    public static func == (lhs: UInt40, rhs: UInt40) -> Bool {
        
        return lhs.bytes.0 == rhs.bytes.0 &&
            lhs.bytes.1 == rhs.bytes.1 &&
            lhs.bytes.2 == rhs.bytes.2 &&
            lhs.bytes.3 == rhs.bytes.3 &&
            lhs.bytes.4 == rhs.bytes.4
    }
}

// MARK: - Hashable

extension UInt40: Hashable {
    
    public var hashValue: Int {
        
        return UInt64(self).hashValue
    }
}

// MARK: - CustomStringConvertible

extension UInt40: CustomStringConvertible {
    
    public var description: String {
        
        let bytes = self.bigEndian.bytes
        
        return bytes.0.toHexadecimal()
            + bytes.1.toHexadecimal()
            + bytes.2.toHexadecimal()
            + bytes.3.toHexadecimal()
            + bytes.4.toHexadecimal()
    }
}

// MARK: - Data Convertible

public extension UInt40 {
    
    public static var length: Int { return 5 }
    
    public init?(data: Data) {
        
        guard data.count == UInt40.length else { return nil }
        
        self.init(bytes: (data[0], data[1], data[2], data[3], data[4]))
    }
    
    public var data: Data {
        
        return Data(bytes: [bytes.0, bytes.1, bytes.2, bytes.3, bytes.4])
    }
}

// MARK: - Byte Swap

extension UInt40: ByteSwap {
    
    /// A representation of this integer with the byte order swapped.
    public var byteSwapped: UInt40 {
        
        return UInt40(bytes: (bytes.4, bytes.3, bytes.2, bytes.1, bytes.0))
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension UInt40: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt64) {
        
        self = UInt40(value)
    }
}

// MARK: - Integer Conversion

public extension UInt40 {
    
    /// Initialize from a unsigned 64-bit integer.
    init(_ value: UInt64) {
        
        guard value <= UInt64(UInt40.max)
            else { fatalError("Integer overflow") }
        
        let bytes = value.bigEndian.bytes
        
        self = UInt40(bigEndian: UInt40(bytes: (bytes.3, bytes.4, bytes.5, bytes.6, bytes.7)))
    }
}

public extension UInt64 {
    
    /// Initialize from a unsigned 40-bit integer.
    init(_ value: UInt40) {
        
        let bytes = value.bigEndian.bytes
        
        self = UInt64(bigEndian: UInt64(bytes: (0, 0, 0, bytes.0, bytes.1, bytes.2, bytes.3, bytes.4)))
    }
}
