//
//  iBeacon.swift
//  
//
//  Created by Alsey Coleman Miller on 10/22/20.
//

import Foundation
import Bluetooth
import BluetoothGAP

public extension BluetoothHostControllerInterface {
    
    /// Enable iBeacon functionality.
    func iBeacon(_ beacon: AppleBeacon,
                 flags: GAPFlags = [.lowEnergyGeneralDiscoverableMode, .notSupportedBREDR],
                 interval: AdvertisingInterval = .default,
                 timeout: HCICommandTimeout = .default) async throws {
        
        // stop advertising
        do { try await enableLowEnergyAdvertising(false, timeout: timeout) }
        catch HCIError.commandDisallowed { /* ignore, means already turned off */ }
        
        // set advertising parameters
        let advertisingParameters = HCILESetAdvertisingParameters(interval: (min: interval, max: interval))
                
        try await deviceRequest(advertisingParameters, timeout: timeout)
        
        // start advertising
        do { try await enableLowEnergyAdvertising(timeout: timeout) }
        catch HCIError.commandDisallowed { /* ignore, means already turned on */ }
        
        // set iBeacon data
        let advertisingDataCommand = HCILESetAdvertisingData(advertisingData: LowEnergyAdvertisingData(beacon: beacon, flags: flags))
        
        try await deviceRequest(advertisingDataCommand, timeout: timeout)
    }
}
