//
//  GAPMeshBeacon.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 Mesh beacons are packets advertised periodically by nodes and unprovisioned devices.
 Mesh beacons are contained in a «Mesh Beacon» AD Type. The first octet of the Mesh Beacon advertising data payload (Beacon Type field) determines the type of beacon.
 Mesh beacons are forwarded to other bearers using the Proxy protocol (see Section 6).
 */
@frozen
public enum GAPMeshBeacon: GAPData, Equatable {
    
    public static var dataType: GAPDataType { return .meshBeacon }
    
    /// Unprovisioned Device
    case unprovisionedDevice(GAPUnprovisionedDeviceBeacon)
    
    /// Secure Network
    case secureNetwork(GAPSecureNetworkBeacon)
}

public extension GAPMeshBeacon {
    
    internal static let minimumLength = 2
    
    init?(data: Data) {
        
        guard data.count >= type(of: self).minimumLength
            else { return nil }
        
        guard let type = GAPBeaconType(rawValue: data[0])
            else { return nil }
        
        switch type {
            
        case .unprovisionedDevice:
            
            guard let beacon = GAPUnprovisionedDeviceBeacon(data: data)
                else { return nil }
            
            self = .unprovisionedDevice(beacon)
            
        case .secureNetwork:
            
            guard let beacon = GAPSecureNetworkBeacon(data: data)
                else { return nil }
            
            self = .secureNetwork(beacon)
            
        }
    }
    
    func append(to data: inout Data) {
        
        switch self {
        case let .unprovisionedDevice(beacon):
            data += beacon.data
        case let .secureNetwork(beacon):
            data += beacon.data
        }
    }
    
    var dataLength: Int {
        
        // FIXME: Improve performance
        switch self {
        case let .unprovisionedDevice(beacon):
            return beacon.data.count
        case let .secureNetwork(beacon):
            return beacon.data.count
        }
    }
}

// MARK: - Supporting Types

/// The protocol for GAP Mesh Beacon types.
public protocol GAPMeshBeaconProtocol {
    
    static var beaconType: GAPBeaconType { get }
    
    init?(data: Data)
    
    var data: Data { get }
}

/**
 The Unprovisioned Device beacon is used by devices that are unprovisioned to allow them to be discovered by a Provisioner.
 
 • Beacon type: Unprovisioned Device beacon type (0x00). Size is 1 octet
 • Device UUID: Device UUID uniquely identifying this device (see Section 3.10.3). Size is 16 octets
 • OOB Information: Size is 2 octets
 • URI Hash: Hash of the associated URI advertised with the URI AD Type (optional field). Size is 4 octets
 */
@frozen
public struct GAPUnprovisionedDeviceBeacon: GAPMeshBeaconProtocol, Equatable {
    
    /// Unprovisioned Device beacon type (0x00).
    public static var beaconType: GAPBeaconType = .unprovisionedDevice
    
    /// Device UUID uniquely identifying this device.
    public let deviceUUID: UUID
    
    /// OOB Information
    public let oobInformationFlags: BitMaskOptionSet<GAPOOBInformationFlag>
    
    /// Hash of the associated URI advertised with the URI AD Type (optional field).
    public let uriHash: UInt32?
    
    public init(deviceUUID: UUID,
                oobInformationFlags: BitMaskOptionSet<GAPOOBInformationFlag> = 0,
                uriHash: UInt32? = nil) {
        
        self.deviceUUID = deviceUUID
        self.oobInformationFlags = oobInformationFlags
        self.uriHash = uriHash
    }
    
    public init?(data: Data) {
        
        guard let length = DataLength(rawValue: data.count)
            else { return nil }
        
        guard let beaconType = GAPBeaconType(rawValue: data[0]),
            beaconType == type(of: self).beaconType
            else { return nil }
        
        let deviceUUID = UUID(UInt128(littleEndian: UInt128(bytes: (data[1], data[2], data[3], data[4], data[5], data[6], data[7], data[8], data[9], data[10], data[11], data[12], data[13], data[14], data[15], data[16]))))
        
        let oobInformationFlags = BitMaskOptionSet<GAPOOBInformationFlag>(rawValue: UInt16(littleEndian: UInt16(bytes: (data[17], data[18]))))
        
        let uriHash: UInt32?
        
        if length.uriHash {
            
            uriHash = UInt32(littleEndian: UInt32(bytes: (data[19], data[20], data[21], data[22])))
            
        } else {
            
            uriHash = nil
        }
        
        self.init(deviceUUID: deviceUUID, oobInformationFlags: oobInformationFlags, uriHash: uriHash)
    }
    
    public var data: Data {
        
        let length = DataLength(uriHash: uriHash != nil)
        
        var data = Data(capacity: length.rawValue)
        
        data.append(type(of: self).beaconType.rawValue)
        
        data.append(UInt128(uuid: deviceUUID).littleEndian.data)
        
        let flagsBytes = oobInformationFlags.rawValue.littleEndian.bytes
        
        data += [flagsBytes.0, flagsBytes.1]
        
        if let uriBytes = uriHash?.littleEndian.bytes {
            
            data += [uriBytes.0, uriBytes.1, uriBytes.2, uriBytes.3]
        }
        
        return data
    }
    
    struct DataLength: RawRepresentable {
        
        static let minimum = DataLength(19)
        
        static let maximum = DataLength(23)
        
        let rawValue: Int
        
        init?(rawValue: Int) {
            
            guard rawValue >= DataLength.minimum.rawValue,
                rawValue <= DataLength.maximum.rawValue
                else { return nil }
            
            self.rawValue = rawValue
        }
        
        init(uriHash: Bool) {
            
            var length = DataLength.minimum.rawValue
            
            if uriHash {
                
                length += 4
            }
            
            self.init(length)
        }
        
        private init(_ unsafe: Int) {
            
            self.rawValue = unsafe
        }
        
        var uriHash: Bool {
            
            return rawValue >= DataLength.minimum.rawValue + 4
        }
    }
}

@frozen
public enum GAPBeaconType: UInt8 {
    
    case unprovisionedDevice = 0x00
    
    case secureNetwork = 0x01
}

@frozen
public enum GAPOOBInformationFlag: UInt16, BitMaskOption {
    
    case other = 0b01
    
    case electronic = 0b10
    
    case machineReadableCode = 0b100
    
    case barCode = 0b1000
    
    case nearFieldCommunication = 0b10000
    
    case number = 0b100000
    
    case string = 0b1000000
    
    case onBox = 0b100000000000
    
    case insideBox = 0b1000000000000
    
    case onPieceOfPaper = 0b10000000000000
    
    case insideManual = 0b100000000000000
    
    case onDevice = 0b1000000000000000
    
    public static let allCases: [GAPOOBInformationFlag] = [
        .other,
        .electronic,
        .machineReadableCode,
        .barCode,
        .nearFieldCommunication,
        .number,
        .string,
        .onBox,
        .insideBox,
        .onPieceOfPaper,
        .insideManual,
        .onDevice
    ]
    
}

@frozen
public enum GAPSecureNetworkFlag: UInt8, BitMaskOption {
    
    case keyRefresh = 0b01
    
    case ivUpdate = 0b10
    
    public static let allCases: [GAPSecureNetworkFlag] = [
        .keyRefresh,
        .ivUpdate
    ]
    
}

/**
 The Secure Network beacon is used by nodes to identify the subnet and its security state
 
 • Beacon type: Secure Network beacon (0x01). Size is 1 octet
 • Flags: Contains the Key Refresh Flag and IV Update Flag. Size is 1 octet
 • Network ID: Contains the value of the Network ID. Size is 8 octet
 • IV Index: Contains the current IV Index. Size is 4 octet
 • Authentication Value: Authenticates security network beacon. Size is 8 octet
 
 - Note:
 The Authentication Value field is computed as defined below:
 Authentication Value = AES-CMACBeaconKey (Flags || Network ID || IV Index) [0–7]
 */
@frozen
public struct GAPSecureNetworkBeacon: GAPMeshBeaconProtocol, Equatable {
    
    internal static let length = 22
    
    public static let beaconType: GAPBeaconType = .secureNetwork
    
    public let flags: BitMaskOptionSet<GAPSecureNetworkFlag>
    
    public let networkID: UInt64
    
    public let ivIndex: UInt32
    
    public let authenticationValue: UInt64
    
    public init(flags: BitMaskOptionSet<GAPSecureNetworkFlag>,
                networkID: UInt64,
                ivIndex: UInt32,
                authenticationValue: UInt64) {
        
        self.flags = flags
        self.networkID = networkID
        self.ivIndex = ivIndex
        self.authenticationValue = authenticationValue
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        guard let beaconType = GAPBeaconType(rawValue: data[0]),
            beaconType == type(of: self).beaconType
            else { return nil }
        
        let flags = BitMaskOptionSet<GAPSecureNetworkFlag>(rawValue: data[1])
        
        let networkID = UInt64(littleEndian: UInt64(bytes: (data[2], data[3], data[4], data[5], data[6], data[7], data[8], data[9])))
        
        let ivIndex = UInt32(littleEndian: UInt32(bytes: (data[10], data[11], data[12], data[13])))
        
        let authenticationValue = UInt64(littleEndian: UInt64(bytes: (data[14], data[15], data[16], data[17], data[18], data[19], data[20], data[21])))
        
        self.init(flags: flags, networkID: networkID, ivIndex: ivIndex, authenticationValue: authenticationValue)
    }
    
    public var data: Data {
        
        var data = Data(capacity: type(of: self).length)
        
        data.append(type(of: self).beaconType.rawValue)
        
        data.append(flags.rawValue)
        
        let networkIDBytes = networkID.littleEndian.bytes
        
        data += [networkIDBytes.0, networkIDBytes.1, networkIDBytes.2, networkIDBytes.3, networkIDBytes.4, networkIDBytes.5, networkIDBytes.6, networkIDBytes.7]
        
        let ivIndexBytes = ivIndex.littleEndian.bytes
        
        data += [ivIndexBytes.0, ivIndexBytes.1, ivIndexBytes.2, ivIndexBytes.3]
        
        let authValueBytes = authenticationValue.littleEndian.bytes
        
        data += [authValueBytes.0, authValueBytes.1, authValueBytes.2, authValueBytes.3, authValueBytes.4, authValueBytes.5, authValueBytes.6, authValueBytes.7]
        
        return data
    }
}
