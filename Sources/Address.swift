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

import SwiftFoundation

/// Bluetooth Address type.
public struct Address: ByteValueType {
    
    // MARK: - ByteValueType
    
    /// Raw Bluetooth Address 6 byte (48 bit) value.
    public typealias ByteValue = (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8)
    
    // MARK: - Properties
    
    public var byteValue: ByteValue
    
    // MARK: - Initialization
    
    public init(byteValue: ByteValue = (0,0,0,0,0,0)) {
        
        self.byteValue = byteValue
    }
}

// MARK: - RawRepresentable

extension Address: RawRepresentable {
    
    public init?(rawValue: String) {
        
        self.byteValue = (0,0,0,0,0,0)
        
        fatalError("Bluetooth address parsing not implemented")
    }
    
    public var rawValue: String {
        
        let bytes = [byteValue.5, byteValue.4, byteValue.3, byteValue.2, byteValue.1, byteValue.0]
        
        var string = ""
        
        for (index, byte) in bytes.enumerate() {
            
            string += byte.toHexadecimal()
            
            if index != bytes.count - 1 {
                
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
    
    return lhs.byteValue.0 == rhs.byteValue.0
        && lhs.byteValue.1 == rhs.byteValue.1
        && lhs.byteValue.2 == rhs.byteValue.2
        && lhs.byteValue.3 == rhs.byteValue.3
        && lhs.byteValue.4 == rhs.byteValue.4
        && lhs.byteValue.5 == rhs.byteValue.5
}

// MARK: - CustomStringConvertible

extension Address: CustomStringConvertible {
    
    public var description: String { return rawValue }
}

