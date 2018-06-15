//
//  LowEnergyAdvertising.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 3/26/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - BluetoothHostControllerInterface

public extension BluetoothHostControllerInterface {
    
    /// LE Read Advertising Channel Tx Power Command
    ///
    /// The command is used by the Host to read the transmit power level used for LE advertising channel packets.
    func readAdvertisingChannelTxPower(timeout: HCICommandTimeout = .default) throws -> HCILowEnergyCommand.ReadAdvertisingChannelTxPowerReturnParameter.TransmitPowerLevel {
        
        let value = try deviceRequest(HCILowEnergyCommand.ReadAdvertisingChannelTxPowerReturnParameter.self,
                                      timeout: timeout)
        
        return value.transmitPowerLevel
    }
    
    /// LE Read Maximum Advertising Data Length Command
    ///
    /// The ommand is used to read the maximum length of data supported by the Controller for use
    /// as advertisement data or scan response data in an advertising event or as periodic advertisement data.
    func setReadMaximumAdvertisingDataLength(timeout: HCICommandTimeout = .default) throws -> UInt16 {
        
        let value = try deviceRequest(HCILowEnergyCommand.ReadMaximumAdvertisingDataLengthReturnParameter.self,
                                      timeout: timeout)
        
        return value.maximumAdvertisingDataLength
    }
    
    /// LE Read Number of Supported Advertising Sets Command
    ///
    /// The command is used to read the maximum number of advertising sets supported by
    /// the advertising Controller at the same time. Note: The number of advertising sets that
    /// can be supported is not fixed and the Controller can change it at any time because the memory
    /// used to store advertising sets can also be used for other purposes.
    func readNumberOfSupportedAdvertisingSets(timeout: HCICommandTimeout = .default) throws -> UInt8 {
        
        let value = try deviceRequest(HCILowEnergyCommand.ReadNumberOfSupportedAdvertisingSetsReturnParameter.self,
                                      timeout: timeout)
        
        return value.numSupportedAdvertisingSets
    }
    
    /// LE Clear Advertising Sets Command
    ///
    /// The command is used to remove all existing advertising sets from the Controller.
    ///
    /// If advertising is enabled on any advertising set,
    /// then the Controller shall return the error code Command Disallowed (0x0C).
    ///
    /// Note: All advertising sets are cleared on HCI reset.
    func lowEnergyClearAdvertisingSets(timeout: HCICommandTimeout = .default) throws {
        
        try deviceRequest(HCILowEnergyCommand.clearAdvertisingSets, timeout: timeout)
    }
    
    /// LE Periodic Advertising Create Sync Cancel Command
    ///
    /// ommand is used to cancel the LE_Periodic_Advertising_Create_Sync command while it is pending.
    ///
    /// If the Host issues this command while no LE_Periodic_Advertising_Create_Sync command is pending,
    /// the Controller shall return the error code Command Disallowed (0x0C).
    func lowEnergyPeriodicAdvertisingCreateSyncCancel(timeout: HCICommandTimeout = .default) throws {
        
        try deviceRequest(HCILowEnergyCommand.periodicAdvertisingCreateSyncCancel, timeout: timeout)
    }
    
    /// LE Clear Periodic Advertiser List Command
    ///
    /// The LE_Clear_Periodic_Advertiser_List command is used to remove all devices from the list of Periodic Advertisers
    /// in the Controller.
    ///
    /// If this command is used when an LE_Periodic_Advertising_Create_Sync command is pending,
    /// the Controller shall return the error code Command Disallowed (0x0C).
    func lowEnergyClearPeriodicAdvertiserList(timeout: HCICommandTimeout = .default) throws {
        
        try deviceRequest(HCILowEnergyCommand.clearPeriodicAdvertiserList, timeout: timeout) //0x0049
    }
    
    /// LE Read Periodic Advertiser List Size Command
    ///
    /// The command is used to read the total number of Periodic Advertiser list entries that can be stored in the Controller.
    func lowEnergyReadPeriodicAdvertisingListSize(timeout: HCICommandTimeout = .default) throws -> UInt8 {
        
        let value = try deviceRequest(HCILowEnergyCommand.ReadPeriodicAdvertisingListSizeReturnParameter.self,
                                      timeout: timeout)
        
        return value.periodicAdvertiserListSize
    }
    
}
