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

/// Bluetooth Address type.
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

