//
//  HCILESetAdvertisingData.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {

    /// LE Set Advertising Data Command
    ///
    /// Used to set the data used in advertising packets that have a data field.
    func setLowEnergyAdvertisingData(_ data: LowEnergyAdvertisingData,
                                     timeout: HCICommandTimeout = .default) throws {
        
        let parameter = HCILESetAdvertisingData(advertisingData: data)
        
        try deviceRequest(parameter, timeout: timeout)
    }
}

// MARK: - Command

/// LE Set Advertising Data Command
///
/// Used to set the data used in advertising packets that have a data field.
///
/// - Note: Only the significant part of the Advertising Data is transmitted in the advertising packets.
public struct HCILESetAdvertisingData: HCICommandParameter { // HCI_LE_Set_Advertising_Data
    
    public static let command = HCILowEnergyCommand.setAdvertisingData // 0x0008
    public static let length = 32
    
    /// 31 octets of advertising data.
    public var advertisingData: LowEnergyAdvertisingData
    
    public init(advertisingData: LowEnergyAdvertisingData = LowEnergyAdvertisingData()) {
        
        self.advertisingData = advertisingData
    }
    
    public var data: Data {
        
        return Data([advertisingData.length, advertisingData.bytes.0, advertisingData.bytes.1, advertisingData.bytes.2, advertisingData.bytes.3, advertisingData.bytes.4, advertisingData.bytes.5, advertisingData.bytes.6, advertisingData.bytes.7, advertisingData.bytes.8, advertisingData.bytes.9, advertisingData.bytes.10, advertisingData.bytes.11, advertisingData.bytes.12, advertisingData.bytes.13, advertisingData.bytes.14, advertisingData.bytes.15, advertisingData.bytes.16, advertisingData.bytes.17, advertisingData.bytes.18, advertisingData.bytes.19, advertisingData.bytes.20, advertisingData.bytes.21, advertisingData.bytes.22, advertisingData.bytes.23, advertisingData.bytes.24, advertisingData.bytes.25, advertisingData.bytes.26, advertisingData.bytes.27, advertisingData.bytes.28, advertisingData.bytes.29, advertisingData.bytes.30])
    }
}
