//
//  UUID.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 3/4/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

import struct SwiftFoundation.UUID
import struct SwiftFoundation.Data
import protocol SwiftFoundation.EndianConvertible
import protocol SwiftFoundation.DataConvertible
import SwiftFoundation // UInt16(littleEndian:)

/// Bluetooth UUID
public enum UUID: Equatable {
    
    /// Bluetooth Base UUID
    public static let BaseUUID = SwiftFoundation.UUID(byteValue: (0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00,
        0x80, 0x00, 0x00, 0x80, 0x5F, 0x9B, 0x34, 0xFB))
    
    case Bit16(UInt16)
    case Bit128(SwiftFoundation.UUID)
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

extension Bluetooth.UUID: DataConvertible {
    
    public init?(data: Data) {
        
        let byteValue = data.byteValue
        
        switch byteValue.count {
        
        // 16 bit
        case 2:
            
            let value = UInt16(littleEndian: (byteValue[0], byteValue[1]))
            
            self = .Bit16(value)
        
        // 128 bit
        case 16:
            
            let value = SwiftFoundation.UUID(byteValue: (byteValue[0], byteValue[1], byteValue[2], byteValue[3], byteValue[4], byteValue[5], byteValue[6], byteValue[7], byteValue[8], byteValue[9], byteValue[10], byteValue[11], byteValue[12], byteValue[13], byteValue[14], byteValue[15]))
            
            self = .Bit128(value)
            
        default: return nil
        }
    }
    
    public func toData() -> Data {
        
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

// MARK: - UUID Conversion

public extension SwiftFoundation.UUID {
    
    /// Converts a Bluetooth UUID to a universal UUID.
    init(_ UUID: Bluetooth.UUID) {
        
        switch UUID {
            
        case let .Bit128(value):
            
            self.init(byteValue: value.byteValue)
            
        case let .Bit16(value):
            
            let bytes = value.littleEndianBytes
            
            var byteValue = Bluetooth.UUID.BaseUUID.byteValue
            
            // replace empty bytes with UInt16 bytes
            byteValue.0 = bytes.0
            byteValue.1 = bytes.1
            
            self.init(byteValue: byteValue)
        }
    }
}

// MARK: - Darwin Support

#if os(OSX) || os(iOS) || os(tvOS)
    
    import CoreBluetooth
    import protocol SwiftFoundation.FoundationConvertible
    
    extension Bluetooth.UUID: FoundationConvertible {
        
        public init(foundation: CBUUID) {
            
            let data = Data(foundation: foundation.data)
            
            guard let UUID = Bluetooth.UUID(data: data)
                else { fatalError("Could not create Bluetooth UUID from \(foundation)") }
            
            self = UUID
        }
        
        public func toFoundation() -> CBUUID {
        
            return CBUUID(data: self.toData().toFoundation())
        }
    }
    
#endif
