//
//  UUID.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 3/4/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

import Foundation

/// Bluetooth UUID
///
/// No matter the system: 128-bit UUIDs should be stored
/// as big-endian. 16-bit UUIDs are stored on host order.
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
            
            /// UUID always produces big endian string.
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

// MARK: - Little Endian Bytes

public extension BluetoothUUID {
    
    /// Creates an UUID from its little-endian representation, changing the byte order if necessary.
    ///
    /// No matter the system: 128-bit UUIDs should be stored
    /// as big-endian. 16-bit UUIDs are stored on host order.
    init?(littleEndian byteValue: [UInt8]) {
        
        guard let littleEndianUUID = BluetoothUUID(data: Data(bytes: byteValue))
            else { return nil }
        
        switch littleEndianUUID {
            
        case let .bit16(value):
            
            let currentEndian = UInt16(littleEndian: value)
            
            self = .bit16(currentEndian)
            
        case let .bit128(value):
            
            #if _endian(little)
                let bigEndian = UUID(data: Data(byteValue.reversed()))
            #else
                let bigEndian = UUID(data: Data(byteValue))
            #endif
            
            self = .bit128(bigEndian)
        }
    }
    
    /// Exports the UUID bytes in its little endian representation,  changing the byte order if necessary.
    ///
    /// No matter the system: 128-bit UUIDs should be stored
    /// as big-endian. 16-bit UUIDs are stored on host order.
    var littleEndian: [UInt8] {
        
        switch self {
            
        case let .bit16(value):
            
            let bytes = value.littleEndian.bytes
            
            return [bytes.0, bytes.1]
            
        case let .bit128(value):
            
            #if _endian(little)
                return [UInt8](value.toData())
            #else
                return [UInt8](value.toData().reversed()) // byteSwapped
            #endif
        }
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
