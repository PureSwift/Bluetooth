//
//  HCILESetScanResponseData.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// LE Set Scan Response Data Command
///
/// This command is used to provide data used in Scanning Packets that have a data field.
public struct HCILESetScanResponseData: HCICommandParameter { // HCI_LE_Set_Scan_Response_ Data
    
    public static let command = HCILowEnergyCommand.setScanResponseData // 0x0009
    public static let length = 32
    
    /// 31 octets of scan response data.
    public var advertisingData: LowEnergyAdvertisingData // Scan_Response_Data
    
    public init(advertisingData: LowEnergyAdvertisingData = LowEnergyAdvertisingData()) {
        
        self.advertisingData = advertisingData
    }
    
    public var data: Data {
        
        return Data([advertisingData.length, advertisingData.bytes.0, advertisingData.bytes.1, advertisingData.bytes.2, advertisingData.bytes.3, advertisingData.bytes.4, advertisingData.bytes.5, advertisingData.bytes.6, advertisingData.bytes.7, advertisingData.bytes.8, advertisingData.bytes.9, advertisingData.bytes.10, advertisingData.bytes.11, advertisingData.bytes.12, advertisingData.bytes.13, advertisingData.bytes.14, advertisingData.bytes.15, advertisingData.bytes.16, advertisingData.bytes.17, advertisingData.bytes.18, advertisingData.bytes.19, advertisingData.bytes.20, advertisingData.bytes.21, advertisingData.bytes.22, advertisingData.bytes.23, advertisingData.bytes.24, advertisingData.bytes.25, advertisingData.bytes.26, advertisingData.bytes.27, advertisingData.bytes.28, advertisingData.bytes.29, advertisingData.bytes.30])
    }
}
