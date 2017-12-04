//
//  UUID.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 3/4/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

import Foundation

/// Bluetooth UUID
public enum BluetoothUUID: Equatable {
    
    /// Bluetooth Base UUID
    public static let BaseUUID = UUID(uuid: (0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00,
        0x80, 0x00, 0x00, 0x80, 0x5F, 0x9B, 0x34, 0xFB))
    
    case bit16(UInt16)
    case bit128(UUID)
    
    /// Creates a random 128 bit Bluetooth UUID.
    public init() {
        
        self = .bit128(UUID())
    }
}

// MARK: - Equatable

public func == (lhs: BluetoothUUID, rhs: BluetoothUUID) -> Bool {
    
    switch (lhs, rhs) {
        
    case let (.bit16(lhsValue), .bit16(rhsValue)): return lhsValue == rhsValue
        
    case let (.bit128(lhsValue), .bit128(rhsValue)): return lhsValue == rhsValue
    
    default: return false
    }
}

// MARK: - CustomStringConvertible

extension BluetoothUUID: CustomStringConvertible {
    
    public var description: String {
        
        switch self {
            
        case let .bit16(value):
            
            let bytes = value.bytes
            
            return bytes.0.toHexadecimal() + bytes.1.toHexadecimal()
            
        case let .bit128(value):
            
            return value.description
        }
    }
}

// MARK: - Hashable

extension BluetoothUUID: Hashable {
    
    public var hashValue: Int {
        
        switch self {
            
        case let .bit16(value): return value.hashValue
        case let .bit128(value): return value.hashValue
        }
    }
}

// MARK: - RawRepresentable

extension BluetoothUUID: RawRepresentable {
    
    /// Initialize from a 128-bit UUID string.
    public init?(rawValue: String) {
        
        guard let uuid = UUID.init(rawValue: rawValue)
            else { return nil }
        
        self = .bit128(uuid)
    }
    
    public var rawValue: String {
        
        switch self {
            
        case let .bit16(value):
            
            let bytes = value.bigEndian.bytes
            
            return "0x" + bytes.0.toHexadecimal() + bytes.1.toHexadecimal()
            
        case let .bit128(UUID):
            
            return UUID.rawValue
        }
    }
}

// MARK: - DataConvertible

public extension BluetoothUUID {
    
    public init?(data: Data) {
        
        let byteValue = data
        
        switch byteValue.count {
            
        // 16 bit
        case 2:
            
            let value = UInt16(bytes: (byteValue[0], byteValue[1]))
            
            self = .bit16(value)
            
        // 128 bit
        case 16:
            
            let value = UUID(bytes: (byteValue[0], byteValue[1], byteValue[2], byteValue[3], byteValue[4], byteValue[5], byteValue[6], byteValue[7], byteValue[8], byteValue[9], byteValue[10], byteValue[11], byteValue[12], byteValue[13], byteValue[14], byteValue[15]))
            
            self = .bit128(value)
            
        default: return nil
        }
    }
    
    public var data: Data {
        
        switch self {
            
        case let .bit16(value):
            
            let bytes = value.bytes
            
            return Data(bytes: [bytes.0, bytes.1])
            
        case let .bit128(value):
            
            let bytes = value.bytes
            
            return Data(bytes: [bytes.0, bytes.1, bytes.2, bytes.3, bytes.4, bytes.5, bytes.6, bytes.7, bytes.8, bytes.9, bytes.10, bytes.11, bytes.12, bytes.13, bytes.14, bytes.15])
        }
    }
}

// MARK: - Byte Swap

public extension BluetoothUUID {
    
    /// A representation of this Bluetooth UUID with the byte order swapped.
    public var byteSwapped: BluetoothUUID {
        
        switch self {
            
        case let .bit16(value):
            
            return .bit16(value.byteSwapped)
            
        case let .bit128(value):
            
            return .bit128(UUID(uuid: (value.bytes.15,
                                       value.bytes.14,
                                       value.bytes.13,
                                       value.bytes.12,
                                       value.bytes.11,
                                       value.bytes.10,
                                       value.bytes.9,
                                       value.bytes.8,
                                       value.bytes.7,
                                       value.bytes.6,
                                       value.bytes.5,
                                       value.bytes.4,
                                       value.bytes.3,
                                       value.bytes.2,
                                       value.bytes.1,
                                       value.bytes.0)))
        }
    }
    
    /// Creates an address from its little-endian representation, changing the
    /// byte order if necessary.
    ///
    /// - Parameter value: A value to use as the little-endian representation of
    ///   the new address.
    public init(littleEndian value: BluetoothUUID) {
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
    public init(bigEndian value: BluetoothUUID) {
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
    public var littleEndian: BluetoothUUID {
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
    public var bigEndian: BluetoothUUID {
        #if _endian(big)
            return self
        #else
            return byteSwapped
        #endif
    }
}

// MARK: - Darwin Support

#if os(OSX) || os(iOS) || os(tvOS)
    
    import Foundation
    import CoreBluetooth
    
    public extension BluetoothUUID {
        
        public init(coreBluetooth: CBUUID) {
                        
            guard let UUID = BluetoothUUID(data: coreBluetooth.data)
                else { fatalError("Could not create Bluetooth UUID from \(coreBluetooth)") }
            
            self = UUID
        }
        
        public func toCoreBluetooth() -> CBUUID {
            
            return CBUUID(data: self.data)
        }
    }
    
#endif
