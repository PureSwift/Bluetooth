//
//  iBeacon.swift
//  BluetoothLinux
//
//  Created by Alsey Coleman Miller on 1/2/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

import Foundation

public extension BluetoothHostControllerInterface {
    
    /// Enable iBeacon functionality.
    func enableBeacon(uuid: Foundation.UUID = UUID(),
                      major: UInt16,
                      minor: UInt16,
                      rssi: Int8,
                      interval: UInt16 = 100,
                      commandTimeout: Int = 1000) throws {
                
        // set advertising parameters
        let advertisingParameters = LowEnergyCommand.SetAdvertisingParametersParameter(interval: (interval, interval))
        
        //print("Setting Advertising Parameters")
        
        try deviceRequest(advertisingParameters, timeout: commandTimeout)
        
        //print("Enabling Advertising")
        
        // start advertising
        do { try enableLowEnergyAdvertising(timeout: commandTimeout) }
        catch HCIError.commandDisallowed { /* ignore, means already turned on */ }
        
        //print("Setting iBeacon Data")
        
        // set iBeacon data
        let advertisingDataCommand = LowEnergyCommand.SetAdvertisingDataParameter(iBeacon: uuid, major: major, minor: minor, rssi: rssi)
        
        try deviceRequest(advertisingDataCommand, timeout: commandTimeout)
    }
    
    func enableLowEnergyAdvertising(_ enabled: Bool = true, timeout: Int = 1000) throws {
        
        let parameter = LowEnergyCommand.SetAdvertiseEnableParameter(enabled: enabled)
        
        try deviceRequest(parameter, timeout: timeout)
    }
}

// MARK: - Private

public extension LowEnergyCommand.SetAdvertisingDataParameter {
    
    public init(iBeacon uuid: Foundation.UUID,
                major: UInt16,
                minor: UInt16,
                rssi: Int8) {
        
        self.init()
        
        length = 30
        
        data.0 = 0x02  // length of flags
        data.1 = 0x01  // flags type
        data.2 = 0x1a  // Flags: 000011010
        data.3 = 0x1a  // length
        data.4 = 0xff  // vendor specific
        data.5 = 0x4c  // Apple, Inc
        data.6 = 0x00  // Apple, Inc
        data.7 = 0x02  // iBeacon
        data.8 = 0x15  // length: 21 = 16 byte UUID + 2 bytes major + 2 bytes minor + 1 byte RSSI
        
        // set UUID bytes
        
        let littleUUIDBytes = BluetoothUUID(uuid: uuid).littleEndianData
        
        data.9 = littleUUIDBytes[0]
        data.10 = littleUUIDBytes[1]
        data.11 = littleUUIDBytes[2]
        data.12 = littleUUIDBytes[3]
        data.13 = littleUUIDBytes[4]
        data.14 = littleUUIDBytes[5]
        data.15 = littleUUIDBytes[6]
        data.16 = littleUUIDBytes[7]
        data.17 = littleUUIDBytes[8]
        data.18 = littleUUIDBytes[9]
        data.19 = littleUUIDBytes[10]
        data.20 = littleUUIDBytes[11]
        data.21 = littleUUIDBytes[12]
        data.22 = littleUUIDBytes[13]
        data.23 = littleUUIDBytes[14]
        data.24 = littleUUIDBytes[15]
        
        let majorBytes = major.bytes
        
        data.25 = majorBytes.1
        data.26 = majorBytes.0
        
        let minorBytes = minor.bytes
        
        data.27 = minorBytes.1
        data.28 = minorBytes.0
        
        data.29 = UInt8(bitPattern: rssi)
    }
}

