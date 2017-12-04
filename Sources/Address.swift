//
//  Address.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 12/6/15.
//  Copyright © 2015 PureSwift. All rights reserved.
//

#if os(Linux)
    import Glibc
#elseif os(OSX) || os(iOS)
    import Darwin.C
#endif

import Foundation

/// Bluetooth address.
public struct Address: ByteValue {
    
    public static var zero: Address { return Address(bytes: (0, 0, 0, 0, 0, 0)) }
    
    public static var any: Address { return Address(bytes: (0, 0, 0, 0, 0, 0)) }
    
    public static var none: Address { return Address(bytes: (0xff, 0xff, 0xff, 0xff, 0xff, 0xff)) }
    
    // MARK: - ByteValueType
    
    /// Raw Bluetooth Address 6 byte (48 bit) value.
    public typealias ByteValue = (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8)
    
    // MARK: - Properties
    
    public var bytes: ByteValue
    
    // MARK: - Initialization
    
    public init(bytes: ByteValue = (0,0,0,0,0,0)) {
        
        self.bytes = bytes
    }
}

// MARK: - Data

public extension Address {
    
    public init?(data: Data) {
        
        guard data.count == 6
            else { return nil }
        
        self.bytes = (data[0], data[1], data[2], data[3], data[4], data[5])
    }
    
    public var data: Data {
        
        return Data([bytes.0, bytes.1, bytes.2, bytes.3, bytes.4, bytes.5])
    }
}

// MARK: - Byte Swap

public extension Address {
    
    /// A representation of this address with the byte order swapped.
    public var byteSwapped: Address {
        
        return Address(bytes: (bytes.5, bytes.4, bytes.3, bytes.2, bytes.1, bytes.0))
    }
    
    /// Creates an address from its little-endian representation, changing the
    /// byte order if necessary.
    ///
    /// - Parameter value: A value to use as the little-endian representation of
    ///   the new address.
    public init(littleEndian value: Address) {
        #if _endian(little)
            self = value
        #else
            self = value.byteSwapped
        #endif
    }
    
    /// Creates an address from its big-endian representation, changing the byte
    /// order if necessary.
    ///
    /// - Parameter value: A value to use as the big-endian representation of the
    ///   new address.
    public init(bigEndian value: Address) {
        #if _endian(big)
            self = value
        #else
            self = value.byteSwapped
        #endif
    }
    
    /// The little-endian representation of this address.
    ///
    /// If necessary, the byte order of this value is reversed from the typical
    /// byte order of this address. On a little-endian platform, for any
    /// address `x`, `x == x.littleEndian`.
    public var littleEndian: Address {
        #if _endian(little)
            return self
        #else
            return byteSwapped
        #endif
    }
    
    /// The big-endian representation of this address.
    ///
    /// If necessary, the byte order of this value is reversed from the typical
    /// byte order of this address. On a big-endian platform, for any
    /// address `x`, `x == x.bigEndian`.
    public var bigEndian: Address {
        #if _endian(big)
            return self
        #else
            return byteSwapped
        #endif
    }
}

// MARK: - RawRepresentable

extension Address: RawRepresentable {
    
    /// Initialize a Bluetooth Address from its big endian string representation (e.g. `00:1A:7D:DA:71:13`).
    public init?(rawValue: String) {
        
        // verify string
        guard rawValue.utf8.count == 17
            else { return nil }
        
        var bytes = [UInt8](repeating: 0, count: 6)
        
        // parse bytes
        guard rawValue.withCString({ (cString) -> Bool in
            
            // parse
            var cString = cString
            for index in (0 ..< 6) {
                
                let number = strtol(cString, nil, 16)
                
                guard let byte = UInt8.init(exactly: number)
                    else { return false }
                
                bytes[index] = byte
                cString = cString.advanced(by: 3)
            }
            
            return true
            
        }) else { return nil }
        
        guard let address = Address(data: Data(bytes))
            else { return nil }
        
        self.init(bigEndian: address)
    }
    
    public var rawValue: String {
        
        let bytes = self.bigEndian.bytes
        
        let byteValue = [bytes.0, bytes.1, bytes.2, bytes.3, bytes.4, bytes.5]
        
        var string = ""
        
        for (index, byte) in byteValue.enumerated() {
            
            string += byte.toHexadecimal()
            
            if index != byteValue.count - 1 {
                
                string += ":"
            }
        }
        
        assert(string.utf8.count == 17, "\"\(string)\" should be 17 characters")
        
        return string
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

// MARK: - CustomStringConvertible

extension Address: CustomStringConvertible {
    
    public var description: String { return rawValue }
}
