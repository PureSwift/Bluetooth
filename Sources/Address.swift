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
    
    public init?(rawValue: String) {
        
        self.bytes = (0,0,0,0,0,0)
        
        fatalError("Bluetooth address parsing not implemented")
    }
    
    public var rawValue: String {
        
        let byteValue = [bytes.5, bytes.4, bytes.3, bytes.2, bytes.1, bytes.0]
        
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

extension Address: Equatable { }

public func == (lhs: Address, rhs: Address) -> Bool {
    
    return lhs.bytes.0 == rhs.bytes.0
        && lhs.bytes.1 == rhs.bytes.1
        && lhs.bytes.2 == rhs.bytes.2
        && lhs.bytes.3 == rhs.bytes.3
        && lhs.bytes.4 == rhs.bytes.4
        && lhs.bytes.5 == rhs.bytes.5
}

// MARK: - CustomStringConvertible

extension Address: CustomStringConvertible {
    
    public var description: String { return rawValue }
}
