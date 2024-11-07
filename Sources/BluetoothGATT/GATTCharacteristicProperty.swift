//
//  GATTCharacteristicProperty.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 11/7/24.
//

/// GATT Characteristic Properties Bitfield valuess
public struct GATTCharacteristicProperty: OptionSet, Hashable, Sendable {
    
    public var rawValue: UInt8
    
    public init(rawValue: UInt8) {
        self.rawValue = rawValue
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension GATTCharacteristicProperty: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt8) {
        self.rawValue = value
    }
}

// MARK: CustomStringConvertible

extension GATTCharacteristicProperty: CustomStringConvertible, CustomDebugStringConvertible {
    
    #if hasFeature(Embedded)
    public var description: String {
        rawValue.description
    }
    #else
    @inline(never)
    public var description: String {
        let descriptions: [(GATTCharacteristicProperty, StaticString)] = [
            (.broadcast,            ".broadcast"),
            (.read,                 ".read"),
            (.write,                ".write"),
            (.notify,               ".notify"),
            (.indicate,             ".indicate"),
            (.signedWrite,          ".signedWrite"),
            (.extendedProperties,   ".extendedProperties")
        ]
        return buildDescription(descriptions)
    }
    #endif

    /// A textual representation of the file permissions, suitable for debugging.
    public var debugDescription: String { self.description }
}

// MARK: - Options

public extension GATTCharacteristicProperty {
    
    static var broadcast: GATTCharacteristicProperty            { 0x01 }
    static var read: GATTCharacteristicProperty                 { 0x02 }
    static var writeWithoutResponse: GATTCharacteristicProperty { 0x04 }
    static var write: GATTCharacteristicProperty                { 0x08 }
    static var notify: GATTCharacteristicProperty               { 0x10 }
    static var indicate: GATTCharacteristicProperty             { 0x20 }
    
    /// Characteristic supports write with signature
    static var signedWrite: GATTCharacteristicProperty          { 0x40 } // BT_GATT_CHRC_PROP_AUTH
    
    static var extendedProperties: GATTCharacteristicProperty   { 0x80 }
}
