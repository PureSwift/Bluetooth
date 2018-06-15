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
    func lowEnergyReadWhiteListSize(timeout: HCICommandTimeout = .default) throws -> Int {
        
        let sizeReturnParameter = try deviceRequest(HCILowEnergyCommand.HCILEReadWhiteListSizeReturn.self, timeout: timeout)
        
        return Int(sizeReturnParameter.size)
    }
    
    /// LE Clear White List Command
    ///
    /// Used to clear the White List stored in the Controller.
    func lowEnergyClearWhiteList(timeout: HCICommandTimeout = .default) throws {
        
        // clear white list
        try deviceRequest(HCILowEnergyCommand.clearWhiteList, timeout: timeout)
    }
    
}
