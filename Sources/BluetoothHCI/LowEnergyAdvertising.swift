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
    
}
