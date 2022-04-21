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
                                                       address: BluetoothAddress,
                                                       advertisingSID: UInt8,
                                                       timeout: HCICommandTimeout = .default) async throws {
        
        let parameters = HCILERemoveDeviceToPeriodicAdvertiserList(advertiserAddressType: advertiserAddressType,
                                                                   address: address,
                                                                   advertisingSID: advertisingSID)
        
        try await deviceRequest(parameters, timeout: timeout)
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
@frozen
public struct HCILERemoveDeviceToPeriodicAdvertiserList: HCICommandParameter {
    
    public static let command = HCILowEnergyCommand.removeDeviceFromPeriodicAdvertiserList //0x0048
    
    public let advertiserAddressType: LowEnergyAdvertiserAddressType
    public let address: BluetoothAddress
    public let advertisingSID: UInt8
    
    public init(advertiserAddressType: LowEnergyAdvertiserAddressType,
                address: BluetoothAddress,
                advertisingSID: UInt8) {
        
        self.advertiserAddressType = advertiserAddressType
        self.address = address
        self.advertisingSID = advertisingSID
    }
    
    public var data: Data {
        
        return Data(self)
    }
}

// MARK: - DataConvertible

extension HCILERemoveDeviceToPeriodicAdvertiserList: DataConvertible {
    
    var dataLength: Int { return 1 + BluetoothAddress.length + 1 }
    
    static func += <T: DataContainer> (data: inout T, value: HCILERemoveDeviceToPeriodicAdvertiserList) {
        
        data += value.advertiserAddressType.rawValue
        data += value.address.littleEndian
        data += value.advertisingSID
    }
}
