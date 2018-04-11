//
//  InformationalParameters.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 4/11/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

public extension BluetoothHostControllerInterface {
    
    public typealias LocalVersionInformation = InformationalCommand.ReadLocalVersionInformationReturnParameter
    
    /// This command reads the values for the version information for the local Controller.
    func readLocalVersionInformation(timeout: HCICommandTimeout = .default) throws -> LocalVersionInformation {
        
        return try deviceRequest(InformationalCommand.ReadLocalVersionInformationReturnParameter.self, timeout: timeout)
    }
    
    /// Read Device Address
    func readDeviceAddress(timeout: HCICommandTimeout = .default) throws -> Address {
        
        return try deviceRequest(InformationalCommand.ReadDeviceAddressReturnParameter.self, timeout: timeout).address
    }
}
