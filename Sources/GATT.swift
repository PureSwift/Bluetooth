//
//  GATT.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 2/29/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

import Foundation

/// Bluetooth GATT protocol
public struct GATT {
    
    /// GATT UUIDs
    public enum UUID: UInt16 {
        
        case primaryService         = 0x2800
        case secondaryService       = 0x2801
        case include                = 0x2802
        case characteristic         = 0x2803
        
        /// Initializes a GATT UUID for service type.
        public init(primaryService: Bool) {
            
            self = primaryService ? .primaryService : .secondaryService
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
        
        case extendedProperty       = 0x2900
        
        // TODO: All Characteristic Descriptors
    }
    
    /// GATT Characteristic Properties Bitfield valuess
    public enum CharacteristicProperty: UInt8, BitMaskOption {

        
        case broadcast              = 0x01
        case read                   = 0x02
        case writeWithoutResponse   = 0x04
        case write                  = 0x08
        case notify                 = 0x10
        case indicate               = 0x20
        
        /// Characteristic supports write with signature
        case signedWrite            = 0x40 // BT_GATT_CHRC_PROP_AUTH
        
        case extendedProperties     = 0x80
        
        public static let all: Set<CharacteristicProperty> = [.broadcast,
                                                              .read,
                                                              .writeWithoutResponse,
                                                              .write,
                                                              .notify,
                                                              .indicate,
                                                              .signedWrite,
                                                              .extendedProperties]
        
        #if swift(>=3.1)
        #elseif swift(>=3.0)
        public typealias RawValue = UInt8
        #endif
    }
    
    /// GATT Characteristic Extended Properties Bitfield values.
    /// 
    /// The Characteristic Extended Properties bit field describes additional 
    /// properties on how the Characteristic Value can be used, or how the characteristic 
    /// descriptors can be accessed.
    public enum CharacteristicExtendedProperty: UInt8 {
        
        /// If set, permits reliable writes of the Characteristic Value.
        case reliableWrite          = 0x01
        
        ///
        case writableAuxiliaries    = 0x02
    }
}
