//
//  GATTCharacteristicExtendedProperties.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Characteristic Extended Properties
/// GATT Characteristic Extended Properties Descriptor
///
/// The Characteristic Extended Properties descriptor defines additional Characteristic Properties.
///
/// If the Characteristic Extended Properties bit of the Characteristic Properties is set, then this descriptor exists.
/// The Characteristic Extended Properties descriptor is a bit field defining Reliable Write and Writeable Auxiliaries are enabled for the Characteristic.
/// This descriptor is readable without authentication and authorization being required.
@frozen
public struct GATTCharacteristicExtendedProperties: GATTDescriptor {
    
    public static let uuid: BluetoothUUID = .characteristicExtendedProperties
    
    public static let length = 2
    
    public var properties: BitMaskOptionSet<Property>
    
    public init(properties: BitMaskOptionSet<Property> = []) {
        
        self.properties = properties
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let rawValue = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
        
        self.properties = BitMaskOptionSet<Property>(rawValue: rawValue)
    }
    
    public var data: Data {
        
        let bytes = properties.rawValue.littleEndian.bytes
        
        return Data([bytes.0, bytes.1])
    }
    
    public var descriptor: GATTAttribute.Descriptor {
        
        return GATTAttribute.Descriptor(uuid: type(of: self).uuid,
                               value: data,
                               permissions: [.read])
    }
}

public extension GATTCharacteristicExtendedProperties {
    
    /// GATT Characteristic Extended Properties Options
    enum Property: UInt16, BitMaskOption {
        
        /// Reliable Write enabled
        case reliableWrite = 0b01
        
        /// Writable Auxiliaries enabled
        case writableAuxiliaries = 0b10
        
        public static let allCases: [Property] = [.reliableWrite, .writableAuxiliaries]
    }
}
