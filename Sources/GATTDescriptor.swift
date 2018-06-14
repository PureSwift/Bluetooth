//
//  CharacteristicDescriptor.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 4/17/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Characteristic Descriptor

public extension GATT {
    
    /// GATT Characteristic Descriptors
    public enum CharacteristicDescriptor {
        
        /// GATT Characteristic Descriptors
        public enum UUID {
            
            /// Characteristic Extended Properties
            public static var extendedProperties: BluetoothUUID { return .characteristicExtendedProperties }
            
            /// Characteristic User Description Descriptor
            public static var userDescription: BluetoothUUID { return .characteristicUserDescription }
            
            /// Client Characteristic Configuration Descriptor
            public static var clientConfiguration: BluetoothUUID { return .clientCharacteristicConfiguration }
            
            /// Server Characteristic Configuration Descriptor
            public static var serverConfiguration: BluetoothUUID { return .serverCharacteristicConfiguration }
            
            /// Characteristic Format Descriptor
            public static var format: BluetoothUUID { return .characteristicFormat }
            
            /// Characteristic Aggregate Format Descriptor
            public static var aggregateFormat: BluetoothUUID { return .characteristicAggregateFormat }
        }
    }
}

/// GATT Characteristic Descriptor
public protocol GATTDescriptor {
    
    static var uuid: BluetoothUUID { get }
    
    init?(byteValue: Data)
    
    var byteValue: Data { get }
    
    var descriptor: GATT.Descriptor { get }
}

public extension GATT.CharacteristicDescriptor {
    
    public typealias ClientConfiguration = GATTClientCharacteristicConfiguration
    public typealias ExtendedProperties = GATTCharacteristicExtendedProperties
    public typealias ServerConfiguration = GATTServerCharacteristicConfiguration
    public typealias AggegateFormat = GATTAggregateFormatDescriptor
    public typealias Format = GATTFormatDescriptor
    public typealias UserDescription = GATTUserDescription
    public typealias ReportReference = GATTReportReference
    public typealias TimeTriggerSetting = GATTTimeTriggerSetting
    public typealias ExternalReportReference = GATTExternalReportReference
    public typealias NumberOfDigitals = GATTNumberOfDigitals
}

// MARK: - Characteristic Format Types
/// Characteristic Format Types
///
/// If a format is not a whole number of octets, then the data shall be contained within
/// the least significant bits of the value, and all other bits shall be set to zero on transmission
/// and ignored upon receipt.
///
/// If the Characteristic Value is less than an octet, it occupies an entire octet.
public struct CharacteristicFormatType: RawRepresentable {
    
    public let length = 1
    
    public var rawValue: UInt8
    
    public init?(rawValue: UInt8) {
        
        guard rawValue <= 27
            else { return nil }
        
        self.rawValue = rawValue
    }
    
    public static let rfu: CharacteristicFormatType = 0x00
    public static let boolean: CharacteristicFormatType = 0x01
    public static let bit2: CharacteristicFormatType = 0x02
    public static let nibble: CharacteristicFormatType = 0x03
    public static let uint8: CharacteristicFormatType = 0x04
    public static let uint12: CharacteristicFormatType = 0x05
    public static let uint16: CharacteristicFormatType = 0x06
    public static let uint24: CharacteristicFormatType = 0x07
    public static let uint32: CharacteristicFormatType = 0x08
    public static let uint48: CharacteristicFormatType = 0x09
    public static let uint64: CharacteristicFormatType = 0x0A
    public static let uint128: CharacteristicFormatType = 0x0B
    public static let sint8: CharacteristicFormatType = 0x0C
    public static let sint12: CharacteristicFormatType = 0x0D
    public static let sint16: CharacteristicFormatType = 0x0E
    public static let sint24: CharacteristicFormatType = 0x0F
    public static let sint32: CharacteristicFormatType = 0x10
    public static let sint48: CharacteristicFormatType = 0x11
    public static let sint64: CharacteristicFormatType = 0x12
    public static let sint128: CharacteristicFormatType = 0x13
    public static let float32: CharacteristicFormatType = 0x14
    public static let float64: CharacteristicFormatType = 0x15
    public static let sfloat: CharacteristicFormatType = 0x16
    public static let float: CharacteristicFormatType = 0x17
    public static let duint16: CharacteristicFormatType = 0x18
    public static let utf8s: CharacteristicFormatType = 0x19
    public static let utf16s: CharacteristicFormatType = 0x1A
    public static let `struct`: CharacteristicFormatType = 0x1B
}

extension CharacteristicFormatType: Equatable {
    
    public static func == (lhs: CharacteristicFormatType, rhs: CharacteristicFormatType) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

extension CharacteristicFormatType: Hashable {
    
    public var hashValue: Int {
        
        return Int(rawValue)
    }
}

extension CharacteristicFormatType: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt8) {
        
        self.rawValue = value
    }
}

extension CharacteristicFormatType: CustomStringConvertible {
    
    public var name: String? {
        
        return characteristicFormatTypeNames[self]
    }
    
    public var description: String {
        
        return characteristicFormatTypeDescription[self] ?? rawValue.description
    }
}

internal let characteristicFormatTypeNames: [CharacteristicFormatType: String] = [
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

internal let characteristicFormatTypeDescription: [CharacteristicFormatType: String] = [
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
