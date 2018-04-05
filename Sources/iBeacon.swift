//
//  iBeacon.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 1/2/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

import Foundation

// swiftlint:disable type_name
/// Describes an iBeacon to be advertised.
public struct iBeacon {
// swiftlint:enable type_name
    
    /// The unique ID of the beacons being targeted.
    public var uuid: Foundation.UUID
    
    /// The value identifying a group of beacons.
    public var major: UInt16
    
    /// The value identifying a specific beacon within a group.
    public var minor: UInt16
    
    /// The received signal strength indicator (RSSI) value (measured in decibels) for the device.
    public var rssi: Int8
    
    /// The advertising interval.
    public var interval: UInt16
    
    public init(uuid: Foundation.UUID,
                major: UInt16 = 0,
                minor: UInt16 = 0,
                rssi: Int8,
                interval: UInt16 = 200) {
        
        self.uuid = uuid
        self.major = major
        self.minor = minor
        self.rssi = rssi
        self.interval = interval
    }
}

public extension iBeacon {
    
    var advertisingData: LowEnergyCommand.SetAdvertisingDataParameter {
        
        var dataParameter = LowEnergyCommand.SetAdvertisingDataParameter()
        
        dataParameter.length = 30
        
        dataParameter.data.0 = 0x02  // length of flags
        dataParameter.data.1 = 0x01  // flags type
        dataParameter.data.2 = 0x1a  // Flags: 000011010
        dataParameter.data.3 = 0x1a  // length
        dataParameter.data.4 = 0xff  // vendor specific
        dataParameter.data.5 = 0x4c  // Apple, Inc
        dataParameter.data.6 = 0x00  // Apple, Inc
        dataParameter.data.7 = 0x02  // iBeacon
        dataParameter.data.8 = 0x15  // length: 21 = 16 byte UUID + 2 bytes major + 2 bytes minor + 1 byte RSSI
        
        // set UUID bytes
        
        let littleUUIDBytes = BluetoothUUID(uuid: uuid).bigEndian.data
        
        dataParameter.data.9 = littleUUIDBytes[0]
        dataParameter.data.10 = littleUUIDBytes[1]
        dataParameter.data.11 = littleUUIDBytes[2]
        dataParameter.data.12 = littleUUIDBytes[3]
        dataParameter.data.13 = littleUUIDBytes[4]
        dataParameter.data.14 = littleUUIDBytes[5]
        dataParameter.data.15 = littleUUIDBytes[6]
        dataParameter.data.16 = littleUUIDBytes[7]
        dataParameter.data.17 = littleUUIDBytes[8]
        dataParameter.data.18 = littleUUIDBytes[9]
        dataParameter.data.19 = littleUUIDBytes[10]
        dataParameter.data.20 = littleUUIDBytes[11]
        dataParameter.data.21 = littleUUIDBytes[12]
        dataParameter.data.22 = littleUUIDBytes[13]
        dataParameter.data.23 = littleUUIDBytes[14]
        dataParameter.data.24 = littleUUIDBytes[15]
        
        let majorBytes = major.littleEndian.bytes
        
        dataParameter.data.25 = majorBytes.0
        dataParameter.data.26 = majorBytes.1
        
        let minorBytes = minor.littleEndian.bytes
        
        dataParameter.data.27 = minorBytes.0
        dataParameter.data.28 = minorBytes.1
        
        dataParameter.data.29 = UInt8(bitPattern: rssi)
        
        return dataParameter
    }
}

public extension BluetoothHostControllerInterface {
    
    /// Enable iBeacon functionality.
    func iBeacon(_ iBeacon: iBeacon,
                 timeout: HCICommandTimeout = .default) throws {
        
        // set advertising parameters
        let advertisingParameters = LowEnergyCommand.SetAdvertisingParametersParameter(interval: (iBeacon.interval, iBeacon.interval))
        
        //print("Setting Advertising Parameters")
        
        try deviceRequest(advertisingParameters, timeout: timeout)
        
        //print("Enabling Advertising")
        
        // start advertising
        do { try enableLowEnergyAdvertising(timeout: timeout) }
        catch HCIError.commandDisallowed { /* ignore, means already turned on */ }
        
        //print("Setting iBeacon Data")
        
        // set iBeacon data
        let advertisingDataCommand = iBeacon.advertisingData
        
        try deviceRequest(advertisingDataCommand, timeout: timeout)
    }
}
