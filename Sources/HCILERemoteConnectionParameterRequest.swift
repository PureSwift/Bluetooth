//
//  HCILERemoteConnectionParameterRequest.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// LE Remote Connection Parameter Request Event
///
/// This event indicates to the master’s Host or the slave’s Host that the remote device is requesting
/// a change in the connection parameters. The Host replies either with the HCI LE Remote Connection
/// Parameter Request Reply command or the HCI LE Remote Connection Parameter Request Negative
/// Reply command.
public struct HCILERemoteConnectionParameterRequest: HCIEventParameter {
    
    public static let event = LowEnergyEvent.remoteConnectionParameterRequest // 0x06
    
    public static let length: Int = 10
    
    public let handle: UInt16 // Connection_Handle
    
    public let interval: LowEnergyConnectionIntervalRange
    
    public let connLatency: LowEnergyConnectionLatency
    
    public let supervisionTimeout: LowEnergySupervisionTimeout
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let handle = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
        
        let intervalMinRawValue = UInt16(littleEndian: UInt16(bytes: (data[2], data[3])))
        
        let intervalMaxRawValue = UInt16(littleEndian: UInt16(bytes: (data[4], data[5])))
        
        let latencyRawValue = UInt16(littleEndian: UInt16(bytes: (data[6], data[7])))
        
        let supervisionTimeoutRaw = UInt16(littleEndian: UInt16(bytes: (data[8], data[9])))
        
        // Parse enums and values ranges
        guard let interval = LowEnergyConnectionIntervalRange(rawValue: intervalMinRawValue ... intervalMaxRawValue),
            let connLatency = LowEnergyConnectionLatency(rawValue: latencyRawValue),
            let supervisionTimeout = LowEnergySupervisionTimeout(rawValue: supervisionTimeoutRaw)
            else { return nil }
        
        self.handle = handle
        self.interval = interval
        self.connLatency = connLatency
        self.supervisionTimeout = supervisionTimeout
    }
}
