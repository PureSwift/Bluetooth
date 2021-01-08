//
//  GATT.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 2/29/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

import Foundation
@_exported import Bluetooth

/**
 The Generic Attributes (GATT) define a hierarchical data structure that is exposed to connected Bluetooth Low Energy (LE) devices.
 
 GATT profiles enable extensive innovation while still maintaining full interoperability with other Bluetooth® devices. The profile describes a use case, roles and general behaviors based on the GATT functionality. Services are collections of characteristics and relationships to other services that encapsulate the behavior of part of a device. This also includes hierarchy of services, characteristics and attributes used in the attribute server.
 
 GATT is built on top of the Attribute Protocol (ATT) (see Bluetooth Core System Architecture for block diagram and explanations), which uses GATT data to define the way that two Bluetooth Low Energy devices send and receive standard messages. Note that GATT is not used in Bluetooth BR/EDR implementations, which use only adopted profiles.
 */
internal enum GATTUUID: UInt16 {
    
    case primaryService         = 0x2800
    case secondaryService       = 0x2801
    case include                = 0x2802
    case characteristic         = 0x2803
    
    /// Initializes a GATT UUID for service type.
    public init(primaryService: Bool) {
        self = primaryService ? .primaryService : .secondaryService
    }
    
    /// Returns a Bluetooth UUID initialized with the `rawValue` of this GATT UUID.
    public var uuid: BluetoothUUID {
        return .bit16(rawValue)
    }
}

// MARK: - Characteristic Property

/// GATT Characteristic Properties Bitfield valuess
@frozen
public enum GATTCharacteristicProperty: UInt8, BitMaskOption {
    
    case broadcast              = 0x01
    case read                   = 0x02
    case writeWithoutResponse   = 0x04
    case write                  = 0x08
    case notify                 = 0x10
    case indicate               = 0x20
    
    /// Characteristic supports write with signature
    case signedWrite            = 0x40 // BT_GATT_CHRC_PROP_AUTH
    
    case extendedProperties     = 0x80
}

// MARK: CustomStringConvertible

extension GATTCharacteristicProperty: CustomStringConvertible {
    
    public var description: String {
        
        switch self {
        case .broadcast:                return "Broadcast"
        case .read:                     return "Read"
        case .write:                    return "Write"
        case .writeWithoutResponse:     return "Write without Response"
        case .notify:                   return "Notify"
        case .indicate:                 return "Indicate"
        case .signedWrite:              return "Signed Write"
        case .extendedProperties:       return "Extended Properties"
        }
    }
}

// MARK: - Characteristic Extended Property

/// GATT Characteristic Extended Properties Bitfield values.
///
/// The Characteristic Extended Properties bit field describes additional
/// properties on how the Characteristic Value can be used, or how the characteristic
/// descriptors can be accessed.
@frozen
public enum GATTCharacteristicExtendedProperty: UInt8 {
    
    /// If set, permits reliable writes of the Characteristic Value.
    case reliableWrite          = 0x01
    
    ///
    case writableAuxiliaries    = 0x02
}
