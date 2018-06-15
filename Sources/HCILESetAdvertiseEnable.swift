//
//  HCILESetAdvertiseEnable.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
 
    /// LE Set Advertising Enable
    ///
    /// The LE Set Advertising Enable command is used to request the Controller to start or stop advertising.
    /// The Controller manages the timing of advertisements as per the advertising parameters given in the
    /// LE Set Advertising Parameters command.
    func enableLowEnergyAdvertising(_ isEnabled: Bool = true,
                                    timeout: HCICommandTimeout = .default) throws {
        
        let parameter = HCILESetAdvertiseEnable(isEnabled: isEnabled)
        
        try deviceRequest(parameter, timeout: timeout)
    }
    
}

// MARK: - Command

/**
 LE Set Advertising Enable
 
 The LE Set Advertising Enable command is used to request the Controller to start or stop advertising. The Controller manages the timing of advertisements as per the advertising parameters given in the LE Set Advertising Parameters command.
 
 The Controller shall continue advertising until the Host issues an LE_Set_Advertising_Enable command with Advertising_Enable set to 0x00 (Advertising is disabled) or until a connection is created or until the Advertising is timed out due to high duty cycle Directed Advertising. In these cases, advertising is then disabled.
 
 If the advertising parameters' Own_Address_Type parameter is set to 0x01 and the random address for the device has not been initialized, the Controller shall return the error code Invalid HCI Command Parameters (0x12).
 
 If the advertising parameters' Own_Address_Type parameter is set to 0x03, the controller's resolving list did not contain a matching entry, and the random address for the device has not been initialized, the Controller shall return the error code Invalid HCI Command Parameters (0x12).
 
 - Note: Enabling advertising when it is already enabled can cause the random address to change. Disabling advertising when it is already disabled has no effect.
 */
public struct HCILESetAdvertiseEnable: HCICommandParameter { // HCI_LE_Set_Advertising_Enable
    
    public static let command = HCILowEnergyCommand.setAdvertiseEnable // 0x000A
    public static let length = 1
    
    public var isEnabled: Bool
    
    public init(isEnabled: Bool = false) {
        
        self.isEnabled = isEnabled
    }
    
    public var data: Data {
        
        return Data([isEnabled.byteValue])
    }
}
