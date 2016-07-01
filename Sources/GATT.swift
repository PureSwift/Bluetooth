//
//  GATT.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 2/29/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

import SwiftFoundation

/// Bluetooth GATT protocol
public struct GATT {
    
    /// GATT UUIDs
    public enum UUID: UInt16 {
        
        case PrimaryService         = 0x2800
        case SecondaryService       = 0x2801
        case Include                = 0x2802
        case Characteristic         = 0x2803
        
        /// Initializes a GATT UUID for service type.
        public init(primaryService: Bool) {
            
            self = primaryService ? .PrimaryService : .SecondaryService
        }
        
        /// Initializes from a Bluetooth UUID
        public init?(UUID: BluetoothUUID) {
            
            switch UUID  {
                
            case let .bit16(value):
                
                guard let gatt = GATT.UUID(rawValue: value)
                    else { return nil }
                
                self = gatt
                
            default: return nil
            }
        }
        
        /// Returns a Bluetooth UUID initialized with the `rawValue` of this GATT UUID.
        public func toUUID() -> BluetoothUUID {
            
            return .bit16(rawValue)
        }
    }
    
    /// GATT Characteristic Descriptors
    public enum CharacteristicDescriptor: UInt16 {
        
        case ExtendedProperty       = 0x2900
        
        // TODO: All Characteristic Descriptors
    }
    
    /// GATT Characteristic Properties Bitfield valuess
    public enum CharacteristicProperty: UInt8, BitMaskOption {
        
        case Broadcast              = 0x01
        case Read                   = 0x02
        case WriteWithoutResponse   = 0x04
        case Write                  = 0x08
        case Notify                 = 0x10
        case Indicate               = 0x20
        
        /// Characteristic supports write with signature
        case SignedWrite            = 0x40 // BT_GATT_CHRC_PROP_AUTH
        
        case ExtendedProperties     = 0x80
    }
    
    /// GATT Characteristic Extended Properties Bitfield values.
    public enum CharacteristicExtendedProperty: UInt8 {
        
        case ReliableWrite          = 0x01
        
        // TODO: All CharacteristicExtendedProperty
    }
}
