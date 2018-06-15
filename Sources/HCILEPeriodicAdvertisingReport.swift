//
//  HCILEPeriodicAdvertisingReport.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/15/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// LE Periodic Advertising Report Event
///
/// The event indicates that the Controller has received a Periodic Advertising packet.
public struct HCILEPeriodicAdvertisingReport: HCIEventParameter {
    
    public static let event = LowEnergyEvent.periodicAdvertisingReport // 0x0F
    
    /// Minimum length
    public static let length = 7
    
    public let syncHandle: UInt16 // Sync_Handle
    
    public let txPower: LowEnergyTxPower
    
    public let rssi: RSSI
    
    /// This parameter is intended to be used in a future feature.
    public let unused: UInt8 // This value must be used by the Controller.
    
    public let dataStatus: DataStatus
    
    public let data: Data
    
    public init?(data: Data) {
        
        guard data.count >= type(of: self).length
            else { return nil }
        
        let syncHandle = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
        
        guard let txPower = LowEnergyTxPower(rawValue: Int8(bitPattern: data[2]))
            else { return nil }
        
        guard let rssi = RSSI(rawValue: Int8(bitPattern: data[3]))
            else { return nil }
        
        let unused = data[4]
        
        guard let dataStatus = DataStatus(rawValue: data[5])
            else { return nil }
        
        let dataLength = Int(data[6])
        
        if dataLength > 0 {
            
            let bytes = data[7 ... (7 + dataLength)]
            
            self.data = Data(bytes)
            
        } else {
            
            self.data = Data()
        }
        
        self.syncHandle = syncHandle
        self.txPower = txPower
        self.rssi = rssi
        self.unused = unused
        self.dataStatus = dataStatus
        
        assert(data.count == dataLength, "Invalid data length")
        assert(unused == 0xFF, "Invalid value for unused byte")
    }
    
    public enum DataStatus: UInt8 {
        
        /// Data complete
        case complete       = 0x00
        
        /// Data incomplete, more data to come
        case incomplete     = 0x01
        
        /// Data incomplete, data truncated, no more to come
        case truncated      = 0x02
    }
}
