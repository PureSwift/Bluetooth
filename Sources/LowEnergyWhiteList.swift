//
//  LowEnergyWhiteList.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 11/29/17.
//  Copyright © 2017 PureSwift. All rights reserved.
//

public extension BluetoothHostControllerInterface {
    
    /// LE Read White List Size Command
    ///
    /// Used to read the total number of white list entries that can be stored in the Controller.
    mutating func lowEnergyReadWhiteListSize(commandTimeout timeout: Int = HCI.defaultTimeout) throws -> Int {
        
        let sizeReturnParameter = try deviceRequest(LowEnergyCommand.ReadWhiteListSizeReturnParameter.self, timeout: timeout)
        
        return Int(sizeReturnParameter.size)
    }
    
    /// LE Clear White List Command
    ///
    /// Used to clear the White List stored in the Controller.
    mutating func lowEnergyClearWhiteList(commandTimeout timeout: Int = HCI.defaultTimeout) throws {
        
        // clear white list
        try deviceRequest(LowEnergyCommand.clearWhiteList, timeout: timeout)
    }
    
    /// LE Add Device To White List Command
    ///
    /// Used to add a single device to the White List stored in the Controller.
    mutating func lowEnergyAddDeviceToWhiteList(whiteListDevice: LowEnergyWhiteListDevice ,commandTimeout timeout: Int = HCI.defaultTimeout) throws {
        
        try deviceRequest(LowEnergyCommand.AddDeviceToWhiteListParameter(device: whiteListDevice), timeout: timeout)
    }
    
    /// LE Remove Device From White List Command
    ///
    /// Used to remove a single device from the White List stored in the Controller.
    mutating func lowEnergyRemoveDeviceToWhiteList(whiteListDevice: LowEnergyWhiteListDevice ,commandTimeout timeout: Int = HCI.defaultTimeout) throws {
        
        try deviceRequest(LowEnergyCommand.RemoveDeviceToWhiteListParameter(device: whiteListDevice), timeout: timeout)
    }
}
