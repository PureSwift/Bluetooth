//
//  HCILEPeriodicAdvertisingSyncLost.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/15/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// LE Periodic Advertising Sync Lost Event
///
/// The event indicates that the Controller has not received a Periodic Advertising packet identified
/// by Sync_Handle within the timeout period.
public struct HCILEPeriodicAdvertisingSyncLost: HCIEventParameter {
    
    public static let event = LowEnergyEvent.periodicAdvertisingSyncLost // 0x10
    
    public static let length = 2
    
    public let syncHandle: UInt16 // Sync_Handle
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let syncHandle = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
        
        self.syncHandle = syncHandle
    }
}
