//
//  LowEnergyResolvingList.swift
//  Bluetooth
//
//  Created by Marco Estrella on 4/5/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

public extension BluetoothHostControllerInterface {
    
    /// LE Clear Resolving List Command
    ///
    /// The command is used to remove all devices from the list of address translations
    /// used to resolve Resolvable Private Addresses in the Controller.
    func lowEnergyClearResolvingList(timeout: HCICommandTimeout = .default) throws {
        
        try deviceRequest(HCILowEnergyCommand.clearResolvedList, timeout: timeout)
    }
    
    /// LE Read Maximum Data Length Command
    ///
    /// This ommand allows the Host to read the Controller’s maximum supported payload octets
    /// and packet duration times for transmission and reception
    func lowEnergyReadMaximumDataLengthReturn(timeout: HCICommandTimeout = .default) throws -> HCILowEnergyCommand.ReadMaximumDataLengthReturnParameter {
        
        let value = try deviceRequest(HCILowEnergyCommand.ReadMaximumDataLengthReturnParameter.self,
                                      timeout: timeout)
        
        return value
    }

}
