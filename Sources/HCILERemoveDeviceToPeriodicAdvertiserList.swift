//
//  HCILERemoveDeviceToPeriodicAdvertiserList.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// LE Remove Device From Periodic Advertiser List Command
    ///
    /// The LE_Remove_Device_From_Periodic_Advertiser_List command is used to remove one device from the list of Periodic
    /// Advertisers stored in the Controller. Removals from the Periodic Advertisers List take effect immediately.
    func lowEnergyRemoveDeviceToPeriodicAdvertiserList(advertiserAddressType: LowEnergyAdvertiserAddressType,
                                                       address: Address,
                                                       advertisingSid: UInt8,
                                                       timeout: HCICommandTimeout = .default)  throws {
        
        let parameters = HCILERemoveDeviceToPeriodicAdvertiserList(advertiserAddressType: advertiserAddressType,
                                                                   address: address,
                                                                   advertisingSid: advertisingSid)
        
        try deviceRequest(parameters, timeout: timeout)
    }
}

// MARK: - Command

/// LE Remove Device From Periodic Advertiser List Command
///
/// The LE_Remove_Device_From_Periodic_Advertiser_List command is used to remove one device from the list of Periodic
/// Advertisers stored in the Controller. Removals from the Periodic Advertisers List take effect immediately.
///
/// If the Host issues this command when an LE_Periodic_Advertising_Create_Sync command is pending, the Controller
/// shall return the error code Command Disallowed (0x0C).
///
/// When a Controller cannot remove a device from the Periodic Advertiser list because it is not found,
/// the Controller shall return the error code Unknown Advertising Identifier (0x42).
public struct HCILERemoveDeviceToPeriodicAdvertiserList: HCICommandParameter {
    
    public static let command = HCILowEnergyCommand.removeDeviceFromPeriodicAdvertiserList //0x0048
    
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
