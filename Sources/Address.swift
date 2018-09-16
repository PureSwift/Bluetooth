//
//  Address.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 12/6/15.
//  Copyright © 2015 PureSwift. All rights reserved.
//

import Foundation

/// Bluetooth address.
public struct Address: ByteValue {
    
    // MARK: - ByteValueType
    
    /// Raw Bluetooth Address 6 byte (48 bit) value.
    public typealias ByteValue = (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8)
    
    public static var bitWidth: Int { return 48 }
    
    // MARK: - Properties
    
    public var bytes: ByteValue
    
    // MARK: - Initialization
    
    public init(bytes: ByteValue = (0, 0, 0, 0, 0, 0)) {
        
        self.bytes = bytes
    }
}

public extension Address {
    
    /// The minimum representable value in this type.
    public static var min: Address { return Address(bytes: (.min, .min, .min, .min, .min, .min)) }
    
    /// The maximum representable value in this type.
    public static var max: Address { return Address(bytes: (.max, .max, .max, .max, .max, .max)) }
    
    public static var zero: Address { return .min }
    
    public static var any: Address { return .zero }
    
    public static var none: Address { return .max }
}

// MARK: - Data

public extension Address {
    
    public static var length: Int { return 6 }
    
    public init?(data: Data) {
        
        guard data.count == Address.length
            else { return nil }
        
        self.bytes = (data[0], data[1], data[2], data[3], data[4], data[5])
    }
    
    public var data: Data {
        
        return Data([bytes.0, bytes.1, bytes.2, bytes.3, bytes.4, bytes.5])
    }
}

// MARK: - Byte Swap

extension Address: ByteSwap {
    
    /// A representation of this address with the byte order swapped.
    public var byteSwapped: Address {
        
        return Address(bytes: (bytes.5, bytes.4, bytes.3, bytes.2, bytes.1, bytes.0))
    }
}

// MARK: - RawRepresentable

extension Address: RawRepresentable {
    
    /// Initialize a Bluetooth Address from its big endian string representation (e.g. `00:1A:7D:DA:71:13`).
    public init?(rawValue: String) {
        
        // verify string
        guard rawValue.utf8.count == 17
            else { return nil }
        
        var bytes: ByteValue = (0, 0, 0, 0, 0, 0)
        
        let components = rawValue.components(separatedBy: ":")
        
        guard components.count == 6
            else { return nil }
        
        for (index, string) in components.enumerated() {
            
            guard let byte = UInt8(string, radix: 16)
                else { return nil }
            
            withUnsafeMutablePointer(to: &bytes) {
                $0.withMemoryRebound(to: UInt8.self, capacity: 6) {
                    $0.advanced(by: index).pointee = byte
                }
            }
        }
        
        self.init(bigEndian: Address(bytes: bytes))
    }
    
    public var rawValue: String {
        
        let bytes = self.bigEndian.bytes
        
        return String(format: "%02X:%02X:%02X:%02X:%02X:%02X", bytes.0, bytes.1, bytes.2, bytes.3, bytes.4, bytes.5)
    }
}

// MARK: - Equatable

extension Address: Equatable {
    
    public static func == (lhs: Address, rhs: Address) -> Bool {
        
        return lhs.bytes.0 == rhs.bytes.0
            && lhs.bytes.1 == rhs.bytes.1
            && lhs.bytes.2 == rhs.bytes.2
            && lhs.bytes.3 == rhs.bytes.3
            && lhs.bytes.4 == rhs.bytes.4
            && lhs.bytes.5 == rhs.bytes.5
    }
}

// MARK: - Hashable

extension Address: Hashable {
    
    public var hashValue: Int {
        
        let int64Bytes = (bytes.0, bytes.1, bytes.2, bytes.3, bytes.4, bytes.5, UInt8(0), UInt8(0)) // 2 bytes for padding
        
        let int64Value = unsafeBitCast(int64Bytes, to: Int64.self)
        
        return int64Value.hashValue
    }
}

// MARK: - CustomStringConvertible

extension Address: CustomStringConvertible {
    
    public var description: String { return rawValue }
}
