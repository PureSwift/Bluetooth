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
@frozen
public enum GATTCharacteristicFormatType: UInt8 {
    
    case rfu = 0x00
    case boolean = 0x01
    case bit2 = 0x02
    case nibble = 0x03
    case uint8 = 0x04
    case uint12 = 0x05
    case uint16 = 0x06
    case uint24 = 0x07
    case uint32 = 0x08
    case uint48 = 0x09
    case uint64 = 0x0A
    case uint128 = 0x0B
    case sint8 = 0x0C
    case sint12 = 0x0D
    case sint16 = 0x0E
    case sint24 = 0x0F
    case sint32 = 0x10
    case sint48 = 0x11
    case sint64 = 0x12
    case sint128 = 0x13
    case float32 = 0x14
    case float64 = 0x15
    case sfloat = 0x16
    case float = 0x17
    case duint16 = 0x18
    case utf8s = 0x19
    case utf16s = 0x1A
    case `struct` = 0x1B
}

// MARK: - CustomStringConvertible

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
