//
//  HCILEPeriodicAdvertisingReport.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/15/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Bluetooth

/// LE Periodic Advertising Report Event
///
/// The event indicates that the Controller has received a Periodic Advertising packet.
@frozen
public struct HCILEPeriodicAdvertisingReport<ReportData: DataContainer>: HCIEventParameter {
    
    public static var event: LowEnergyEvent { .periodicAdvertisingReport } // 0x0F
    
    /// Minimum length
    public static var length: Int { 7 }
    
    public let syncHandle: UInt16 // Sync_Handle
    
    public let txPower: LowEnergyTxPower
    
    public let rssi: RSSI
    
    /// This parameter is intended to be used in a future feature.
    public let unused: UInt8 // This value must be used by the Controller.
    
    public let dataStatus: DataStatus
    
    public let data: ReportData
    
    public init?<Data: DataContainer>(data: Data) {
        
        guard data.count >= Self.length
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
                        
            self.data = ReportData(data[7 ... (7 + dataLength)])
            
        } else {
            
            self.data = ReportData()
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
