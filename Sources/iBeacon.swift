//
//  iBeacon.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 1/2/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

import Foundation

/**
 Apple iBeacon
 
 iBeacon is an exciting technology enabling new location awareness possibilities for apps. Leveraging Bluetooth Low Energy (BLE), a device with iBeacon technology can be used to establish a region around an object. This allows an iOS device to determine when it has entered or left the region, along with an estimation of proximity to a beacon . There are both hardware and software components to consider when using iBeacon technology, and this document will give an introduction to both, along with suggested uses and best practices to help ensure a highly effective deployment leading to an outstanding user experience.
 
 Devices with iBeacon technology can be powered using coin cell batteries for a month or longer, or operate for months at a time using larger batteries, or can be powered externally for extended periods of time. iOS devices can also be configured to generate iBeacon advertisements, although this functionality is limited in scope. This would be appropriate for uses such as a Point Of Sale or kiosk application, or for an application that wants to become an iBeacon for a short time while someone is actively using the application.
 
 - SeeAlso: [Getting Started with iBeacon](https://developer.apple.com/ibeacon/Getting-Started-with-iBeacon.pdf).
 */
public struct AppleBeacon {
    
    /// The company that created this specification.
    public static let companyIdentifier: CompanyIdentifier = .apple
    
    /// Apple iBeacon data type.
    internal static let appleDataType: UInt8 = 0x02 // iBeacon
    
    /// The length of the data.
    internal static let length: UInt8 = 0x15 // length: 21 = 16 byte UUID + 2 bytes major + 2 bytes minor + 1 byte RSSI
    
    /// The unique ID of the beacons being targeted.
    ///
    /// Application developers should define a UUID specific to their app and deployment use case.
    public var uuid: Foundation.UUID
    
    /// The value identifying a group of beacons.
    ///
    /// Further specifies a specific iBeacon and use case.
    /// For example, this could define a sub-region within a larger region defined by the UUID.
    public var major: UInt16
    
    /// The value identifying a specific beacon within a group.
    ///
    /// Allows further subdivision of region or use case, specified by the application developer.
    public var minor: UInt16
    
    /// The received signal strength indicator (RSSI) value (measured in decibels) for the device.
    public var rssi: RSSI
    
    public init(uuid: Foundation.UUID,
                major: UInt16 = 0,
                minor: UInt16 = 0,
                rssi: RSSI) {
        
        self.uuid = uuid
        self.major = major
        self.minor = minor
        self.rssi = rssi
    }
    
    public init?(manufactererData: GAPManufacturerSpecificData) {
        
        guard manufactererData.companyIdentifier == type(of: self).companyIdentifier
            else { return nil }
        
        
    }
    
    public var manufactererData: GAPManufacturerSpecificData {
        
        let tlvPrefix = Data([type(of: self).appleDataType, type(of: self).length])
        
        let uuidBytes = BluetoothUUID(uuid: uuid).bigEndian.data
        
        let majorBytes = major.bigEndian.bytes
        
        let minorBytes = minor.bigEndian.bytes
        
        let rssiByte = UInt8(bitPattern: rssi.rawValue)
        
        // TLV coding
        let additionalData = tlvPrefix
            + uuidBytes
            + Data([majorBytes.0, majorBytes.1, minorBytes.0, minorBytes.1, rssiByte])
        
        assert(additionalData.count == type(of: self).length + 2)
        
        let manufactererData = GAPManufacturerSpecificData(companyIdentifier: type(of: self).companyIdentifier,
                                                           additionalData: additionalData)
        
        return manufactererData
    }
}

public extension AppleBeacon {
    
    /// The advertising interval for iBeacon.
    public struct AdvertisingInterval: RawRepresentable {
        
        public let rawValue: UInt16
        
        public init?(rawValue: UInt16) {
            
            guard rawValue <= AdvertisingInterval.max.rawValue,
                    rawValue >= AdvertisingInterval.min.rawValue
                else { return nil }
            
            self.rawValue = rawValue
        }
        
        private init(_ unsafe: UInt16) {
            
            self.rawValue = unsafe
        }
        
        public static let `default` = AdvertisingInterval(200)
        
        public static let max = AdvertisingInterval(.max)
        
        public static let min = AdvertisingInterval(100)
    }
}

internal extension AppleBeacon {
    
    init?(advertisingData: LowEnergyAdvertisingData) {
        
        let types: [GAPData.Type] = [GAPFlags.self, GAPManufacturerSpecificData.self]
        
        guard let decodedGapData = try? GAPDataDecoder.decode(data, types: types),
            let flags = decodedGapData.flatMap({ $0 as? GAPFlags }).first,
            let manufacturerSpecificData = decodedGapData.flatMap({ $0 as? GAPManufacturerSpecificData }).first
            else { return nil }
        
        
    }
    
    func advertisingDataCommand(flags: GAPFlags = 0b000011010) -> LowEnergyCommand.SetAdvertisingDataParameter {
        
        let uuidBytes = BluetoothUUID(uuid: uuid).bigEndian.data
        
        let appleDataType: UInt8 = 0x02 // iBeacon
        
        let length: UInt8 = 0x15 // length: 21 = 16 byte UUID + 2 bytes major + 2 bytes minor + 1 byte RSSI
        
        let manufactererData = GAPManufacturerSpecificData(companyIdentifier: type(of: self).company,
                                                           additionalData: Data([appleDataType, length]) + uuidBytes)
        
        let encoder = GAPDataEncoder.encode([])
        
        var dataParameter = LowEnergyCommand.SetAdvertisingDataParameter()
        
        dataParameter.data.length = 30
        
        dataParameter.data.bytes.0 = 0x02  // length of flags
        dataParameter.data.bytes.1 = 0x01  // flags type
        dataParameter.data.bytes.2 = 0x1a  // Flags: 000011010
        dataParameter.data.bytes.3 = 0x1a  // length
        dataParameter.data.bytes.4 = 0xff  // vendor specific
        dataParameter.data.bytes.5 = 0x4c  // Apple, Inc
        dataParameter.data.bytes.6 = 0x00  // Apple, Inc
        dataParameter.data.bytes.7 = 0x02  // iBeacon
        dataParameter.data.bytes.8 = 0x15  // length: 21 = 16 byte UUID + 2 bytes major + 2 bytes minor + 1 byte RSSI
        
        // set UUID bytes
        
        let uuidBytes = BluetoothUUID(uuid: uuid).bigEndian.data
        
        dataParameter.data.bytes.9 = uuidBytes[0]
        dataParameter.data.bytes.10 = uuidBytes[1]
        dataParameter.data.bytes.11 = uuidBytes[2]
        dataParameter.data.bytes.12 = uuidBytes[3]
        dataParameter.data.bytes.13 = uuidBytes[4]
        dataParameter.data.bytes.14 = uuidBytes[5]
        dataParameter.data.bytes.15 = uuidBytes[6]
        dataParameter.data.bytes.16 = uuidBytes[7]
        dataParameter.data.bytes.17 = uuidBytes[8]
        dataParameter.data.bytes.18 = uuidBytes[9]
        dataParameter.data.bytes.19 = uuidBytes[10]
        dataParameter.data.bytes.20 = uuidBytes[11]
        dataParameter.data.bytes.21 = uuidBytes[12]
        dataParameter.data.bytes.22 = uuidBytes[13]
        dataParameter.data.bytes.23 = uuidBytes[14]
        dataParameter.data.bytes.24 = uuidBytes[15]
        
        let majorBytes = major.bigEndian.bytes
        
        dataParameter.data.bytes.25 = majorBytes.0
        dataParameter.data.bytes.26 = majorBytes.1
        
        let minorBytes = minor.bigEndian.bytes
        
        dataParameter.data.bytes.27 = minorBytes.0
        dataParameter.data.bytes.28 = minorBytes.1
        
        dataParameter.data.bytes.29 = UInt8(bitPattern: rssi.rawValue)
        
        return dataParameter
    }
}

public extension BluetoothHostControllerInterface {
    
    /// Enable iBeacon functionality.
    func iBeacon(_ beacon: AppleBeacon,
                 interval: AppleBeacon.AdvertisingInterval = .default,
                 timeout: HCICommandTimeout = .default) throws {
        
        typealias AdvertisingParameters = LowEnergyCommand.SetAdvertisingParametersParameter
        
        // set advertising parameters
        let advertisingParameters = AdvertisingParameters(interval: (interval.rawValue, interval.rawValue))
                
        try deviceRequest(advertisingParameters, timeout: timeout)
        
        // start advertising
        do { try enableLowEnergyAdvertising(timeout: timeout) }
        catch HCIError.commandDisallowed { /* ignore, means already turned on */ }
        
        // set iBeacon data
        let advertisingDataCommand = beacon.advertisingDataCommand
        
        try deviceRequest(advertisingDataCommand, timeout: timeout)
    }
}
