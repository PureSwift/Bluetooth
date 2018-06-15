//
//  HCILESetAdvertisingSetRandomAddress.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// LE Set Advertising Set Random Address Command
    ///
    /// The command is used by the Host to set the random device address specified by the Random_Address parameter.
    func setAdvertisingSetRandomAddress(advertisingHandle: UInt8,
                                        advertisingRandomAddress: Address,
                                        timeout: HCICommandTimeout = .default) throws {
        
        let parameters = HCILESetAdvertisingSetRandomAddress(advertisingHandle: advertisingHandle, advertisingRandomAddress: advertisingRandomAddress)
        
        try deviceRequest(parameters, timeout: timeout)
    }
}

// MARK: - Command

/// LE Set Advertising Set Random Address Command
///
/// The command is used by the Host to set the random device address specified by the Random_Address parameter.
/// This address is used in the Controller for the advertiser's address contained in the advertising PDUs
/// for the advertising set specified by the Advertising_Handle parameter.
///
/// If the Host issues this command while an advertising set using connectable advertising is enabled,
/// the Controller shall return the error code Command Disallowed (0x0C). The Host may issue this command at any other time.
///
/// If this command is used to change the address, the new random address shall take effect for advertising no later than
/// the next successful LE Extended Set Advertising Enable Command and for periodic advertising no later than
/// the next successful LE Periodic Advertising Enable Command.
public struct HCILESetAdvertisingSetRandomAddress: HCICommandParameter { //HCI_LE_Set_Advertising_Set_Ran- dom_Address
    
    public static let command = HCILowEnergyCommand.setAdvertisingSetRandomAddress //0x0035
    
    /// Used to identify an advertising set
    public let advertisingHandle: UInt8
    
    /// Random Device Address
    public let advertisingRandomAddress: Address
    
    public init(advertisingHandle: UInt8, advertisingRandomAddress: Address) {
        self.advertisingHandle = advertisingHandle
        self.advertisingRandomAddress = advertisingRandomAddress
    }
    
    public var data: Data {
        
        let advertisingRandomAddressBytes = advertisingRandomAddress.littleEndian.bytes
        
        return Data([advertisingHandle,
                     advertisingRandomAddressBytes.0,
                     advertisingRandomAddressBytes.1,
                     advertisingRandomAddressBytes.2,
                     advertisingRandomAddressBytes.3,
                     advertisingRandomAddressBytes.4,
                     advertisingRandomAddressBytes.5])
    }
}
