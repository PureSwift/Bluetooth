//
//  GATTCharacteristicExtendedProperties.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Bluetooth

/// GATT Characteristic Extended Properties Descriptor
///
/// The Characteristic Extended Properties descriptor defines additional Characteristic Properties.
///
/// If the Characteristic Extended Properties bit of the Characteristic Properties is set, then this descriptor exists.
/// The Characteristic Extended Properties descriptor is a bit field defining Reliable Write and Writeable Auxiliaries are enabled for the Characteristic.
/// This descriptor is readable without authentication and authorization being required.
@frozen
public struct GATTCharacteristicExtendedProperties: GATTDescriptor, OptionSet, Hashable, Sendable {
    
    public static var uuid: BluetoothUUID { .characteristicExtendedProperties }
    
    public var rawValue: UInt16
    
    public init(rawValue: UInt16) {
        self.rawValue = rawValue
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension GATTCharacteristicExtendedProperties: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral rawValue: RawValue) {
        self.init(rawValue: rawValue)
    }
}
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

// MARK: - GATTCharacteristicExtendedProperties

extension GATTCharacteristicExtendedProperties: CustomStringConvertible, CustomDebugStringConvertible {
    
    #if hasFeature(Embedded)
    public var description: String {
        "0x" + rawValue.toHexadecimal()
    }
    #else
    @inline(never)
    public var description: String {
        let descriptions: [(GATTCharacteristicExtendedProperties, StaticString)] = [
            (.reliableWrite, ".reliableWrite"),
            (.writableAuxiliaries, ".writableAuxiliaries")
        ]
        return buildDescription(descriptions)
    }
    #endif

    /// A textual representation of the file permissions, suitable for debugging.
    public var debugDescription: String { self.description }
}

// MARK: - Options

public extension GATTCharacteristicExtendedProperties {
    
    /// Reliable Write enabled
    static var reliableWrite: GATTCharacteristicExtendedProperties          { 0b01 }
    
    /// Writable Auxiliaries enabled
    static var writableAuxiliaries: GATTCharacteristicExtendedProperties    { 0b10 }
}
