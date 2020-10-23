//
//  HCILERemoveAdvertisingSet.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// LE Remove Advertising Set Command
    ///
    /// The command is used to remove an advertising set from the Controller.
    func setLowEnergyRemoveAdvertisingSet(advertisingHandle: UInt8, timeout: HCICommandTimeout = .default) throws {
        
        let parameters = HCILERemoveAdvertisingSet(advertisingHandle: advertisingHandle)
        
        try deviceRequest(parameters, timeout: timeout)
    }
}

// MARK: - Command

/// LE Remove Advertising Set Command
///
/// The command is used to remove an advertising set from the Controller.
///
/// If the advertising set corresponding to the Advertising_Handle parameter does not exist,
/// then the Controller shall return the error code Unknown Advertising Identifier (0x42).
/// If advertising on the advertising set is enabled, then the Controller shall return the error code
/// Command Disallowed (0x0C).
public struct HCILERemoveAdvertisingSet: HCICommandParameter {
    
    public static let command = HCILowEnergyCommand.removeAdvertisingSet //0x003C
    
    /// Used to identify an advertising set
    public var advertisingHandle: UInt8 //Advertising_Handle
    
    public init(advertisingHandle: UInt8) {
        self.advertisingHandle = advertisingHandle
    }
    
    public var data: Data {
        return Data([advertisingHandle])
    }
}
