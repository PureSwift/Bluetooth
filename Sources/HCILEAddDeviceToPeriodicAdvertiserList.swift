//
//  HCILEAddDeviceToPeriodicAdvertiserList.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// LE Add Device To Periodic Advertiser List Command
    ///
    /// The command is used to add a single device to the Periodic Advertiser list stored in the Controller.
    func addDeviceToPeriodicAdvertiserList(advertiserAddressType: LowEnergyAdvertiserAddressType,
                                           address: Address,
                                           advertisingSid: UInt8,
                                           timeout: HCICommandTimeout = .default)  throws {
        
        let parameters = HCILEAddDeviceToPeriodicAdvertiserList(advertiserAddressType: advertiserAddressType,
                                                                address: address,
                                                                advertisingSid: advertisingSid)
        
        try deviceRequest(parameters, timeout: timeout)
    }
}

// MARK: - Command

/// LE Add Device To Periodic Advertiser List Command
///
/// The command is used to add a single device to the Periodic Advertiser list stored in the Controller.
/// Any additions to the Periodic Advertiser list take effect immediately. If the device is already on the list,
/// the Controller shall return the error code Invalid HCI Command Parameters (0x12).
///
/// If the Host issues this command when an LE_Periodic_Advertising_Create_Sync command is pending,
/// the Controller shall return the error code Command Disallowed (0x0C).
///
/// When a Controller cannot add a device to the Periodic Advertiser list because the list is full,
/// the Controller shall return the error code Memory Capacity Exceeded (0x07).
public struct HCILEAddDeviceToPeriodicAdvertiserList: HCICommandParameter {
    
    public static let command = HCILowEnergyCommand.addDeviceToPeriodicAdvertiserList //0x0047
    
    public let advertiserAddressType: LowEnergyAdvertiserAddressType
    public let address: Address
    public let advertisingSid: UInt8
    
    public init(advertiserAddressType: LowEnergyAdvertiserAddressType,
                address: Address,
                advertisingSid: UInt8) {
        self.advertiserAddressType = advertiserAddressType
        self.address = address
        self.advertisingSid = advertisingSid
    }
    
    public var data: Data {
        
        let addressBytes = address.littleEndian.bytes
        
        return Data([
            advertiserAddressType.rawValue,
            addressBytes.0,
            addressBytes.1,
            addressBytes.2,
            addressBytes.3,
            addressBytes.4,
            addressBytes.5,
            advertisingSid
            ])
    }
}
