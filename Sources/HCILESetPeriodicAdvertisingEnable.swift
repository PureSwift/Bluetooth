//
//  HCILESetPeriodicAdvertisingEnable.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// LE Set Periodic Advertising Enable Command
    ///
    /// The  command is used to request the Controller to enable or disable the periodic advertising
    /// for the advertising set specified by the Advertising_Handle parameter (ordinary advertising is not affected).
    func setPeriodicAdvertisingEnable(enable: HCILESetPeriodicAdvertisingEnable.Enable,
                                      advertisingHandle: UInt8,
                                      timeout: HCICommandTimeout = .default)  throws {
        
        let parameters = HCILESetPeriodicAdvertisingEnable(enable: enable, advertisingHandle: advertisingHandle)
        
        try deviceRequest(parameters, timeout: timeout)
    }
}

// MARK: - Command

/// LE Set Periodic Advertising Enable Command
///
/// The  command is used to request the Controller to enable or disable the periodic advertising
/// for the advertising set specified by the Advertising_Handle parameter (ordinary advertising is not affected).
public struct HCILESetPeriodicAdvertisingEnable: HCICommandParameter {
    
    public static let command = HCILowEnergyCommand.setPeriodicAdvertisingEnable //0x0040
    
    public var enable: Enable
    public var advertisingHandle: UInt8 //Advertising_Handle
    
    public init(enable: Enable, advertisingHandle: UInt8) {
        self.enable = enable
        self.advertisingHandle = advertisingHandle
    }
    
    public var data: Data {
        return Data([
            enable.rawValue,
            advertisingHandle
            ])
    }
    
    public enum Enable: UInt8 {
        
        /// Periodic advertising is disabled (default)
        case disabled = 0x00
        
        /// Periodic advertising is enabled
        case enabled  = 0x01
    }
}
