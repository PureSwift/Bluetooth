//
//  HCILEConnectionUpdateComplete.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// LE Connection Update Complete Event
///
/// The event is used to indicate that the Controller process to update the connection has completed.
public struct HCILEConnectionUpdateComplete: HCIEventParameter {
    
    public static let event = LowEnergyEvent.connectionUpdateComplete // 0x03
    
    public static let length: Int = 9
    
    /// `0x00` if Connection successfully completed.
    /// `HCIError` value otherwise.
    public let status: HCIStatus
    
    /// Connection Handle
    ///
    /// Range: 0x0000-0x0EFF (all other values reserved for future use)
    public let handle: UInt16 // Connection_Handle
    
    public let connInterval: LowEnergyConnectionInterval
    
    public let connLatency: LowEnergyConnectionLatency
    
    public let supervisionTimeout: LowEnergySupervisionTimeout
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let statusByte = data[0]
        
        let handle = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))
        
        let intervalRawValue = UInt16(littleEndian: UInt16(bytes: (data[3], data[4])))
        
        let latencyRawValue = UInt16(littleEndian: UInt16(bytes: (data[5], data[6])))
        
        let supervisionTimeoutRaw = UInt16(littleEndian: UInt16(bytes: (data[7], data[8])))
        
        // Parse enums and values ranges
        guard let status = HCIStatus(rawValue: statusByte),
            let supervisionTimeout = LowEnergySupervisionTimeout(rawValue: supervisionTimeoutRaw),
            let connLatency = LowEnergyConnectionLatency(rawValue: latencyRawValue)
            else { return nil }
        
        let connInterval = LowEnergyConnectionInterval(rawValue: intervalRawValue)
        
        self.status = status
        self.handle = handle
        self.connInterval = connInterval
        self.connLatency = connLatency
        self.supervisionTimeout = supervisionTimeout
    }
}
