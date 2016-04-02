//
//  UUID.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 3/4/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

import struct SwiftFoundation.UUID

/// Bluetooth UUID
public enum UUID: Equatable {
    
    /// Bluetooth Base UUID
    public static let BaseUUID = SwiftFoundation.UUID(byteValue: (0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00,
        0x80, 0x00, 0x00, 0x80, 0x5F, 0x9B, 0x34, 0xFB))
    
    case Bit16(UInt16)
    case Bit128(SwiftFoundation.UUID)
    
    public var data: Data {
        
        switch self {
            
        case let .Bit16(value):
            
            let bytes = value.littleEndianBytes
            
            return Data(byteValue: [bytes.0, bytes.1])
            
        case let .Bit128(value):
            
            let bytes = value.byteValue
            
            return Data(byteValue: [bytes.0, bytes.1, bytes.2, bytes.3, bytes.4, bytes.5, bytes.6, bytes.7, bytes.8, bytes.9, bytes.10, bytes.11, bytes.12, bytes.13, bytes.14, bytes.15])
        }
    }
}

// MARK: - Equatable

public func == (lhs: Bluetooth.UUID, rhs: Bluetooth.UUID) -> Bool {
    
    switch (lhs, rhs) {
        
    case let (.Bit16(lhsValue), .Bit16(rhsValue)): return lhsValue == rhsValue
        
    case let (.Bit128(lhsValue), .Bit128(rhsValue)): return lhsValue == rhsValue
        
    default: return false
    }
}

// MARK: - DataConvertible

extension Bluetooth.UUID {
    
    
}

// MARK: - UUID Conversion

public extension SwiftFoundation.UUID {
    
    /// Converts a Bluetooth UUID to a universal UUID.
    init(_ UUID: Bluetooth.UUID) {
        
        switch self {
            
        case let .Bit128(value): return value
            
        case let .Bit16(value):
            
            let bytes = value.littleEndianBytes
            
            var byteValue = BluetoothUUID.BaseUUID.byteValue
            
            // replace empty bytes with UInt16 bytes
            byteValue.0 = bytes.0
            byteValue.1 = bytes.1
            
            return SwiftFoundation.UUID(byteValue: byteValue)
        }
    }
}

