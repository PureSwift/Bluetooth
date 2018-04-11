//
//  LowEnergyRandomAddress.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 4/10/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

public extension BluetoothHostControllerInterface {
    
    /// Used by the Host to set the LE Random Device Address in the Controller.
    func lowEnergySetRandomAddress(_ address: Address, timeout: HCICommandTimeout = .default) throws {
        
        // When the LE_Set_Random_Address command has completed, a Command Complete event shall be generated.
        
        let commandParameter = LowEnergyCommand.SetRandomAddressParameter(address: address)
        
        try self.deviceRequest(commandParameter, timeout: timeout)
    }
}
