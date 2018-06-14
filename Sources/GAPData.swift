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
    public static let lowEnergyDeviceAddress: GAPDataType = 0x1B
    
    /// LE Role
    public static let lowEnergyRole: GAPDataType = 0x1C
    
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
    public static let lowEnergySecureConnectionsConfirmation: GAPDataType = 0x22
    
    /// LE Secure Connections Random Value
    public static let lowEnergySecureConnectionsRandom: GAPDataType = 0x23
    
    /// URI
    public static let uri: GAPDataType = 0x24
    
    /// Indoor Positioning
    public static let indoorPositioning: GAPDataType = 0x25
    
    /// Transport Discovery Data
    public static let transportDiscoveryData: GAPDataType = 0x26
    
    /// LE Supported Features
    public static let lowEnergySupportedFeatures: GAPDataType = 0x27
    
    /// Channel Map Update Indication
    public static let channelMapUpdateIndication: GAPDataType = 0x28
    
    /// PB-ADV
    public static let pbAdv: GAPDataType = 0x29
    
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
    .completeLocalName: "Complete Local Name",
    .txPowerLevel: "Tx Power Level",
    .classOfDevice: "Class of Device",
    .simplePairingHashC: "Simple Pairing Hash C",
    .simplePairingRandomizerR: "Simple Pairing Randomizer R",
    .securityManagerTKValue: "Security Manager TK Value",
    .securityManagerOutOfBandFlags: "Security Manager Out of Band Flags",
    .slaveConnectionIntervalRange: "Slave Connection Interval Range",
    .listOf16BitServiceSolicitationUUIDs: "List of 16-bit Service Solicitation UUIDs",
    .listOf32BitServiceSolicitationUUIDs: "List of 32-bit Service Solicitation UUIDs",
    .listOf128BitServiceSolicitationUUIDs: "List of 128-bit Service Solicitation UUIDs",
    .serviceData16BitUUID: "Service Data - 16-bit UUID",
    .serviceData32BitUUID: "Service Data - 32-bit UUID",
    .serviceData128BitUUID: "Service Data - 128-bit UUID",
    .publicTargetAddress: "Public Target Address",
    .randomTargetAddress: "Random Target Address",
    .appearance: "Appearance",
    .advertisingInterval: "Advertising Interval",
    .lowEnergyDeviceAddress: "LE Bluetooth Device Address",
    .lowEnergyRole: "LE Role",
    .lowEnergySecureConnectionsConfirmation: "LE Secure Connections Confirmation Value",
    .lowEnergySecureConnectionsRandom: "LE Secure Connections Random Value",
    .uri: "URI",
    .indoorPositioning: "Indoor Positioning",
    .transportDiscoveryData: "Transport Discovery Data",
    .lowEnergySupportedFeatures: "LE Supported Features",
    .channelMapUpdateIndication: "Channel Map Update Indication",
    .pbAdv: "PB-ADV",
    .meshMessage: "Mesh Message",
    .meshBeacon: "Mesh Beacon",
    .informationData3D: "3D Information Data",
    .manufacturerSpecificData: "Manufacturer Specific Data"
]

// MARK: - Generic Access Profile Data

/// Generic Access Profile Data
public protocol GAPData {
    
    static var dataType: GAPDataType { get }
    
    init?(data: Data)
    
    var data: Data { get }
}

// MARK: - Internal

/// Encodes / Decodes an array of 16 bit values. 
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

/// Encodes / Decodes an array of 32 bit values.
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

/// Encodes / Decodes an array of 128 bit values.
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
