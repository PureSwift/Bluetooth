//
//  LowEnergyWhiteList.swift
//  BluetoothLinux
//
//  Created by Alsey Coleman Miller on 11/29/17.
//  Copyright © 2017 PureSwift. All rights reserved.
//

public extension BluetoothHostControllerInterface {
    
    /// LE Read White List Size Command
    ///
    /// Used to read the total number of white list entries that can be stored in the Controller.
    public func lowEnergyReadWhiteListSize(commandTimeout timeout: Int = 1000) throws -> Int {
        
        let sizeReturnParameter = try deviceRequest(LowEnergyCommand.ReadWhiteListSizeReturnParameter.self, timeout: timeout)
        
        return Int(sizeReturnParameter.size)
    }
}
