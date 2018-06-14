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
    
    /// LE Read Resolving List Size Command
    ///
    /// This command is used to read the total number of address translation
    /// entries in the resolving list that can be stored in the Controller.
    func lowEnergyReadResolvingListSize(timeout: HCICommandTimeout = .default) throws -> UInt8 {
        
        let value = try deviceRequest(HCILowEnergyCommand.ReadResolvingListSizeReturnParameter.self,
                                      timeout: timeout)
        
        return value.resolvingListSize
    }
    
    /// LE Set Resolvable Private Address Timeout Command
    ///
    /// The command set the length of time the Controller uses a Resolvable Private Address before a new resolvable private address is generated and starts being used.
    func lowEnergySetResolvablePrivateAddressTimeout(rpaTimeout: HCILowEnergyCommand.HCILESetResolvablePrivateAddressTimeout.RPATimeout, timeout: HCICommandTimeout = .default) throws {
        
        let parameters = HCILowEnergyCommand.HCILESetResolvablePrivateAddressTimeout(rpaTimeout: rpaTimeout)
        
        try deviceRequest(parameters, timeout: timeout)
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
