//
//  iBeacon.swift
//  Bluetooth
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
                      commandTimeout: Int = HCI.defaultTimeout) throws {
                
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
    
    func enableLowEnergyAdvertising(_ enabled: Bool = true, timeout: Int = HCI.defaultTimeout) throws {
        
        let parameter = LowEnergyCommand.SetAdvertiseEnableParameter(enabled: enabled)
        
        try deviceRequest(parameter, timeout: timeout)
    }
}
