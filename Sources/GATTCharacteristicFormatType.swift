//
//  GATTCharacteristicFormatType.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

/// Characteristic Format Types
///
/// If a format is not a whole number of octets, then the data shall be contained within
/// the least significant bits of the value, and all other bits shall be set to zero on transmission
/// and ignored upon receipt.
///
/// If the Characteristic Value is less than an octet, it occupies an entire octet.
public struct GATTCharacteristicFormatType: RawRepresentable {
    
    public let length = 1
    
    public let rawValue: UInt8
    
    public init?(rawValue: UInt8) {
        
        guard rawValue <= 27
            else { return nil }
        
        self.rawValue = rawValue
    }
    
    public static let rfu: GATTCharacteristicFormatType = 0x00
    public static let boolean: GATTCharacteristicFormatType = 0x01
    public static let bit2: GATTCharacteristicFormatType = 0x02
    public static let nibble: GATTCharacteristicFormatType = 0x03
    public static let uint8: GATTCharacteristicFormatType = 0x04
    public static let uint12: GATTCharacteristicFormatType = 0x05
    public static let uint16: GATTCharacteristicFormatType = 0x06
    public static let uint24: GATTCharacteristicFormatType = 0x07
    public static let uint32: GATTCharacteristicFormatType = 0x08
    public static let uint48: GATTCharacteristicFormatType = 0x09
    public static let uint64: GATTCharacteristicFormatType = 0x0A
    public static let uint128: GATTCharacteristicFormatType = 0x0B
    public static let sint8: GATTCharacteristicFormatType = 0x0C
    public static let sint12: GATTCharacteristicFormatType = 0x0D
    public static let sint16: GATTCharacteristicFormatType = 0x0E
    public static let sint24: GATTCharacteristicFormatType = 0x0F
    public static let sint32: GATTCharacteristicFormatType = 0x10
    public static let sint48: GATTCharacteristicFormatType = 0x11
    public static let sint64: GATTCharacteristicFormatType = 0x12
    public static let sint128: GATTCharacteristicFormatType = 0x13
    public static let float32: GATTCharacteristicFormatType = 0x14
    public static let float64: GATTCharacteristicFormatType = 0x15
    public static let sfloat: GATTCharacteristicFormatType = 0x16
    public static let float: GATTCharacteristicFormatType = 0x17
    public static let duint16: GATTCharacteristicFormatType = 0x18
    public static let utf8s: GATTCharacteristicFormatType = 0x19
    public static let utf16s: GATTCharacteristicFormatType = 0x1A
    public static let `struct`: GATTCharacteristicFormatType = 0x1B
}

extension GATTCharacteristicFormatType: Equatable {
    
    public static func == (lhs: GATTCharacteristicFormatType, rhs: GATTCharacteristicFormatType) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

extension GATTCharacteristicFormatType: Hashable {
    
    public var hashValue: Int {
        
        return Int(rawValue)
    }
}

extension GATTCharacteristicFormatType: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt8) {
        
        self.rawValue = value
    }
}

extension GATTCharacteristicFormatType: CustomStringConvertible {
    
    public var name: String? {
        
        return characteristicFormatTypeNames[self]
    }
    
    public var description: String {
        
        return characteristicFormatTypeDescription[self] ?? rawValue.description
    }
}

internal let characteristicFormatTypeNames: [GATTCharacteristicFormatType: String] = [
    .rfu: "rfu",
    .boolean: "boolean",
    .bit2: "2bit",
    .nibble: "nibble",
    .uint8: "uint8",
    .uint12: "uint12",
    .uint16: "uint16",
    .uint24: "uint24",
    .uint32: "uint32",
    .uint48: "uint48",
    .uint64: "uint64",
    .uint128: "uint128",
    .sint8: "sint8",
    .sint12: "sint12",
    .sint16: "sint16",
    .sint24: "sint24",
    .sint32: "sint32",
    .sint48: "sint48",
    .sint64: "sint64",
    .sint128: "sint128",
    .float32: "float32",
    .float64: "float64",
    .sfloat: "SFLOAT",
    .float: "FLOAT",
    .duint16: "duint16",
    .utf8s: "utf8s",
    .utf16s: "utf16s",
    .struct: "struct"
]

internal let characteristicFormatTypeDescription: [GATTCharacteristicFormatType: String] = [
    .rfu: "Reserve for future use",
    .boolean: "unsigned 1-bit; 0=false, 1=true",
    .bit2: "unsigned 2-bit integer",
    .nibble: "unsigned 4-bit integer",
    .uint8: "unsigned 8-bit integer",
    .uint12: "unsigned 12-bit integer",
    .uint16: "unsigned 16-bit integer",
    .uint24: "unsigned 24-bit integer",
    .uint32: "unsigned 32-bit integer",
    .uint48: "unsigned 48-bit integer",
    .uint64: "unsigned 64-bit integer",
    .uint128: "unsigned 128-bit integer",
    .sint8: "signed 8-bit integer",
    .sint12: "signed 12-bit integer",
    .sint16: "signed 16-bit integer",
    .sint24: "signed 24-bit integer",
    .sint32: "signed 32-bit integer",
    .sint48: "signed 48-bit integer",
    .sint64: "signed 64-bit integer",
    .sint128: "signed 128-bit integer",
    .float32: "IEEE-754 32-bit floating point",
    .float64: "IEEE-754 64-bit floating point",
    .sfloat: "IEEE-11073 16-bit SFLOAT",
    .float: "IEEE-11073 32-bit FLOAT",
    .duint16: "IEEE-20601 format",
    .utf8s: "UTF-8 string",
    .utf16s: "UTF-16 string",
    .struct: "Opaque structure"
]
