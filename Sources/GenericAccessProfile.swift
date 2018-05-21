
//
//  GenericAccessProfile.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 4/26/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 Generic Access Profile
 
 - SeeAlso:
 [Generic Access Profile](https://www.bluetooth.com/specifications/assigned-numbers/generic-access-profile)
 */
public enum GAP {
    
    public typealias DataType = GAPDataType
}

// MARK: - Generic Access Profile Data Type

/// Generic Access Profile Data Type
///
/// ​​Assigned numbers are used in GAP for inquiry response, EIR data type values, manufacturer-specific data,
/// advertising data, low energy UUIDs and appearance characteristics, and class of device.
///
/// - SeeAlso:
/// [Generic Access Profile](https://www.bluetooth.com/specifications/assigned-numbers/generic-access-profile)
public struct GAPDataType: RawRepresentable {
    
    public var rawValue: UInt8
    
    public init(rawValue: UInt8) {
        
        self.rawValue = rawValue
    }
    
    /// Flags
    ///
    /// **Reference**:
    ///
    /// Bluetooth Core Specification Vol. 3, Part C, section 8.1.3 (v2.1 + EDR, 3.0 + HS and 4.0)
    ///
    /// Bluetooth Core Specification Vol. 3, Part C, sections 11.1.3 and 18.1 (v4.0)
    ///
    /// Core Specification Supplement, Part A, section 1.3
    public static let flags: GAPDataType = 0x01
    
    /// Incomplete List of 16-bit Service Class UUIDs
    public static let incompleteListOf16BitServiceClassUUIDs: GAPDataType = 0x02
    
    /// Complete List of 16-bit Service Class UUIDs
    public static let completeListOf16CitServiceClassUUIDs: GAPDataType = 0x03
    
    /// Incomplete List of 32-bit Service Class UUIDs
    public static let incompleteListOf32BitServiceClassUUIDs: GAPDataType = 0x04
    
    /// Complete List of 32-bit Service Class UUIDs
    public static let completeListOf32BitServiceClassUUIDs: GAPDataType = 0x05
    
    /// Incomplete List of 128-bit Service Class UUIDs
    public static let incompleteListOf128BitServiceClassUUIDs: GAPDataType = 0x06
    
    /// Complete List of 128-bit Service Class UUIDs
    public static let completeListOf128BitServiceClassUUIDs: GAPDataType = 0x07
    
    /// Shortened Local Name
    public static let shortLocalName: GAPDataType = 0x08
    
    /// Complete Local Name
    public static let completeLocalName: GAPDataType = 0x09
    
    /// TX Power Level
    public static let txPowerLevel: GAPDataType = 0x0A
    
    /// Class of Device
    public static let classOfDevice: GAPDataType = 0x0D
    
    /// Simple Pairing Hash C
    public static let simplePairingHashC: GAPDataType = 0x0E
    
    /// Simple Pairing Hash C-192
    public static let simplePairingHashC192: GAPDataType = 0x0E
    
    /// Simple Pairing Randomizer
    public static let simplePairingRandomizer: GAPDataType = 0x0F
    
    /// Device ID
    public static let deviceID: GAPDataType = 0x10
    
    /// Security Manager TK Value
    public static let securityManagerTKValue: GAPDataType = 0x10
    
    /// Security Manager Out of Band Flags
    public static let securityManagerOutOfBandFlags: GAPDataType = 0x11
    
    /// Slave Connection Interval Range
    public static let slaveConnectionIntervalRange: GAPDataType = 0x12
    
    /// List of 16-bit Service Solicitation UUIDs
    public static let listOf16BitServiceSolicitationUUIDs: GAPDataType = 0x14
    
    /// List of 128-bit Service Solicitation UUIDs
    public static let listOf128BitServiceSolicitationUUIDs: GAPDataType = 0x15
    
    /// Service Data
    public static let serviceData: GAPDataType = 0x16
    
    /// Service Data - 16-bit UUID
    public static let serviceData16BitUUID: GAPDataType = 0x16
    
    /// Public Target Address
    public static let publicTargetAddress: GAPDataType = 0x17
    
    /// Random Target Address
    public static let randomTargetAddress: GAPDataType = 0x18
    
    /// Appearance
    public static let appearance: GAPDataType = 0x19
    
    /// Advertising Interval
    public static let advertisingInterval: GAPDataType = 0x1A
    
    /// LE Bluetooth Device Address
    public static let LEBluetoothDeviceAddress: GAPDataType = 0x1B
    
    /// LE Role
    public static let LERole: GAPDataType = 0x1C
    
    /// Simple Pairing Hash C-256
    public static let simplePairingHashC256: GAPDataType = 0x1D
    
    /// Simple Pairing Randomizer R-256
    public static let simplePairingRandomizerR256: GAPDataType = 0x1E
    
    /// List of 32-bit Service Solicitation UUIDs
    public static let listOf32BitServiceSolicitationUUIDs: GAPDataType = 0x1F
    
    /// Service Data - 32-bit UUID
    public static let serviceData32BitUUID: GAPDataType = 0x20
    
    /// Service Data - 128-bit UUID
    public static let serviceData128BitUUID: GAPDataType = 0x21
    
    /// LE Secure Connections Confirmation Value
    public static let LESecureConnectionsConfirmationValue: GAPDataType = 0x22
    
    /// LE Secure Connections Random Value
    public static let LESecureConnectionsRandomValue: GAPDataType = 0x23
    
    /// URI
    public static let uri: GAPDataType = 0x24
    
    /// Indoor Positioning
    public static let indoorPositioning: GAPDataType = 0x25
    
    /// Transport Discovery Data
    public static let transportDiscoveryData: GAPDataType = 0x26
    
    /// LE Supported Features
    public static let LESupportedFeatures: GAPDataType = 0x27
    
    /// Channel Map Update Indication
    public static let channelMapUpdateIndication: GAPDataType = 0x28
    
    /// PB-ADV
    public static let pbADV: GAPDataType = 0x29
    
    /// Mesh Message
    public static let meshMessage: GAPDataType = 0x2A
    
    /// Mesh Beacon
    public static let meshBeacon: GAPDataType = 0x2B
    
    /// 3D Information Data
    public static let informationData3D: GAPDataType = 0x3D
    
    /// Manufacturer Specific Data
    public static let manufacturerSpecificData: GAPDataType = 0xFF
    
}

extension GAPDataType: Equatable {
    
    public static func == (lhs: GAPDataType, rhs: GAPDataType) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

extension GAPDataType: Hashable {
    
    public var hashValue: Int {
        
        return Int(rawValue)
    }
}

extension GAPDataType: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt8) {
        
        self.rawValue = value
    }
}

extension GAPDataType: CustomStringConvertible {
    
    public var name: String? {
        
        return gapDataTypeNames[self]
    }
    
    public var description: String {
        
        return name ?? "Data Type (\(rawValue))"
    }
}

/// Standard GAP Data Type names
internal let gapDataTypeNames: [GAPDataType: String] = [
    .flags: "Flags",
    .incompleteListOf16BitServiceClassUUIDs: "Incomplete List of 16-bit Service Class UUIDs",
    .completeListOf16CitServiceClassUUIDs: "Complete List of 16-bit Service Class UUIDs",
    .incompleteListOf32BitServiceClassUUIDs: "Incomplete List of 32-bit Service Class UUIDs",
    .completeListOf32BitServiceClassUUIDs: "Complete List of 32-bit Service Class UUIDs",
    .incompleteListOf128BitServiceClassUUIDs: "Incomplete List of 128-bit Service Class UUIDs",
    .completeListOf128BitServiceClassUUIDs: "Complete List of 128-bit Service Class UUIDs",
    .shortLocalName: "Shortened Local Name",
    .completeLocalName: "Complete Local Name"
]

// MARK: - Generic Access Profile Data

/// Generic Access Profile Data
public protocol GAPData {
    
    static var dataType: GAPDataType { get }
    
    init?(data: Data)
    
    var data: Data { get }
}

/// GAP Flag
public struct GAPFlags: GAPData {
    
    public static let dataType: GAPDataType = .flags
    
    public var flags: BitMaskOptionSet<GAPFlag>
    
    public init(flags: BitMaskOptionSet<GAPFlag> = 0) {
        
        self.flags = flags
    }
    
    public init?(data: Data) {
        
        let bytes = Array(data)
        
        typealias RawValue = GAPFlag.RawValue
        
        let rawValue: RawValue
        
        switch bytes.count {
        
        case 1:
            
            rawValue = bytes[0]
            
        case 2:
            
            rawValue = RawValue(UInt16(littleEndian: UInt16(bytes: (bytes[0], bytes[1]))))
            
        case 4:
            
            rawValue = RawValue(UInt32(littleEndian: UInt32(bytes: (bytes[0], bytes[1], bytes[2], bytes[3]))))
            
        case 8:
            
            rawValue = RawValue(UInt64(littleEndian: UInt64(bytes: (bytes[0], bytes[1], bytes[2], bytes[3], bytes[4], bytes[5], bytes[6], bytes[7]))))
            
        default:
            
            return nil
        }
        
        self.flags = BitMaskOptionSet<GAPFlag>(rawValue: rawValue)
    }
    
    public var data: Data {
        
        return Data([flags.rawValue])
    }
}

extension GAPFlags: Equatable {
    
    public static func == (lhs: GAPFlags, rhs: GAPFlags) -> Bool {
        
        return lhs.flags == rhs.flags
    }
}

extension GAPFlags: Hashable {
    
    public var hashValue: Int {
        
        return Int(flags.rawValue)
    }
}

extension GAPFlags: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral rawValue: GAPFlag.RawValue) {
        
        self.init(flags: BitMaskOptionSet<GAPFlag>(rawValue: rawValue))
    }
}

/**
 GAP Flag
 
 The Flags data type contains one bit Boolean flags. The Flags data type shall be included when any of the Flag bits are non-zero and the advertising packet is connectable, otherwise the Flags data type may be omitted. All 0x00 octets after the last non-zero octet shall be omitted from the value transmitted.
 
 - Note: If the Flags AD type is not present in a non-connectable advertisement, the Flags should be considered as unknown and no assumptions should be made by the scanner.
 
 Flags used over the LE physical channel are:
 
    • Limited Discoverable Mode
 
    • General Discoverable Mode
 
    • BR/EDR Not Supported
 
    • Simultaneous LE and BR/EDR to Same Device Capable (Controller)
 
    • Simultaneous LE and BR/EDR to Same Device Capable (Host)
 
 The LE Limited Discoverable Mode and LE General Discoverable Mode flags shall be ignored when received over the BR/EDR physical channel. The ‘BR/ EDR Not Supported’ flag shall be set to 0 when sent over the BR/EDR physical channel.
 
 The Flags field may be zero or more octets long. This allows the Flags field to be extended while using the minimum number of octets within the data packet.
 */
public enum GAPFlag: UInt8, BitMaskOption {
    
    #if swift(>=3.2)
    #elseif swift(>=3.0)
    public typealias RawValue = UInt8
    #endif
    
    /// LE Limited Discoverable Mode
    case lowEnergyLimitedDiscoverableMode = 0b01
    
    /// LE General Discoverable Mode
    case lowEnergyGeneralDiscoverableMode = 0b10
    
    /// BR/EDR Not Supported.
    ///
    /// Bit 37 of LMP Feature Mask Definitions  (Page 0)
    case notSupportedBREDR = 0b100
    
    /// Simultaneous LE and BR/EDR to Same Device Capable (Controller).
    ///
    /// Bit 49 of LMP Feature Mask Definitions (Page 0)
    case simultaneousController = 0b1000
    
    /// Simultaneous LE and BR/EDR to Same Device Capable (Host).
    ///
    /// Bit 66 of LMP Feature Mask Definitions (Page 1)
    case simultaneousHost = 0b10000
    
    public static let all: Set<GAPFlag> = [
        .lowEnergyLimitedDiscoverableMode,
        .lowEnergyGeneralDiscoverableMode,
        .notSupportedBREDR,
        .simultaneousController,
        .simultaneousHost
    ]
}

/// GAP Incomplete List of 16-bit Service Class UUIDs
public struct GAPIncompleteListOf16BitServiceClassUUIDs: GAPData {
    
    public static let dataType: GAPDataType = .incompleteListOf16BitServiceClassUUIDs
    
    public var uuids: [UInt16]
    
    public init(uuids: [UInt16] = []) {
        
        self.uuids = uuids
    }
    
    public init?(data: Data) {
        
        guard let list = Bit16UUIDList(data: data)
            else { return nil }
        
        self.uuids = list.uuids
    }
    
    public var data: Data {
        
        return Bit16UUIDList(uuids: uuids).data
    }
}

extension GAPIncompleteListOf16BitServiceClassUUIDs: ExpressibleByArrayLiteral {
    
    public init(arrayLiteral elements: UInt16...) {
        
        self.init(uuids: elements)
    }
}

extension GAPIncompleteListOf16BitServiceClassUUIDs: Equatable {
    
    public static func == (lhs: GAPIncompleteListOf16BitServiceClassUUIDs, rhs: GAPIncompleteListOf16BitServiceClassUUIDs) -> Bool {
        
        return lhs.uuids == rhs.uuids
    }
}

extension GAPIncompleteListOf16BitServiceClassUUIDs: CustomStringConvertible {
    
    public var description: String {
        
        return uuids.description
    }
}

/// GAP Complete List of 16-bit Service Class UUIDs
public struct GAPCompleteListOf16BitServiceClassUUIDs: GAPData {
    
    public static let dataType: GAPDataType = .completeListOf16CitServiceClassUUIDs
    
    public var uuids: [UInt16]
    
    public init(uuids: [UInt16] = []) {
        
        self.uuids = uuids
    }
    
    public init?(data: Data) {
        
        guard let list = Bit16UUIDList(data: data)
            else { return nil }
        
        self.uuids = list.uuids
    }
    
    public var data: Data {
        
        return Bit16UUIDList(uuids: uuids).data
    }
}

extension GAPCompleteListOf16BitServiceClassUUIDs: ExpressibleByArrayLiteral {
    
    public init(arrayLiteral elements: UInt16...) {
        
        self.init(uuids: elements)
    }
}

extension GAPCompleteListOf16BitServiceClassUUIDs: Equatable {
    
    public static func == (lhs: GAPCompleteListOf16BitServiceClassUUIDs, rhs: GAPCompleteListOf16BitServiceClassUUIDs) -> Bool {
        
        return lhs.uuids == rhs.uuids
    }
}

extension GAPCompleteListOf16BitServiceClassUUIDs: CustomStringConvertible {
    
    public var description: String {
        
        return uuids.description
    }
}

internal struct Bit16UUIDList {
    
    public var uuids: [UInt16]
    
    public init(uuids: [UInt16]) {
        
        self.uuids = uuids
    }
    
    public init?(data: Data) {
                
        var uuids = [UInt16]()
        uuids.reserveCapacity(data.count / 2)
        
        var index = 0
        while index < data.count {
            
            guard index + 1 < data.count
                else { return nil }
            
            let value = UInt16(littleEndian: UInt16(bytes: (data[index], data[index + 1])))
            
            index += 2
            
            uuids.append(value)
        }
        
        self.uuids = uuids
    }
    
    public var data: Data {
        
        return uuids.reduce(Data(), { $0.0 + [$0.1.littleEndian.bytes.0, $0.1.littleEndian.bytes.1] })
    }
}

/**
 GAP Shortened Local Name
 
 The Local Name data type shall be the same as, or a shortened version of, the local name assigned to the device. The Local Name data type value indicates if the name is complete or shortened. If the name is shortened, the complete name can be read using the remote name request procedure over BR/EDR or by reading the device name characteristic after the connection has been established using GATT.
 
 A shortened name shall only contain contiguous characters from the beginning of the full name. For example, if the device name is ‘BT_Device_Name’ then the shortened name could be ‘BT_Device’ or ‘BT_Dev’.
 */
public struct GAPShortLocalName: GAPData {
    
    public static let dataType: GAPDataType = .shortLocalName
    
    public let name: String
    
    public init(name: String) {
        
        self.name = name
    }
    
    public init?(data: Data) {
        
        guard let rawValue = String(data: data, encoding: .utf8)
            else { return nil }
        
        self.init(name: rawValue)
    }
    
    public var data: Data {
        
        return Data(name.utf8)
    }
}

extension GAPShortLocalName: Equatable {
    
    public static func == (lhs: GAPShortLocalName, rhs: GAPShortLocalName) -> Bool {
        
        return lhs.name == rhs.name
    }
}

extension GAPShortLocalName: CustomStringConvertible {
    
    public var description: String {
        
        return name
    }
}

extension GAPShortLocalName: ExpressibleByStringLiteral {
    
    public init(stringLiteral value: String) {
        
        self.init(name: value)
    }
    
    public init(extendedGraphemeClusterLiteral value: String) {
        
        self.init(name: value)
    }
    
    public init(unicodeScalarLiteral value: String) {
        
        self.init(name: value)
    }
}

/**
 GAP Complete Local Name
 
 The Local Name data type shall be the same as, or a shortened version of, the local name assigned to the device. The Local Name data type value indicates if the name is complete or shortened. If the name is shortened, the complete name can be read using the remote name request procedure over BR/EDR or by reading the device name characteristic after the connection has been established using GATT.
 */
public struct GAPCompleteLocalName: GAPData {
    
    public static let dataType: GAPDataType = .completeLocalName
    
    public let name: String
    
    public init(name: String) {
        
        self.name = name
    }
    
    public init?(data: Data) {
        
        guard let name = String(bytes: data, encoding: .utf8)
            else { return nil }
        
        self.init(name: name)
    }
    
    public var data: Data {
        
        return Data(name.utf8)
    }
}

extension GAPCompleteLocalName: Equatable {
    
    public static func == (lhs: GAPCompleteLocalName, rhs: GAPCompleteLocalName) -> Bool {
        
        return lhs.name == rhs.name
    }
}

extension GAPCompleteLocalName: CustomStringConvertible {
    
    public var description: String {
        
        return name
    }
}

extension GAPCompleteLocalName: ExpressibleByStringLiteral {
    
    public init(stringLiteral value: String) {
        
        self.init(name: value)
    }
    
    public init(extendedGraphemeClusterLiteral value: String) {
        
        self.init(name: value)
    }
    
    public init(unicodeScalarLiteral value: String) {
        
        self.init(name: value)
    }
}

public struct GAPTxPowerLevel: GAPData {
    
    public static let length = MemoryLayout<UInt8>.size
    
    public static let min: GAPTxPowerLevel = -127
    
    public static let max: GAPTxPowerLevel = 127
    
    public static var dataType: GAPDataType = .txPowerLevel
    
    public let powerLevel: Int8
    
    public init?(powerLevel: Int8) {
        
        guard GAPTxPowerLevel.min.powerLevel <= powerLevel &&
            GAPTxPowerLevel.max.powerLevel >= powerLevel
            else { return nil }
        
        self.powerLevel = powerLevel
    }
    
    fileprivate init(unsafe value: Int8) {
        
        self.powerLevel = value
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let level = Int8(bitPattern: data[0])
        
        self.init(powerLevel: level)
    }
    
    public var data: Data {
        
        let byteValue = UInt8(bitPattern: powerLevel)
        
        return Data([byteValue])
    }
    
}

extension GAPTxPowerLevel: Equatable {
    
    public static func == (lhs: GAPTxPowerLevel, rhs: GAPTxPowerLevel) -> Bool {
        
        return lhs.powerLevel == rhs.powerLevel
    }
}

extension GAPTxPowerLevel: CustomStringConvertible {
    
    public var description: String {
        
        return powerLevel.description
    }
}

extension GAPTxPowerLevel: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: Int8) {
        
        self.init(unsafe: value)
    }
    
}

// MARK: - Coding

public struct GAPDataElement {
    
    public var type: GAPDataType
    
    public var value: Data
    
    public init(type: GAPDataType, value: Data) {
        
        self.type = type
        self.value = value
    }
    
    public init(_ data: GAPData) {
        
        self.type = type(of: data).dataType
        self.value = data.data
        
        assert(value.count <= Int(UInt8.max))
    }
}

public struct GAPDataEncoder {
    
    private static func encode(_ element: GAPDataElement) -> Data {
        
        return Data([UInt8(element.value.count + 1), element.type.rawValue]) + element.value
    }
    
    public static func encode(_ elements: [GAPDataElement]) -> Data {
        
        var data = Data()
        data.reserveCapacity(elements.count * 3)
        
        elements.forEach { data.append(encode($0)) }
        
        return data
    }
    
    public static func encode(_ encodables: [GAPData]) -> Data {
        
        let elements = encodables.map { GAPDataElement($0) }
        
        return encode(elements)
    }
}

public struct GAPDataDecoder {
    
    public enum Error: Swift.Error {
        
        case insufficientBytes(expected: Int, actual: Int)
        case cannotDecode(GAPData.Type, GAPDataElement)
        case unknownType(GAPDataType)
    }
    
    public static func decode(_ data: Data) throws -> [GAPDataElement] {
        
        guard data.isEmpty == false
            else { return [] }
        
        var elements = [GAPDataElement]()
        
        var index = 0
        
        while index < data.count {
            
            // get length
            let length = Int(data[index]) // 0
            index += 1
            guard index < data.count
                else { throw Error.insufficientBytes(expected: index + 1, actual: data.count) }
            
            // get type
            let type = GAPDataType(rawValue: data[index]) // 1
            
            // get value
            let dataRange = index + 1 ..< index + length // 2 ..< 2 + length
            index = dataRange.upperBound
            guard index <= data.count
                else { throw Error.insufficientBytes(expected: index + 1, actual: data.count) }
            
            let value = Data(data[dataRange])
            
            elements.append(GAPDataElement(type: type, value: value))
        }
        
        return elements
    }
    
    public static func decode(_ data: Data,
                              types: [GAPData.Type],
                              ignoreUnknownType: Bool = true) throws -> [GAPData] {
        
        let elements = try decode(data)
        
        var decodables = [GAPData]()
        decodables.reserveCapacity(elements.count)
        
        for element in elements {
            
            if let type = types.first(where: { $0.dataType == element.type }) {
                
                guard let decodable = type.init(data: element.value)
                    else { throw Error.cannotDecode(type, element) }
                
                decodables.append(decodable)
                
            } else if ignoreUnknownType {
                
                continue
                
            } else {
                
                throw Error.unknownType(element.type)
            }
        }
        
        return decodables
    }
}
