//
//  UInt24.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/28/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

/// A 24 bit number stored according to host endianness.
@frozen
public struct UInt24: ByteValue, Sendable {
    
    public typealias ByteValue = (UInt8, UInt8, UInt8)
    
    public static var bitWidth: Int { return 24 }
    
    public var bytes: ByteValue
    
    public init(bytes: ByteValue = (0, 0, 0)) {
        
        self.bytes = bytes
    }
}

public extension UInt24 {
    
    /// The minimum representable value in this type.
    static var min: UInt24 { return UInt24(bytes: (.min, .min, .min)) }
    
    /// The maximum representable value in this type.
    static var max: UInt24 { return UInt24(bytes: (.max, .max, .max)) }
    
    /// The value with all bits set to zero.
    static var zero: UInt24 { return .min }
}

// MARK: - Comparable

extension UInt24: Comparable {
    
    public static func > (lhs: UInt24, rhs: UInt24) -> Bool {
        return UInt32(lhs) > UInt32(rhs)
    }
    
    public static func < (lhs: UInt24, rhs: UInt24) -> Bool {
        return UInt32(lhs) < UInt32(rhs)
    }
    
    public static func >= (lhs: UInt24, rhs: UInt24) -> Bool {
        return UInt32(lhs) >= UInt32(rhs)
    }
    
    public static func <= (lhs: UInt24, rhs: UInt24) -> Bool {
        return UInt32(lhs) <= UInt32(rhs)
    }
    
    public static func == (lhs: UInt24, rhs: UInt24) -> Bool {
        return lhs.bytes.0 == rhs.bytes.0
            && lhs.bytes.1 == rhs.bytes.1
            && lhs.bytes.2 == rhs.bytes.2
    }
}

// MARK: - Hashable

extension UInt24: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        UInt32(self).hash(into: &hasher)
    }
}

// MARK: - CustomStringConvertible

extension UInt24: CustomStringConvertible {
    
    public var description: String {
        let bytes = self.bigEndian.bytes
        return bytes.0.toHexadecimal()
             + bytes.1.toHexadecimal()
             + bytes.2.toHexadecimal()
    }
}

// MARK: - Data Convertible

extension UInt24: DataConvertible {
    
    public static var length: Int { return 3 }
    
    public init?<Data: DataContainer>(data: Data) {
        guard data.count == UInt24.length else { return nil }
        self.init(bytes: (data[0], data[1], data[2]))
    }
    
    public func append<Data>(to data: inout Data) where Data : DataContainer {
        data += [bytes.0, bytes.1, bytes.2]
    }
    
    public var dataLength: Int {
        Self.length
    }
}

// MARK: - Byte Swap

extension UInt24: ByteSwap {
    
    /// A representation of this integer with the byte order swapped.
    public var byteSwapped: UInt24 {
        return UInt24(bytes: (bytes.2, bytes.1, bytes.0))
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension UInt24: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt32) {
        self = UInt24(value)
    }
}

// MARK: - Integer Conversion

public extension UInt24 {
    
    /// Initialize from a unsigned 32-bit integer.
    init(_ value: UInt32) {
        guard value <= UInt32(UInt24.max)
            else { fatalError("Integer overflow") }
        let bytes = value.bigEndian.bytes
        self = UInt24(bigEndian: UInt24(bytes: (bytes.1, bytes.2, bytes.3)))
    }
}

public extension UInt32 {
    
    /// Initialize from a unsigned 24-bit integer.
    init(_ value: UInt24) {
        let bytes = value.bigEndian.bytes
        self = UInt32(bigEndian: UInt32(bytes: (0, bytes.0, bytes.1, bytes.2)))
    }
}

// MARK: - Codable

#if !hasFeature(Embedded)
extension UInt24: Codable {
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let value = try container.decode(UInt32.self)
        guard value <= UInt32(UInt24.max) else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Unable to decode \(value) as \(UInt24.self)"))
        }
        self.init(value)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        let value = UInt32(self)
        try container.encode(value)
    }
}
#endif
