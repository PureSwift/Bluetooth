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
}
