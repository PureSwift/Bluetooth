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
    
    /// The length of the TLV encoded data.
    internal static let length: UInt8 = 0x15 // length: 21 = 16 byte UUID + 2 bytes major + 2 bytes minor + 1 byte RSSI
    
    internal static let additionalDataLength = Int(length) + 2
    
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
    public var rssi: Int8
    
    public init(uuid: Foundation.UUID,
                major: UInt16 = 0,
                minor: UInt16 = 0,
                rssi: Int8) {
        
        self.uuid = uuid
        self.major = major
        self.minor = minor
        self.rssi = rssi
    }
    
    public init?(manufactererData: GAPManufacturerSpecificData) {
        
        let data = manufactererData.additionalData
        
        guard manufactererData.companyIdentifier == type(of: self).companyIdentifier,
            data.count == type(of: self).additionalDataLength
            else { return nil }
        
        let dataType = data[0]
        
        guard dataType == type(of: self).appleDataType
            else { return nil }
        
        let length = data[1]
        
        guard length == type(of: self).length
            else { return nil }
        
        let uuid = BluetoothUUID(bigEndian: BluetoothUUID(data: Data(data[2 ..< 18]))!)
        
        let major = UInt16(bigEndian: UInt16(bytes: (data[18], data[19])))
        
        let minor = UInt16(bigEndian: UInt16(bytes: (data[20], data[21])))
        
        let rssi = Int8(bitPattern: data[22])
        
        self.init(uuid: UUID(bluetooth: uuid), major: major, minor: minor, rssi: rssi)
    }
    
    public var manufactererData: GAPManufacturerSpecificData {
        
        let tlvPrefix = Data([type(of: self).appleDataType, type(of: self).length])
        
        let uuidBytes = BluetoothUUID(uuid: uuid).bigEndian.data
        
        let majorBytes = major.bigEndian.bytes
        
        let minorBytes = minor.bigEndian.bytes
        
        let rssiByte = UInt8(bitPattern: rssi)
        
        // TLV coding
        let additionalData = tlvPrefix
            + uuidBytes
            + Data([majorBytes.0, majorBytes.1, minorBytes.0, minorBytes.1, rssiByte])
        
        assert(additionalData.count == type(of: self).additionalDataLength)
        
        let manufactererData = GAPManufacturerSpecificData(companyIdentifier: type(of: self).companyIdentifier,
                                                           additionalData: additionalData)
        
        return manufactererData
    }
}

internal extension LowEnergyAdvertisingData {
    
    init(beacon: AppleBeacon, flags: GAPFlags) {
        
        let data = GAPDataEncoder.encode([flags, beacon.manufactererData])
        
        guard let advertisingData = LowEnergyAdvertisingData(data: data)
            else { fatalError("Data too large to fit in advertisment (\(data.count) bytes)") }
        
        self = advertisingData
    }
}

internal extension AppleBeacon {
    
    static func from(advertisingData: LowEnergyAdvertisingData) -> (beacon: AppleBeacon, flags: GAPFlags)? {
        
        let types: [GAPData.Type] = [GAPFlags.self, GAPManufacturerSpecificData.self]
        
        guard let decodedGapData = try? GAPDataDecoder.decode(advertisingData.data, types: types),
            decodedGapData.count == 2,
            let flags = decodedGapData[0] as? GAPFlags,
            let manufactererData = decodedGapData[1] as? GAPManufacturerSpecificData,
            let beacon = AppleBeacon(manufactererData: manufactererData)
            else { return nil }
        
        return (beacon, flags)
    }
}

public extension BluetoothHostControllerInterface {
    
    /// Enable iBeacon functionality.
    func iBeacon(_ beacon: AppleBeacon,
                 flags: GAPFlags,
                 interval: AdvertisingInterval = .default,
                 timeout: HCICommandTimeout = .default) throws {
        
        typealias AdvertisingParameters = HCILESetAdvertisingParameters
        typealias SetAdvertisingData = HCILESetAdvertisingData
        
        // stop advertising
        do { try enableLowEnergyAdvertising(false, timeout: timeout) }
        catch HCIError.commandDisallowed { /* ignore, means already turned on */ }
        
        // set advertising parameters
        let advertisingParameters = AdvertisingParameters(interval: (min: interval, max: interval))
                
        try deviceRequest(advertisingParameters, timeout: timeout)
        
        // start advertising
        do { try enableLowEnergyAdvertising(timeout: timeout) }
        catch HCIError.commandDisallowed { /* ignore, means already turned on */ }
        
        // set iBeacon data
        let advertisingData = LowEnergyAdvertisingData(beacon: beacon, flags: flags)
        let advertisingDataCommand = SetAdvertisingData(advertisingData: advertisingData)
        
        try deviceRequest(advertisingDataCommand, timeout: timeout)
    }
}
