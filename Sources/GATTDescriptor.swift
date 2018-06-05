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
}

/// GATT Client Characteristic Configuration Descriptor
///
/// The Client Characteristic Configuration descriptor defines how the characteristic may be
/// configured by a specific client.
///
/// This descriptor shall be persistent across connections for bonded devices. 
/// The Client Characteristic Configuration descriptor is unique for each client. 
/// A client may read and write this descriptor to determine and set the configuration for that client.
/// Authentication and authorization may be required by the server to write this descriptor. 
/// The default value for the Client Characteristic Configuration descriptor is `0x00`.
/// Upon connection of non-binded clients, this descriptor is set to the default value.
public struct GATTClientCharacteristicConfiguration: GATTDescriptor {
    
    public static let uuid: BluetoothUUID = .clientCharacteristicConfiguration
    
    public static let length = 2
    
    public var configuration: BitMaskOptionSet<Configuration>
    
    public init(configuration: BitMaskOptionSet<Configuration> = []) {
        
        self.configuration = configuration
    }
    
    public init?(byteValue: Data) {
        
        guard byteValue.count == type(of: self).length
            else { return nil }
        
        let rawValue = UInt16(littleEndian: UInt16(bytes: (byteValue[0], byteValue[1])))
        
        self.configuration = BitMaskOptionSet<Configuration>(rawValue: rawValue)
    }
    
    public var byteValue: Data {
        
        let bytes = configuration.rawValue.littleEndian.bytes
        
        return Data([bytes.0, bytes.1])
    }
    
    public var descriptor: GATT.Descriptor {
        
        return GATT.Descriptor(uuid: type(of: self).uuid,
                               value: byteValue,
                               permissions: [.read, .write])
    }
}

public extension GATTClientCharacteristicConfiguration {
    
    /// GATT Client Characteristic Configuration Options
    public enum Configuration: UInt16, BitMaskOption {
        
        #if swift(>=3.2)
        #elseif swift(>=3.0)
        public typealias RawValue = UInt16
        #endif
        
        /// Notifications enabled
        case notify = 0b01
        
        /// Indications enabled
        case indicate = 0b10
        
        public static let all: Set<Configuration> = [.notify, .indicate]
    }
}

/// GATT Characteristic Extended Properties Descriptor
///
/// The Characteristic Extended Properties descriptor defines additional Characteristic Properties.
///
/// If the Characteristic Extended Properties bit of the Characteristic Properties is set, then this descriptor exists.
/// The Characteristic Extended Properties descriptor is a bit field defining Reliable Write and Writeable Auxiliaries are enabled for the Characteristic.
/// This descriptor is readable without authentication and authorization being required.
public struct GATTCharacteristicExtendedProperties: GATTDescriptor {
    
    public static let uuid: BluetoothUUID = .characteristicExtendedProperties
    
    public static let length = 2
    
    public var properties: BitMaskOptionSet<Property>
    
    public init(properties: BitMaskOptionSet<Property> = []) {
        
        self.properties = properties
    }
    
    public init?(byteValue: Data) {
        
        guard byteValue.count == type(of: self).length
            else { return nil }
        
        let rawValue = UInt16(littleEndian: UInt16(bytes: (byteValue[0], byteValue[1])))
        
        self.properties = BitMaskOptionSet<Property>(rawValue: rawValue)
    }
    
    public var byteValue: Data {
        
        let bytes = properties.rawValue.littleEndian.bytes
        
        return Data([bytes.0, bytes.1])
    }
    
    public var descriptor: GATT.Descriptor {
        
        return GATT.Descriptor(uuid: type(of: self).uuid,
                               value: byteValue,
                               permissions: [.read])
    }
}

public extension GATTCharacteristicExtendedProperties {
    
    /// GATT Characteristic Extended Properties Options
    public enum Property: UInt16, BitMaskOption {
        
        #if swift(>=3.2)
        #elseif swift(>=3.0)
        public typealias RawValue = UInt16
        #endif
        
        /// Reliable Write enabled
        case reliableWrite = 0b01
        
        /// Writable Auxiliaries enabled
        case writableAuxiliaries = 0b10
        
        public static let all: Set<Property> = [.reliableWrite, .writableAuxiliaries]
    }
}

/// GATT Server Characteristic Configuration Descriptor
///
/// The Server Characteristic Configuration descriptor defines how the characteristic descriptor is associated with may be configured for the server.
///
/// Only one Server Characteristic Configuration descriptor exists in a characteristic definition.
/// A client may write this configuration descriptor to control the configuration of the characteristic on the server for all clients.
/// There is a single instantiation of this descriptor for all clients.
/// Authentication and authorization may be required by the server to write this descriptor.
public struct GATTServerCharacteristicConfiguration: GATTDescriptor {
    
    public static let uuid: BluetoothUUID = .serverCharacteristicConfiguration
    
    public static let length = 1
    
    public var serverConfiguration: BitMaskOptionSet<ServerConfiguration>
    
    public init(serverConfiguration: BitMaskOptionSet<ServerConfiguration> = []) {
        
        self.serverConfiguration = serverConfiguration
    }
    
    public init?(byteValue: Data) {
        
        guard byteValue.count == type(of: self).length
            else { return nil }
        
        let rawValue = byteValue[0]
        
        self.serverConfiguration = BitMaskOptionSet<ServerConfiguration>(rawValue: rawValue)
    }
    
    public var byteValue: Data {
        
        return Data([serverConfiguration.rawValue])
    }
    
    public var descriptor: GATT.Descriptor {
        
        return GATT.Descriptor(uuid: type(of: self).uuid,
                               value: byteValue,
                               permissions: [.write])
    }
}

extension GATTServerCharacteristicConfiguration {
    
    /// GATT Server Characteristics Configuration Options
    public enum ServerConfiguration: UInt8, BitMaskOption {
        
        #if swift(>=3.2)
        #elseif swift(>=3.0)
        public typealias RawValue = UInt8
        #endif
        
        /// Broadcasts enabled
        case broadcasts = 0b01
        
        public static let all: Set<ServerConfiguration> = [.broadcasts]
    }
}

/// GATT Characteristic Aggregate Format Descriptor
///
/// The Characteristic Aggregate Format descriptor defines the format of an aggregated Characteristic Value.
///
/// Only one Characteristic Aggregate Format descriptor exists in a characteristic definition.
/// This descriptor consists of a list of Attribute Handles pointing to Characteristic Presentation Format declarations.
/// This descriptor is read only and does not require authentication or authorization.
/// The list of Attribute Handles is the concatenation of multiple 16-bit Attribute Handle values into a single Attribute Value.
/// If more than one Characteristic Presentation Format declarations exist, then there is one Characteristic Aggregate Format declaration.
/// However, a Characteristic Aggregate Format descriptor can be present even if there aren't any Presentation Format descriptors in the characteristic definition. The order of the Attribute Handles in the list is significant.
///
/// Example:
/// If 3 Characteristic Presentation Format declarations exist at Attribute Handles 0x40, 0x50 and 0x60,
/// the Characteris Aggregate Format Value is 0x405060.
public struct GATTAggregateFormatDescriptor: GATTDescriptor {
    
    public static let uuid: BluetoothUUID = .characteristicAggregateFormat
    
    public var handles: [UInt16]
    
    public init(handles: [UInt16] = []) {
        
        self.handles = handles
    }
    
    public init?(byteValue: Data) {
        
        // this is not actually UInt16 UUID, but handles
        // since the binary format is the same we can reuse code
        guard let list = Bit16UUIDList(data: byteValue)
            else { return nil }
        
        self.handles = list.uuids
    }
    
    public var byteValue: Data {
        
        return (Bit16UUIDList(uuids: handles)).data
    }
    
    public var descriptor: GATT.Descriptor {
    
        return GATT.Descriptor(uuid: type(of: self).uuid,
                               value: byteValue,
                               permissions: [.read])
    }
    
}

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

/// GATT Characteristic Presentation Format Descriptor
///
/// The Characteristic Presentation Format descriptor defines the format of the Characteristic Value.
///
/// One or more Characteristic Presentation Format descriptors may be present.
/// If multiple of these descriptors are present, then a Aggregate Formate descriptor is present.
/// This descriptor is read only and does not require authentication or authorization to read.
/// This descriptor is composed of five parts: format, exponent, unit, name space and description.
/// The Format field determines how a single value contained in the Characteristic Value is formatted.
/// The Exponent field is used with interger data types to determine how the Characteristic Value is furhter formatted.
/// The actual value = Characteristic Value * 10^Exponent.
///
/// Examples:
/// When encoding an IPv4 address, the uint32 Format type is used.
/// When encoding an IPv6 address, the uint128 Format type is used.
/// When encoding a Bluetooth address (BD_ADDR), the uint48 Format type is used.
/// For a Characteristic Value of 23 and an Exponent of 2, the actual value is 2300
/// For a Characteristi Value of 3892 and an Exponent of -3, the actual value is 3.892
public struct GATTFormatDescriptor: GATTDescriptor {
    
    public static let uuid: BluetoothUUID = .characteristicFormat
    
    public static let length = 7
    
    public let format: CharacteristicFormatType
    
    public let exponent: Int8
    
    public let unit: UInt16
    
    public let namespace: UInt8
    
    public let description: UInt16
    
    public init(format: CharacteristicFormatType, exponent: Int8, unit: UInt16, namespace: UInt8, description: UInt16) {
        
        self.format = format
        self.exponent = exponent
        self.unit = unit
        self.namespace = namespace
        self.description = description
    }
    
    public init?(byteValue: Data) {
        
        guard byteValue.count == type(of: self).length
            else { return nil }
        
        guard let format = CharacteristicFormatType.init(rawValue: byteValue[0])
            else { return nil }
        
        self.init(format: format,
                  exponent: Int8(bitPattern: byteValue[1]),
                  unit: UInt16(littleEndian: UInt16(bytes: (byteValue[2], byteValue[3]))),
                  namespace: byteValue[4],
                  description: UInt16(littleEndian: UInt16(bytes: (byteValue[5], byteValue[6]))))
    }
    
    public var byteValue: Data {
        
        let unitBytes = unit.littleEndian.bytes
        let descriptionBytes = description.littleEndian.bytes
        
        return Data([format.rawValue,
                     UInt8(bitPattern: exponent),
                     unitBytes.0,
                     unitBytes.1,
                     namespace,
                     descriptionBytes.0,
                     descriptionBytes.1
            ])
    }
    
    public var descriptor: GATT.Descriptor {
        
        return GATT.Descriptor(uuid: type(of: self).uuid,
                               value: byteValue,
                               permissions: [.read])
    }
}

/// GATT Characteristic User Description Descriptor
///
/// The Characteristic User Description descriptor provides a textual user description for a characteristic value.
///
/// If the Writable Auxiliary bit of the Characteristics Properties is set then this descriptor is written.
/// Only one User Description descriptor exists in a characteristic definition.
public struct GATTUserDescription: GATTDescriptor {
    
    public static let uuid: BluetoothUUID = .characteristicUserDescription
    
    public var userDescription: String
    
    public init(userDescription: String) {
        
        self.userDescription = userDescription
    }
    
    public init?(byteValue: Data) {
        
        guard let rawValue = String(data: byteValue, encoding: .utf8)
            else { return nil }
        
        self.init(userDescription: rawValue)
    }
    
    public var byteValue: Data {
        
        return Data(userDescription.utf8)
    }
    
    public var descriptor: GATT.Descriptor {
        return GATT.Descriptor(uuid: type(of: self).uuid,
                               value: byteValue,
                               permissions: [])
    }
}

/// GATT Report Reference Descriptor
///
/// Mapping information in the form of a Report ID and Report Type which maps the current parent characteristic to the Report ID(s) and Report Type (s) defined within the Report Map characteristic.
public struct GATTReportReference: GATTDescriptor {
    
    public enum ReportType: UInt8 {
        
        /// Input Report
        case InputReport = 0x01
        
        /// Output Report
        case OutputReport = 0x02
        
        /// Feature Report
        case FeatureReport = 0x03
        
    }
    
    public static let uuid: BluetoothUUID = .reportReference
    
    public static let length = 2
    
    public var reportID: UInt8
    
    public var reportType: ReportType
    
    public init(reportID: UInt8, reportType: ReportType) {
        
        self.reportID = reportID
        self.reportType = reportType
    }
    
    public init?(byteValue: Data) {
        
        guard byteValue.count == type(of: self).length
            else { return nil }
        
        guard let reportType = ReportType(rawValue: byteValue[1])
            else { return nil }
        
        self.init(reportID: byteValue[0], reportType: reportType)
    }
    
    public var byteValue: Data {
        
        return Data([reportID, reportType.rawValue])
    }
    
    public var descriptor: GATT.Descriptor {
        
        return GATT.Descriptor(uuid: type(of: self).uuid,
                               value: byteValue,
                               permissions: [])
    }
}
