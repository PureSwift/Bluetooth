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
    
    /// Simple Pairing Randomizer
    public static let simplePairingRandomizerR: GAPDataType = 0x0F
    
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

/// GAP Incomplete List of 32-bit Service Class UUIDs
public struct GAPIncompleteListOf32BitServiceClassUUIDs: GAPData {
    
    public static let dataType: GAPDataType = .incompleteListOf32BitServiceClassUUIDs
    
    public var uuids: [UInt32]
    
    public init(uuids: [UInt32] = []) {
        
        self.uuids = uuids
    }
    
    public init?(data: Data) {
        
        guard let list = Bit32UUIDList(data: data)
            else { return nil }
        
        self.uuids = list.uuids
    }
    
    public var data: Data {
        
        return Bit32UUIDList(uuids: uuids).data
    }
}

extension GAPIncompleteListOf32BitServiceClassUUIDs: ExpressibleByArrayLiteral {
    
    public init(arrayLiteral elements: UInt32...) {
        
        self.init(uuids: elements)
    }
}

extension GAPIncompleteListOf32BitServiceClassUUIDs: Equatable {
    
    public static func == (lhs: GAPIncompleteListOf32BitServiceClassUUIDs, rhs: GAPIncompleteListOf32BitServiceClassUUIDs) -> Bool {
        
        return lhs.uuids == rhs.uuids
    }
}

extension GAPIncompleteListOf32BitServiceClassUUIDs: CustomStringConvertible {
    
    public var description: String {
        
        return uuids.description
    }
}

/// GAP Complete List of 32-bit Service Class UUIDs
public struct GAPCompleteListOf32BitServiceClassUUIDs: GAPData {
    
    public static let dataType: GAPDataType = .completeListOf32BitServiceClassUUIDs
    
    public var uuids: [UInt32]
    
    public init(uuids: [UInt32] = []) {
        
        self.uuids = uuids
    }
    
    public init?(data: Data) {
        
        guard let list = Bit32UUIDList(data: data)
            else { return nil }
        
        self.uuids = list.uuids
    }
    
    public var data: Data {
        
        return Bit32UUIDList(uuids: uuids).data
    }
}

extension GAPCompleteListOf32BitServiceClassUUIDs: ExpressibleByArrayLiteral {
    
    public init(arrayLiteral elements: UInt32...) {
        
        self.init(uuids: elements)
    }
}

extension GAPCompleteListOf32BitServiceClassUUIDs: Equatable {
    
    public static func == (lhs: GAPCompleteListOf32BitServiceClassUUIDs, rhs: GAPCompleteListOf32BitServiceClassUUIDs) -> Bool {
        
        return lhs.uuids == rhs.uuids
    }
}

extension GAPCompleteListOf32BitServiceClassUUIDs: CustomStringConvertible {
    
    public var description: String {
        
        return uuids.description
    }
}

internal struct Bit32UUIDList {
    
    public var uuids: [UInt32]
    
    public init(uuids: [UInt32]) {
        
        self.uuids = uuids
    }
    
    public init?(data: Data) {
        
        var uuids = [UInt32]()
        uuids.reserveCapacity(data.count / 4)
        
        var index = 0
        while index < data.count {
            
            guard index + 3 < data.count
                else { return nil }
            
            let value = UInt32(littleEndian: UInt32(bytes: (data[index], data[index + 1], data[index + 2], data[index + 3])))
            
            index += 4
            
            uuids.append(value)
        }
        
        self.uuids = uuids
    }
    
    public var data: Data {
        
        return uuids.reduce(Data(), { $0.0 + [$0.1.littleEndian.bytes.0, $0.1.littleEndian.bytes.1, $0.1.littleEndian.bytes.2, $0.1.littleEndian.bytes.3] })
    }
}

/// GAP Incomplete List of 128-bit Service Class UUIDs
public struct GAPIncompleteListOf128BitServiceClassUUIDs: GAPData {
    
    public static let dataType: GAPDataType = .incompleteListOf128BitServiceClassUUIDs
    
    public var uuids: [UUID]
    
    public init(uuids: [UUID] = []) {
        
        self.uuids = uuids
    }
    
    public init?(data: Data) {
        
        guard let list = Bit128UUIDList(data: data)
            else { return nil }
        
        self.uuids = list.uuids.map(UUID.init)
    }
    
    public var data: Data {
        
        return Bit128UUIDList(uuids: uuids.map(UInt128.init)).data
    }
}

extension GAPIncompleteListOf128BitServiceClassUUIDs: ExpressibleByArrayLiteral {
    
    public init(arrayLiteral elements: UUID...) {
        
        self.init(uuids: elements)
    }
}

extension GAPIncompleteListOf128BitServiceClassUUIDs: Equatable {
    
    public static func == (lhs: GAPIncompleteListOf128BitServiceClassUUIDs, rhs: GAPIncompleteListOf128BitServiceClassUUIDs) -> Bool {
        
        return lhs.uuids == rhs.uuids
    }
}

extension GAPIncompleteListOf128BitServiceClassUUIDs: CustomStringConvertible {
    
    public var description: String {
        
        return uuids.description
    }
}

/// GAP Complete List of 128-bit Service Class UUIDs
public struct GAPCompleteListOf128BitServiceClassUUIDs: GAPData {
    
    public static let dataType: GAPDataType = .completeListOf128BitServiceClassUUIDs
    
    public var uuids: [UUID]
    
    public init(uuids: [UUID] = []) {
        
        self.uuids = uuids
    }
    
    public init?(data: Data) {
        
        guard let list = Bit128UUIDList(data: data)
            else { return nil }
        
        self.uuids = list.uuids.map(UUID.init)
    }
    
    public var data: Data {
        
        return Bit128UUIDList(uuids: uuids.map(UInt128.init)).data
    }
}

extension GAPCompleteListOf128BitServiceClassUUIDs: ExpressibleByArrayLiteral {
    
    public init(arrayLiteral elements: UUID...) {
        
        self.init(uuids: elements)
    }
}

extension GAPCompleteListOf128BitServiceClassUUIDs: Equatable {
    
    public static func == (lhs: GAPCompleteListOf128BitServiceClassUUIDs, rhs: GAPCompleteListOf128BitServiceClassUUIDs) -> Bool {
        
        return lhs.uuids == rhs.uuids
    }
}

extension GAPCompleteListOf128BitServiceClassUUIDs: CustomStringConvertible {
    
    public var description: String {
        
        return uuids.description
    }
}

internal struct Bit128UUIDList {
    
    public var uuids: [UInt128]
    
    public init(uuids: [UInt128]) {
        
        self.uuids = uuids
    }
    
    public init?(data: Data) {
        
        var uuids = [UInt128]()
        uuids.reserveCapacity(data.count / 16)
        
        var index = 0
        while index < data.count {
            
            guard index + 15 < data.count
                else { return nil }
            
            let value = UInt128(littleEndian: UInt128(bytes: (data[index], data[index + 1], data[index + 2], data[index + 3], data[index + 4], data[index + 5], data[index + 6], data[index + 7], data[index + 8], data[index + 9], data[index + 10], data[index + 11], data[index + 12], data[index + 13], data[index + 14], data[index + 15])))
            
            index += 16
            
            uuids.append(value)
        }
        
        self.uuids = uuids
    }
    
    public var data: Data {
        
        return uuids.reduce(Data(), { $0.0 + [$0.1.littleEndian.bytes.0, $0.1.littleEndian.bytes.1, $0.1.littleEndian.bytes.2, $0.1.littleEndian.bytes.3, $0.1.littleEndian.bytes.4, $0.1.littleEndian.bytes.5, $0.1.littleEndian.bytes.6, $0.1.littleEndian.bytes.7, $0.1.littleEndian.bytes.8, $0.1.littleEndian.bytes.9, $0.1.littleEndian.bytes.10, $0.1.littleEndian.bytes.11, $0.1.littleEndian.bytes.12, $0.1.littleEndian.bytes.13, $0.1.littleEndian.bytes.14, $0.1.littleEndian.bytes.15] })
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
    
    public static let dataType: GAPDataType = .txPowerLevel
    
    public let powerLevel: Int8
    
    public init?(powerLevel: Int8) {
        
        guard GAPTxPowerLevel.min.powerLevel <= powerLevel,
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

public struct GAPClassOfDevice: GAPData {
    
    public typealias Identifier = (UInt8, UInt8, UInt8)
    
    public static let length = MemoryLayout<Identifier>.size
    
    public static let dataType: GAPDataType = .classOfDevice
    
    public let device: Identifier
    
    public init(device: Identifier) {
        
        self.device = device
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let device = (data[0], data[1], data[2])
        
        self.init(device: device)
    }
    
    public var data: Data {
        
        return Data([device.0, device.1, device.2])
    }
}

extension GAPClassOfDevice: Equatable {
    
    public static func == (lhs: GAPClassOfDevice, rhs: GAPClassOfDevice) -> Bool {
        
        return lhs.device == rhs.device
    }
}

extension GAPClassOfDevice: CustomStringConvertible {
    
    public var description: String {
        
        return "\(device.0) \(device.1) \(device.2)"
    }
}

public struct GAPSimplePairingHashC: GAPData {
    
    public static let length = MemoryLayout<UUID>.size
    
    public static let dataType: GAPDataType = .simplePairingHashC
    
    public let uuid: UUID
    
    public init(uuid: UUID) {
        
        self.uuid = uuid
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let uuid = UUID(UInt128(littleEndian: UInt128(bytes: (data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7], data[8], data[9], data[10], data[11], data[12], data[13], data[14], data[15]))))
        
        self.init(uuid: uuid)
    }
    
    public var data: Data {
        
        return uuid.data
    }
}

extension GAPSimplePairingHashC: Equatable {
    
    public static func == (lhs: GAPSimplePairingHashC, rhs: GAPSimplePairingHashC) -> Bool {
        
        return lhs.uuid == rhs.uuid
    }
}

extension GAPSimplePairingHashC: CustomStringConvertible {
    
    public var description: String {
        
        return uuid.description
    }
}

public struct GAPSimplePairingRandomizerR: GAPData {
    
    public static let length = MemoryLayout<UUID>.size
    
    public static let dataType: GAPDataType = .simplePairingRandomizerR
    
    public let uuid: UUID
    
    public init(uuid: UUID) {
        
        self.uuid = uuid
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let uuid = UUID(UInt128(littleEndian: UInt128(bytes: (data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7], data[8], data[9], data[10], data[11], data[12], data[13], data[14], data[15]))))
        
        self.init(uuid: uuid)
    }
    
    public var data: Data {
        
        return uuid.data
    }
}

extension GAPSimplePairingRandomizerR: Equatable {
    
    public static func == (lhs: GAPSimplePairingRandomizerR, rhs: GAPSimplePairingRandomizerR) -> Bool {
        
        return lhs.uuid == rhs.uuid
    }
}

extension GAPSimplePairingRandomizerR: CustomStringConvertible {
    
    public var description: String {
        
        return uuid.description
    }
}

public struct GAPLESecureConnectionsConfirmation: GAPData {
    
    public static let length = MemoryLayout<UInt16>.size
    
    public static let dataType: GAPDataType = .LESecureConnectionsConfirmationValue
    
    public let confirmation: UInt16
    
    public init(confirmation: UInt16) {
        
        self.confirmation = confirmation
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let confirmation = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
        
        self.init(confirmation: confirmation)
    }
    
    public var data: Data {
        
        let value = confirmation.littleEndian
        return Data(bytes: [value.bytes.0, value.bytes.1])
    }
}

extension GAPLESecureConnectionsConfirmation: Equatable {
    
    public static func == (lhs: GAPLESecureConnectionsConfirmation, rhs: GAPLESecureConnectionsConfirmation) -> Bool {
        
        return lhs.confirmation == rhs.confirmation
    }
}

extension GAPLESecureConnectionsConfirmation: CustomStringConvertible {
    
    public var description: String {
        
        return confirmation.description
    }
}

public struct GAPLESecureConnectionsRandom: GAPData {
    
    public static let length = MemoryLayout<UInt16>.size
    
    public static let dataType: GAPDataType = .LESecureConnectionsRandomValue
    
    public let random: UInt16
    
    public init(random: UInt16) {
        
        self.random = random
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let random = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
        
        self.init(random: random)
    }
    
    public var data: Data {
        
        let value = random.littleEndian
        return Data(bytes: [value.bytes.0, value.bytes.1])
    }
}

extension GAPLESecureConnectionsRandom: Equatable {
    
    public static func == (lhs: GAPLESecureConnectionsRandom, rhs: GAPLESecureConnectionsRandom) -> Bool {
        
        return lhs.random == rhs.random
    }
}

extension GAPLESecureConnectionsRandom: CustomStringConvertible {
    
    public var description: String {
        
        return random.description
    }
}

public struct GAPSecurityManagerTKValue: GAPData {
    
    public static let length = MemoryLayout<UUID>.size
    
    public static let dataType: GAPDataType = .securityManagerTKValue
    
    public let uuid: UUID
    
    public init(uuid: UUID) {
        
        self.uuid = uuid
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let uuid = UUID(UInt128(littleEndian: UInt128(bytes: (data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7], data[8], data[9], data[10], data[11], data[12], data[13], data[14], data[15]))))
        
        self.init(uuid: uuid)
    }
    
    public var data: Data {
        
        return uuid.data
    }
}

extension GAPSecurityManagerTKValue: Equatable {
    
    public static func == (lhs: GAPSecurityManagerTKValue, rhs: GAPSecurityManagerTKValue) -> Bool {
        
        return lhs.uuid == rhs.uuid
    }
}

extension GAPSecurityManagerTKValue: CustomStringConvertible {
    
    public var description: String {
        
        return uuid.description
    }
}

/**
 GAPSecurityManagerOOBFlag
 
 The Security Manager Out of Band data type allows an out of band mechanism to be used by the Security Manager to communicate discovery information as well as other information related to the pairing process.
 
 The Security Manager Out of Band data type size is 1 octet.
 */
public enum GAPSecurityManagerOOBFlag: UInt8, BitMaskOption {
    
    #if swift(>=3.2)
    #elseif swift(>=3.0)
    public typealias RawValue = UInt8
    #endif
    
    /// OOB Flags Field
    ///
    /// 0 = OOB data not present, 1 = OOB data present
    case oobFlagsField = 0b01
    
    /// LE supported (Host)
    ///
    /// bit 65 of LMP Extended Feature bits (Page 1)
    case supportedLE = 0b10
    
    /// Simultaneous LE and BR/EDR to Same Device Capable (Host)
    ///
    /// bit 66 of LMP Extended Feature bits (Page 1)
    case simultaneousLEandBREDR = 0b100
    
    /// Address type
    ///
    /// 0 = Public Address, 1 = Random Address
    case addressType = 0b1000
    
    public static let all: Set<GAPSecurityManagerOOBFlag> = [
        .oobFlagsField,
        .supportedLE,
        .simultaneousLEandBREDR,
        .addressType
    ]
}

public struct GAPSecurityManagerOOBFlags: GAPData {
    
    public static let length = MemoryLayout<UInt8>.size
    
    public static let dataType: GAPDataType = .securityManagerOutOfBandFlags
    
    public let flags: BitMaskOptionSet<GAPSecurityManagerOOBFlag>
    
    public init(flags: BitMaskOptionSet<GAPSecurityManagerOOBFlag> = 0) {
        
        self.flags = flags
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        self.flags = BitMaskOptionSet<GAPSecurityManagerOOBFlag>(rawValue: data[0])
    }
    
    public var data: Data {
        
        return Data([flags.rawValue])
    }
}

extension GAPSecurityManagerOOBFlags: Equatable {
    
    public static func == (lhs: GAPSecurityManagerOOBFlags, rhs: GAPSecurityManagerOOBFlags) -> Bool {
        
        return lhs.flags == rhs.flags
    }
}

extension GAPSecurityManagerOOBFlags: Hashable {
    
    public var hashValue: Int {
        
        return Int(flags.rawValue)
    }
}

extension GAPSecurityManagerOOBFlags: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral rawValue: GAPSecurityManagerOOBFlag.RawValue) {
        
        self.init(flags: BitMaskOptionSet<GAPSecurityManagerOOBFlag>(rawValue: rawValue))
    }
}

/**
 
 The Slave Connection Interval Range data type contains the Peripheral’s preferred connection interval range, for all logical connections. See Vol 3, Part C, Section 12.3.
 Note: The minimum value depends on the battery considerations of the Peripheral and the maximum connection interval depends on the buffers available on the Peripheral.
 The Central should use the information from the Peripheral’s Slave Connection Interval Range data type when establishing a connection.
 Note: Central and Peripheral are GAP roles as defined in Vol.3, Part C, Section 2.2.2.
 
 The first 2 octets defines the minimum value for the connection interval in the following manner:
 connIntervalmin = Conn_Interval_Min * 1.25 ms
 Conn_Interval_Min range: 0x0006 to 0x0C80
 Value of 0xFFFF indicates no specific minimum.
 Values not defined above are reserved for future use.
 
 The other 2 octets defines the maximum value for the connection interval in the following manner:
 connIntervalmax = Conn_Interval_Max * 1.25 ms Conn_Interval_Max range: 0x0006 to 0x0C80
 Conn_Interval_Max shall be equal to or greater than the Conn_Interval_Min.
 Value of 0xFFFF indicates no specific maximum.
 Values not defined above are reserved for future use.
 
 */

public struct GAPSlaveConnectionIntervalRange: GAPData {
    
    public static let length = 4
    
    public static let min: UInt16 = 0x0006
    
    public static let max: UInt16 = 0x0C80
    
    public static let undefined: UInt16 = 0xFFFF
    
    public static let dataType: GAPDataType = .slaveConnectionIntervalRange
    
    public let intervalRange: (UInt16, UInt16)
    
    public init?(intervalRange: (UInt16, UInt16)) {
        
        guard (GAPSlaveConnectionIntervalRange.min <= intervalRange.0 && GAPSlaveConnectionIntervalRange.max >= intervalRange.0) || intervalRange.0 == GAPSlaveConnectionIntervalRange.undefined,
            (GAPSlaveConnectionIntervalRange.min <= intervalRange.1 && GAPSlaveConnectionIntervalRange.max >= intervalRange.1) || intervalRange.1 == GAPSlaveConnectionIntervalRange.undefined
            else { return nil }
        
        self.intervalRange = intervalRange
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let min = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
        let max = UInt16(littleEndian: UInt16(bytes: (data[2], data[3])))
        
        self.init(intervalRange: (min, max))
    }
    
    public var data: Data {
        
        let range = (min: intervalRange.0.littleEndian.bytes, max: intervalRange.1.littleEndian.bytes)
        
        return Data([range.min.0, range.min.1, range.max.0, range.max.1])
    }
    
}

extension GAPSlaveConnectionIntervalRange: Equatable {
    
    public static func == (lhs: GAPSlaveConnectionIntervalRange, rhs: GAPSlaveConnectionIntervalRange) -> Bool {
        
        return lhs.intervalRange == rhs.intervalRange
    }
}

extension GAPSlaveConnectionIntervalRange: CustomStringConvertible {
    
    public var description: String {
        
        return "\(intervalRange.0, intervalRange.1)"
    }
}

/// A Peripheral device may send the Service Solicitation data type to invite Central devices that expose one or more of the services specified in the Service Solicitation data to connect. The Peripheral device should be in the undirected connectable mode and in one of the discoverable modes. This enables a Central device providing one or more of these services to connect to the Peripheral device, so that the Peripheral device can use the services on the Central device.

/// Note: Central and Peripheral are GAP roles as defined in Vol.3, Part C, Section 2.2.2.

/// GAP List of 16 bit Service Solicitation UUIDs
public struct GAPListOf16BitServiceSolicitationUUIDs: GAPData {
    
    public static let dataType: GAPDataType = .listOf16BitServiceSolicitationUUIDs
    
    public let uuids: [UInt16]
    
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

extension GAPListOf16BitServiceSolicitationUUIDs: ExpressibleByArrayLiteral {
    
    public init(arrayLiteral elements: UInt16...) {
        
        self.init(uuids: elements)
    }
}

extension GAPListOf16BitServiceSolicitationUUIDs: Equatable {
    
    public static func == (lhs: GAPListOf16BitServiceSolicitationUUIDs, rhs: GAPListOf16BitServiceSolicitationUUIDs) -> Bool {
        
        return lhs.uuids == rhs.uuids
    }
}

extension GAPListOf16BitServiceSolicitationUUIDs: CustomStringConvertible {
    
    public var description: String {
        
        return uuids.description
    }
}

/// GAP List of 32 bit Service Solicitation UUIDs
public struct GAPListOf32BitServiceSolicitationUUIDs: GAPData {
    
    public static let dataType: GAPDataType = .listOf32BitServiceSolicitationUUIDs
    
    public let uuids: [UInt32]
    
    public init(uuids: [UInt32] = []) {
        
        self.uuids = uuids
    }
    
    public init?(data: Data) {
        
        guard let list = Bit32UUIDList(data: data)
            else { return nil }
        
        self.uuids = list.uuids
    }
    
    public var data: Data {
        
        return Bit32UUIDList(uuids: uuids).data
    }
}

extension GAPListOf32BitServiceSolicitationUUIDs: ExpressibleByArrayLiteral {
    
    public init(arrayLiteral elements: UInt32...) {
        
        self.init(uuids: elements)
    }
}

extension GAPListOf32BitServiceSolicitationUUIDs: Equatable {
    
    public static func == (lhs: GAPListOf32BitServiceSolicitationUUIDs, rhs: GAPListOf32BitServiceSolicitationUUIDs) -> Bool {
        
        return lhs.uuids == rhs.uuids
    }
}

extension GAPListOf32BitServiceSolicitationUUIDs: CustomStringConvertible {
    
    public var description: String {
        
        return uuids.description
    }
}

/// GAP List of 128 bit Service Solicitation UUIDs
public struct GAPListOf128BitServiceSolicitationUUIDs: GAPData {
    
    public static let dataType: GAPDataType = .listOf128BitServiceSolicitationUUIDs
    
    public let uuids: [UUID]
    
    public init(uuids: [UUID] = []) {
        
        self.uuids = uuids
    }
    
    public init?(data: Data) {
        
        guard let list = Bit128UUIDList(data: data)
            else { return nil }
        
        self.uuids = list.uuids.map(UUID.init)
    }
    
    public var data: Data {
        
        return Bit128UUIDList(uuids: uuids.map(UInt128.init)).data
    }
}

extension GAPListOf128BitServiceSolicitationUUIDs: ExpressibleByArrayLiteral {
    
    public init(arrayLiteral elements: UUID...) {
        
        self.init(uuids: elements)
    }
}

extension GAPListOf128BitServiceSolicitationUUIDs: Equatable {
    
    public static func == (lhs: GAPListOf128BitServiceSolicitationUUIDs, rhs: GAPListOf128BitServiceSolicitationUUIDs) -> Bool {
        
        return lhs.uuids == rhs.uuids
    }
}

extension GAPListOf128BitServiceSolicitationUUIDs: CustomStringConvertible {
    
    public var description: String {
        
        return uuids.description
    }
}

/// The Service Data data type consists of a service UUID with the data associated with that service.
///
/// Size: 2 or more octets
/// The first 2 octets contain the 16 bit Service UUID followed by additional service data
public struct GAPServiceData16BitUUID: GAPData {
    
    public static let uuidLength = MemoryLayout<UInt16>.size
    
    public static let dataType: GAPDataType = .serviceData16BitUUID
    
    public let uuid: UInt16
    public private(set) var serviceData: [UInt8] = []
    
    public init(uuid: UInt16, serviceData: [UInt8] = []) {
        
        self.uuid = uuid
        self.serviceData = serviceData
    }
    
    public init?(data: Data) {
        
        guard data.count >= type(of: self).uuidLength
            else { return nil }
        
        let uuid = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
        var serviceData = [UInt8]()
        
        data.enumerated().forEach { (index, element) in
            if index >= GAPServiceData16BitUUID.uuidLength {
                serviceData.append(element)
            }
        }
        
        self.init(uuid: uuid, serviceData: serviceData)
    }
    
    public var data: Data {
        
        let bytes = UInt16(littleEndian: uuid).bytes
        let data = Data([bytes.0, bytes.1])
        
        return serviceData.reduce(data, { $0.0 + [$0.1] })
    }
}

extension GAPServiceData16BitUUID: Equatable {
    
    public static func == (lhs: GAPServiceData16BitUUID, rhs: GAPServiceData16BitUUID) -> Bool {
        
        return lhs.uuid == rhs.uuid && lhs.serviceData == rhs.serviceData
    }
}

extension GAPServiceData16BitUUID: CustomStringConvertible {
    
    public var description: String {
        
        return uuid.description + serviceData.map { String($0) }.description
    }
}

/// The Service Data data type consists of a service UUID with the data associated with that service.
///
/// Size: 4 or more octets
/// The first 4 octets contain the 32 bit Service UUID followed by additional service data
public struct GAPServiceData32BitUUID: GAPData {
    
    public static let uuidLength = MemoryLayout<UInt32>.size
    
    public static let dataType: GAPDataType = .serviceData32BitUUID
    
    public let uuid: UInt32
    public private(set) var serviceData: [UInt8] = []
    
    public init(uuid: UInt32, serviceData: [UInt8] = []) {
        
        self.uuid = uuid
        self.serviceData = serviceData
    }
    
    public init?(data: Data) {
        
        guard data.count >= type(of: self).uuidLength
            else { return nil }
        
        let uuid = UInt32(littleEndian: UInt32(bytes: (data[0], data[1], data[2], data[3])))
        var serviceData = [UInt8]()
        
        data.enumerated().forEach { (index, element) in
            if index >= GAPServiceData32BitUUID.uuidLength {
                serviceData.append(element)
            }
        }
        
        self.init(uuid: uuid, serviceData: serviceData)
    }
    
    public var data: Data {
        
        let bytes = UInt32(littleEndian: uuid).bytes
        let data = Data([bytes.0, bytes.1, bytes.2, bytes.3])
        
        return serviceData.reduce(data, { $0.0 + [$0.1] })
    }
}

extension GAPServiceData32BitUUID: Equatable {
    
    public static func == (lhs: GAPServiceData32BitUUID, rhs: GAPServiceData32BitUUID) -> Bool {
        
        return lhs.uuid == rhs.uuid && lhs.serviceData == rhs.serviceData
    }
}

extension GAPServiceData32BitUUID: CustomStringConvertible {
    
    public var description: String {
        
        return uuid.description + serviceData.map { String($0) }.description
    }
}

/// The Service Data data type consists of a service UUID with the data associated with that service.
///
/// Size: 16 or more octets
/// The first 16 octets contain the 128 bit Service UUID followed by additional service data
public struct GAPServiceData128BitUUID: GAPData {
    
    public static let uuidLength = MemoryLayout<UInt128>.size
    
    public static let dataType: GAPDataType = .serviceData128BitUUID
    
    public let uuid: UUID
    public private(set) var serviceData: [UInt8] = []
    
    public init(uuid: UUID, serviceData: [UInt8] = []) {
        
        self.uuid = uuid
        self.serviceData = serviceData
    }
    
    public init?(data: Data) {
        
        guard data.count >= type(of: self).uuidLength
            else { return nil }
        
        let uuid = UInt128(littleEndian: UInt128(bytes: (data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7], data[8], data[9], data[10], data[11], data[12], data[13], data[14], data[15])))
        var serviceData = [UInt8]()
        
        data.enumerated().forEach { (index, element) in
            if index >= GAPServiceData128BitUUID.uuidLength {
                serviceData.append(element)
            }
        }
        
        self.init(uuid: UUID(uuid), serviceData: serviceData)
    }
    
    public var data: Data {
        let data = UInt128(uuid: uuid).littleEndian.data
        
        return serviceData.reduce(data, { $0.0 + [$0.1] })
    }
}

extension GAPServiceData128BitUUID: Equatable {
    
    public static func == (lhs: GAPServiceData128BitUUID, rhs: GAPServiceData128BitUUID) -> Bool {
        
        return lhs.uuid == rhs.uuid && lhs.serviceData == rhs.serviceData
    }
}

extension GAPServiceData128BitUUID: CustomStringConvertible {
    
    public var description: String {
        
        return uuid.description + serviceData.map { String($0) }.description
    }
}

/// The Appearance data type defines the external appearance of the device.
/// This value shall be the same as the Appearance characteristic, as defined in Vol. 3, Part C, Section 12.2.
public struct GAPAppearance: GAPData {
    
    public static let length = MemoryLayout<UInt16>.size
    
    public static let dataType: GAPDataType = .appearance
    
    public let appearance: UInt16
    
    public init(appearance: UInt16) {
        
        self.appearance = appearance
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let appearance = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
        
        self.init(appearance: appearance)
    }
    
    public var data: Data {
        
        let value = appearance.littleEndian
        return Data(bytes: [value.bytes.0, value.bytes.1])
    }
}

extension GAPAppearance: Equatable {
    
    public static func == (lhs: GAPAppearance, rhs: GAPAppearance) -> Bool {
        
        return lhs.appearance == rhs.appearance
    }
}

extension GAPAppearance: CustomStringConvertible {
    
    public var description: String {
        
        return appearance.description
    }
}

/// The Public Target Address data type defines the address of one or more intended recipients of an advertisement when one or more devices were bonded using a public address.
/// This data type is intended to be used to avoid a situation where a bonded device unnecessarily responds to an advertisement intended for another bonded device.
///
/// Size: Multiples of 6 octets
/// The format of each 6 octet address is the same as the Public Device Address defined in Vol. 6, Part B, Section 1.3.
///
/// The public device address is divided into the following two fields:
/// company_assigned field is contained in the 24 least significant bits
/// company_id field is contained in the 24 most significant bits
public struct GAPPublicTargetAddress: GAPData {
    
    public static let length = MemoryLayout<UInt8>.size * 6
    
    public static let dataType: GAPDataType = .publicTargetAddress
    
    public let addresses: [Address]
    
    public init(addresses: [Address]) {
        
        self.addresses = addresses
    }
    
    public init?(data: Data) {
        
        guard data.count % type(of: self).length == 0
            else { return nil }
        
        var index = 0
        var addresses = [Address]()
        
        while index < data.count {
            
            let address = Address(bytes: (data[index], data[index+1], data[index+2], data[index+3], data[index+4], data[index+5]))
            addresses.append(address)
            
            index += type(of: self).length
        }
        
        self.init(addresses: addresses)
    }
    
    public var data: Data {
        
        return addresses.reduce(Data(), { $0.0 + $0.1.data })
    }
    
}

extension GAPPublicTargetAddress: Equatable {
    
    public static func == (lhs: GAPPublicTargetAddress, rhs: GAPPublicTargetAddress) -> Bool {
        
        return lhs.addresses == rhs.addresses
    }
}

extension GAPPublicTargetAddress: CustomStringConvertible {
    
    public var description: String {
        
        return addresses.description
    }
}

/// The Random Target Address data type defines the address of one or more intended recipients of an advertisement when one or more devices were bonded using a random address.
/// This data type is intended to be used to avoid a situation where a bonded device unnecessarily responds to an advertisement intended for another bonded device.
///
/// Size: Multiples of 6 octets
/// The format of each 6 octet address is the same as the Random Device Address defined in Vol. 6, Part B, Section 1.3.
/// The Random Target Address value shall be the enumerated value as defined by Bluetooth Assigned Numbers.
public struct GAPRandomTargetAddress: GAPData {
    
    public typealias ByteValue = (UInt8, UInt8, UInt8)
    
    public static let length = MemoryLayout<UInt8>.size * 6
    
    public static let dataType: GAPDataType = .randomTargetAddress
    
    public let addresses: [Address]
    
    public init(addresses: [Address]) {
        
        self.addresses = addresses
    }
    
    public init?(data: Data) {
        
        guard data.count % type(of: self).length == 0
            else { return nil }
        
        var index = 0
        var addresses = [Address]()
        
        while index < data.count {
            
            let address = Address(bytes: (data[index], data[index+1], data[index+2], data[index+3], data[index+4], data[index+5]))
            addresses.append(address)
            
            index += type(of: self).length
        }
        
        self.init(addresses: addresses)
    }
    
    public var data: Data {
        
        return addresses.reduce(Data(), { $0.0 + $0.1.data })
    }
    
}

extension GAPRandomTargetAddress: Equatable {
    
    public static func == (lhs: GAPRandomTargetAddress, rhs: GAPRandomTargetAddress) -> Bool {
        
        return lhs.addresses == rhs.addresses
    }
}

extension GAPRandomTargetAddress: CustomStringConvertible {
    
    public var description: String {
        
        return addresses.description
    }
}

/// The Advertising Interval data type contains the advInterval value as defined in the Core specification, Volume 6, Part B, Section 4.4.2.2.
///
/// Size: 2 octets (UINT16)
/// Units: 0.625 ms
public struct GAPAdvertisingInterval: GAPData {
    
    public static let length = MemoryLayout<UInt16>.size
    
    public static let units: Double = 0.0625
    
    public static let dataType: GAPDataType = .advertisingInterval
    
    public var interval: UInt16
    
    public var miliseconds: Double {
        
        return Double(interval) * type(of: self).units
    }
    
    public init(interval: UInt16) {
        
        self.interval = interval
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let interval = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
        
        self.init(interval: interval)
    }
    
    public var data: Data {
        
        let value = interval.littleEndian
        
        return Data([value.bytes.0, value.bytes.1])
    }
}

extension GAPAdvertisingInterval: Equatable {
    
    public static func == (lhs: GAPAdvertisingInterval, rhs: GAPAdvertisingInterval) -> Bool {
        
        return lhs.interval == rhs.interval
    }
}

extension GAPAdvertisingInterval: CustomStringConvertible {
    
    public var description: String {
        
        return interval.description
    }
}

/// The LE Bluetooth Device Address data type defines the device address of the local device and the address type on the LE transport.
///
/// Size: 7 octets.
/// The format of the 6 least significant Octets is the same as the Device Address defined in [Vol. 6], Part B, Section 1.3.
/// The least significant bit of the most significant octet defines if the Device Address is a Public Address or a Random Address.
/// LSB = 1 Then Random Device Address. LSB = 0 Then Public Device Address.
/// Bits 1 to 7 in the most significant octet are reserved for future use.
public struct GAPLEBluetoothDeviceAddress: GAPData {
    
    public static let length = 7
    
    public static let dataType: GAPDataType = .LEBluetoothDeviceAddress
    
    public let address: Address
    
    public let type: GAPLEBluetoothDeviceAddressType
    
    public init(address: Address, type: GAPLEBluetoothDeviceAddressType) {
        
        self.address = address
        self.type = type
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length, let type = GAPLEBluetoothDeviceAddressType(rawValue: data[6])
            else { return nil }
        
        let address = Address(bytes: (data[0], data[1], data[2], data[3], data[4], data[5]))
        
        self.init(address: address, type: type)
    }
    
    public var data: Data {
        
        return address.data + type.data
    }
    
}

public enum GAPLEBluetoothDeviceAddressType: UInt8 {
    
    /// LSB = 0 Then Public Device Address
    case `public` = 0b00
    
    /// LSB = 1 Then Random Device Address
    case random = 0b01
    
    public var data: Data {
        
        return Data(bytes: [self.rawValue])
    }
}

/// The LE Role data type defines the LE role capabilities of the device.
/// The LE Role data type size is 1 octet.
public struct GAPLERole: GAPData {
    
    public static let length = MemoryLayout<UInt8>.size
    
    public static let dataType: GAPDataType = .LERole
    
    public let role: GAPLERoleType
    
    public init(role: GAPLERoleType) {
        
        self.role = role
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length, let role = GAPLERoleType(rawValue: data[0])
            else { return nil }
        
        self.init(role: role)
    }
    
    public var data: Data {
        
        return Data([role.rawValue])
    }
    
}

public enum GAPLERoleType: UInt8 {
    
    /// Only Peripheral Role supported
    case onlyPeripheralRoleSupported = 0x00
    
    /// Only Central Role supported
    case onlyCentralRoleSupported = 0x01
    
    /// Peripheral and Central Role supported, Peripheral Role preferred for connection establishment
    case bothSupportedPeripheralPreferred = 0x02
    
    /// Peripheral and Central Role supported, Central Role preferred for connection establishment
    case bothSupportedCentralPreferred = 0x03
    
}

/**
 GAP Shortened Local Name
 
 The Local Name data type shall be the same as, or a shortened version of, the local name assigned to the device. The Local Name data type value indicates if the name is complete or shortened. If the name is shortened, the complete name can be read using the remote name request procedure over BR/EDR or by reading the device name characteristic after the connection has been established using GATT.
 
 A shortened name shall only contain contiguous characters from the beginning of the full name. For example, if the device name is ‘BT_Device_Name’ then the shortened name could be ‘BT_Device’ or ‘BT_Dev’.
 */
public struct GAPURI: GAPData {
    
    public static let dataType: GAPDataType = .uri
    
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

extension GAPURI: Equatable {
    
    public static func == (lhs: GAPURI, rhs: GAPURI) -> Bool {
        
        return lhs.name == rhs.name
    }
}

extension GAPURI: CustomStringConvertible {
    
    public var description: String {
        
        return name
    }
}

extension GAPURI: ExpressibleByStringLiteral {
    
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

/// The LE Supported Features data type defines the LE features supported by the device.
/// All 0x00 octets after the last non-zero octet shall be omitted from the value transmitted.
///
/// The LE Supported Features data type size is zero or more octets long. This allows the LE Supported Features to be represented while using the minimum number of octets within the data packet.
public struct GAPLESupportedFeatures: GAPData {
    
    public static let omittedValue: UInt8 = 0x00
    
    public static let dataType: GAPDataType = .LESupportedFeatures
    
    public let supportedFeatures: [UInt8]
    
    public init(supportedFeatures: [UInt8]) {
        
        self.supportedFeatures = supportedFeatures
    }
    
    public init?(data: Data) {
        
        var supportedFeatures = [UInt8]()
        var lastNonZero: UInt8?
        
        for i in 0..<data.count {
            
            let element = data[i]
            
            if lastNonZero != nil, element == GAPLESupportedFeatures.omittedValue {
                continue
            }
            
            supportedFeatures.append(element)
            
            if element != GAPLESupportedFeatures.omittedValue {
                lastNonZero = element
            }
        }
        
        self.init(supportedFeatures: supportedFeatures)
    }
    
    public var data: Data {
        
        var supportedData = Data()
        var lastNonZero: UInt8?
        
        for i in 0..<supportedFeatures.count {
            
            let element = supportedFeatures[i]
            
            if lastNonZero != nil, element == GAPLESupportedFeatures.omittedValue {
                continue
            }
            
            supportedData.append(element)
            
            if element != GAPLESupportedFeatures.omittedValue {
                lastNonZero = element
            }
        }
        
        return supportedData
    }
}

extension GAPLESupportedFeatures: Equatable {
    
    public static func == (lhs: GAPLESupportedFeatures, rhs: GAPLESupportedFeatures) -> Bool {
        
        return lhs.supportedFeatures == rhs.supportedFeatures
    }
}

extension GAPLESupportedFeatures: CustomStringConvertible {
    
    public var description: String {
        
        return supportedFeatures.description
    }
}

/// The channel map (channelMap) used for periodic advertisements may be updated at any time by the advertiser.
/// The advertiser can update the channel map by sending the Channel Map Update Indication data type in the extended header of the packet containing the AUX_SYNC_IND PDU.
/// The advertiser’s Host may provide an initial channel map using the LE Set Host Channel Classification HCI Command; however the advertiser’s Controller can update the channels that were marked as unknown by the Host in the channel map based on channel assessments without being requested to by the Host.
/// The Channel Map Update Indication data type shall only be present in the extended header of the packet containing the AUX_SYNC_IND PDU.
public struct GAPChannelMapUpdateIndication: GAPData {
    
    public static let length = 7
    
    public static let dataType: GAPDataType = .channelMapUpdateIndication
    
    public var channelMap: (UInt8, UInt8, UInt8, UInt8, UInt8)
    
    public var instant: (UInt8, UInt8)
    
    public init(channelMap: (UInt8, UInt8, UInt8, UInt8, UInt8), instant: (UInt8, UInt8)) {
        
        self.channelMap = channelMap
        self.instant = instant
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        self.init(channelMap: (data[0], data[1], data[2], data[3], data[4]), instant: (data[5], data[6]))
    }
    
    public var data: Data {
        
        return Data([channelMap.0, channelMap.1, channelMap.2, channelMap.3, channelMap.4, instant.0, instant.1                                      ])
    }
    
}

extension GAPChannelMapUpdateIndication: Equatable {
    
    public static func == (lhs: GAPChannelMapUpdateIndication, rhs: GAPChannelMapUpdateIndication) -> Bool {
        
        return lhs.channelMap == rhs.channelMap && lhs.instant == rhs.instant
    }
}

extension GAPChannelMapUpdateIndication: CustomStringConvertible {
    
    public var description: String {
        
        return "\(channelMap.0) \(channelMap.1) \(channelMap.2) \(channelMap.3) \(channelMap.4) \(instant.0) \(instant.1)"
    }
}

/// The Indoor Positioning Service exposes location information to support mobile devices to position themselves in an environment where GNSS signals are not available, for example in indoor premises.
/// The location information is mainly exposed via advertising and the GATT- based service is primarily intended for configuration.
public struct GAPIndoorPositioning: GAPData {
    
    public static let length = 18
    
    public static let dataType: GAPDataType = .indoorPositioning
    
    public let flags: BitMaskOptionSet<GAPIndoorPositioningFlag>
    
    public let globalCoordinatesLatitude: UInt32
    
    public let globalCoordinatesLongitude: UInt32
    
    public let localCoordinatesNorth: UInt16
    
    public let localCoordinatesEast: UInt16
    
    public let txPower: UInt8
    
    public let floorNumber: UInt8
    
    public let altitude: UInt16
    
    public let uncertainty: UInt8
    
    public init(flags: BitMaskOptionSet<GAPIndoorPositioningFlag>,
                globalCoordinatesLatitude: UInt32,
                globalCoordinatesLongitude: UInt32,
                localCoordinatesNorth: UInt16,
                localCoordinatesEast: UInt16,
                txPower: UInt8,
                floorNumber: UInt8,
                altitude: UInt16,
                uncertainty: UInt8) {
        
        self.flags = flags
        self.globalCoordinatesLatitude = globalCoordinatesLatitude
        self.globalCoordinatesLongitude = globalCoordinatesLongitude
        self.localCoordinatesNorth = localCoordinatesNorth
        self.localCoordinatesEast = localCoordinatesEast
        self.txPower = txPower
        self.floorNumber = floorNumber
        self.altitude = altitude
        self.uncertainty = uncertainty
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let flags = BitMaskOptionSet<GAPIndoorPositioningFlag>(rawValue: data[0])
        let globalCoordinatesLatitude = UInt32(littleEndian: UInt32(bytes: (data[1], data[2], data[3], data[4])))
        let globalCoordinatesLongitude = UInt32(littleEndian: UInt32(bytes: (data[5], data[6], data[7], data[8])))
        let localCoordinatesNorth = UInt16(littleEndian: UInt16(bytes: (data[9], data[10])))
        let localCoordinatesEast = UInt16(littleEndian: UInt16(bytes: (data[11], data[12])))
        let txPower = data[13]
        let floorNumber = data[14]
        let altitude = UInt16(littleEndian: UInt16(bytes: (data[15], data[16])))
        let uncertainty = data[17]
        
        self.init(flags: flags, globalCoordinatesLatitude: globalCoordinatesLatitude, globalCoordinatesLongitude: globalCoordinatesLongitude, localCoordinatesNorth: localCoordinatesNorth, localCoordinatesEast: localCoordinatesEast, txPower: txPower, floorNumber: floorNumber, altitude: altitude, uncertainty: uncertainty)
    }
    
    public var data: Data {
        
        var data = Data([flags.rawValue])
        data.reserveCapacity(GAPIndoorPositioning.length)
        
        let latitude = globalCoordinatesLatitude.littleEndian.bytes
        data += [latitude.0, latitude.1, latitude.2, latitude.3]
        
        let longitude = globalCoordinatesLongitude.littleEndian.bytes
        data += [longitude.0, longitude.1, longitude.2, longitude.3]
        
        let north = localCoordinatesNorth.littleEndian.bytes
        data += [north.0, north.1]
        
        let east = localCoordinatesEast.littleEndian.bytes
        data += [east.0, east.1]
        
        data.append(txPower)
        
        data.append(floorNumber)
        
        let altitude = self.altitude.littleEndian.bytes
        data += [altitude.0, altitude.1]
        
        data.append(uncertainty)
        
        return data
    }
    
}

public enum GAPIndoorPositioningFlag: UInt8, BitMaskOption {
    
    #if swift(>=3.2)
    #elseif swift(>=3.0)
    public typealias RawValue = UInt8
    #endif
    
    /// Presence of coordinates in advertising packets
    /// (0 = coordinates are not present, 1 = coordinates are present)
    case coordinates = 0b01
    
    /// Coordinate system used in advertising packets
    /// (0 = WGS84 coordinate system, 1 = Local coordinate system)
    case coordinateSystemUsed = 0b10
    
    /// Presence of Tx Power field in advertising packets
    /// (0 = Tx Power is not present, 1 = Tx Power is present)
    case txPower = 0b100
    
    /// Presence of Altitude field in advertising packets
    /// (0 = Altitude is not present, 1 = Altitude is present)
    case altitudePresence = 0b1000
    
    /// Presence of Floor Number in advertising packets
    /// (0 = Floor Number is not present, 1 = Floor Number is present)
    case floorNumber = 0b10000
    
    /// Presence of Uncertainty in advertising packets
    /// (0 = Uncertainty is not present, 1 = Uncertainty is present)
    case uncertainty = 0b100000
    
    /// Location Name available in the GATT database.
    /// (0 = Location Name is not present, 1 = Location Name is present)
    case locationName = 0b1000000
    
    public static let all: Set<GAPIndoorPositioningFlag> = [
        .coordinates,
        .coordinateSystemUsed,
        .txPower,
        .altitudePresence,
        .floorNumber,
        .uncertainty,
        .locationName
    ]
}

/// A Transport Block includes the following fields: Organization ID, TDS Flags, Transport Data Length, and Transport Data.
/// One or more Transport Block(s) may be present in the Transport Discovery Data AD Type.
/// The value of the fields in this section relate only to the transport which the block describes (i.e., they pertain only to that Transport Block).
/// The data contained in the Transport Block shall be able to be fully parsed by Clients even if size or other restrictions require that full data is in the GATT database.
/// The structure of the Transport Block may be repeated in case there are multiple services (on the same or different transports) to advertise simultaneously.
///
/// The structure may repeat as long as there is space available. These Transport Blocks may be from the same organization or from different organizations.
/// Where multiple Transport Blocks are used, the advertising device should list these in order of descending priority or preference.
/// For example, if the blocks represent more than one supported service, the order represents preferred support (e.g., perhaps a printer is capable of printing using a faster technology from one organization, but also a slower technology from another organization). If the blocks represent more than one required service, the order represents preferred service order (e.g., perhaps a device requires an immediate service, but also another service that is of lower priority).
public struct GAPTransportDiscoveryBlock {
    
    public static let minLength = 2
    
    public let organizationID: UInt8
    
    public let flags: BitMaskOptionSet<GAPTransportDiscoveryDataFlag>
    
    public let dataLength: UInt8
    
    public let transportData: [UInt8]
    
    public var data: Data {
        
        let data = Data([organizationID, flags.rawValue, dataLength])
        return transportData.reduce(data, { $0.0 + [$0.1] })
    }
    
}

extension GAPTransportDiscoveryBlock: Equatable {
    
    public static func == (lhs: GAPTransportDiscoveryBlock, rhs: GAPTransportDiscoveryBlock) -> Bool {
        
        return lhs.organizationID == rhs.organizationID &&
                lhs.flags == rhs.flags &&
                lhs.dataLength == rhs.dataLength &&
                lhs.transportData == rhs.transportData
    }
    
}

extension GAPTransportDiscoveryBlock: CustomStringConvertible {
    
    public var description: String {
        
        return "\(organizationID) \(flags) \(dataLength) \(transportData)"
    }
    
}

/// The Transport Discovery Data AD Type shall be present in the Advertising Data (i.e., AdvData) and may also be present in the Extended Inquiry Response (EIR).
/// EIR and Advertising Packets may be of different sizes and may contain different information within the Transport Discovery Data AD Type.
///
/// Note 1: Typically 0-26 (inclusive of the Flags AD Type), however larger values may be supported in future updates of the Core Specification.
public struct GAPTransportDiscoveryData: GAPData {
    
    public static let minBlocks = 1
    
    public static let dataType: GAPDataType = .transportDiscoveryData
    
    public let code: UInt8
    
    public let blocks: [GAPTransportDiscoveryBlock]
    
    public init(code: UInt8, blocks: [GAPTransportDiscoveryBlock]) {
        
        self.code = code
        self.blocks = blocks
    }
    
    public init?(data: Data) {
        
        var index = 1
        var blocks = [GAPTransportDiscoveryBlock]()
        
        while index < data.count {
            
            guard index + GAPTransportDiscoveryBlock.minLength < data.count
                else { return nil }
            
            let flags = BitMaskOptionSet<GAPTransportDiscoveryDataFlag>(rawValue: data[index+1])
            let length = Int(data[index+2])
            
            guard index + GAPTransportDiscoveryBlock.minLength + length < data.count
                else { return nil }
            
            let transportData: [UInt8] = stride(from: index+3, to: index+3+length, by: 1).map { data[Int($0)] }
            let block = GAPTransportDiscoveryBlock(organizationID: data[index], flags: flags, dataLength: data[index+2], transportData: transportData)
            blocks.append(block)
            
            index += (GAPTransportDiscoveryBlock.minLength + length + 1)
        }
        
        guard blocks.count >= GAPTransportDiscoveryData.minBlocks
            else { return nil }
        
        self.init(code: data[0], blocks: blocks)
    }
    
    public var data: Data {
        
        return blocks.reduce(Data([code]), { $0.0 + $0.1.data })
    }
    
}

extension GAPTransportDiscoveryData: Equatable {
    
    public static func == (lhs: GAPTransportDiscoveryData, rhs: GAPTransportDiscoveryData) -> Bool {
        
        return lhs.code == rhs.code && lhs.blocks == rhs.blocks
    }
}

extension GAPTransportDiscoveryData: CustomStringConvertible {
    
    public var description: String {
        
        return code.description + blocks.description
    }
}

public enum GAPTransportDiscoveryDataFlag: UInt8, BitMaskOption {
    
    #if swift(>=3.2)
    #elseif swift(>=3.0)
    public typealias RawValue = UInt8
    #endif
    
    /// Seeker
    case seeker = 0b01
    
    /// Provider
    case provider = 0b10
    
    /// Transport Data Incomplete
    case dataIncomplete = 0b100
    
    /// Transport State
    case stateOn = 0b1000
    
    /// Temporarily Unavailable
    case temporalilyUnavailable = 0b10000
    
    public var data: Data {
        
        return Data([self.rawValue])
    }
    
    public static let all: Set<GAPTransportDiscoveryDataFlag> = [
        .seeker,
        .provider,
        .dataIncomplete,
        .stateOn,
        .temporalilyUnavailable
    ]
}

/// Any advertisement using the Mesh Message AD Type shall be non-connectable and non-scannable undirected advertising events.
/// If a node receives a Mesh Message AD Type in a connectable advertisement or scannable advertising event, the message shall be ignored.
///
/// Note: Non-connectable advertisements are used since there is no need to include the Flags AD Type in the advertising packets, thereby enabling two additional octets to be allocated to the Network PDU (see [7]).
/// To lower the probability of packet collisions on all advertising channels, it is recommended to randomize the gap between consecutive packets within an Advertising Event (see [1]).
public struct GAPMeshMessage: GAPData {
    
    public static let length = MemoryLayout<UInt16>.size
    
    public static let dataType: GAPDataType = .meshMessage
    
    public var message: UInt16
    
    public init(message: UInt16) {
        
        self.message = message
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let message = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
        
        self.init(message: message)
    }
    
    public var data: Data {
        
        let value = message.littleEndian
        
        return Data([value.bytes.0, value.bytes.1])
    }
}

extension GAPMeshMessage: Equatable {
    
    public static func == (lhs: GAPMeshMessage, rhs: GAPMeshMessage) -> Bool {
        
        return lhs.message == rhs.message
    }
}

extension GAPMeshMessage: CustomStringConvertible {
    
    public var description: String {
        
        return message.description
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
