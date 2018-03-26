//
//  LowEnergyConnection.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 11/29/17.
//  Copyright © 2017 PureSwift. All rights reserved.
//

public extension BluetoothHostControllerInterface {
    
    public func lowEnergyCreateConnection(address peerAddress: Address,
                                          type peerAddressType: LowEnergyAddressType = .public,
                                          ownAddressType: LowEnergyAddressType = .public,
                                          commandTimeout timeout: Int = HCI.defaultTimeout) throws -> UInt16 {
        
        let parameters = LowEnergyCommand.CreateConnectionParameter(peerAddressType: peerAddressType,
                                                                    peerAddress: peerAddress,
                                                                    ownAddressType: ownAddressType)
        
        return try lowEnergyCreateConnection(parameters: parameters, commandTimeout: timeout)
    }
    
    public func lowEnergyCreateConnection(parameters: LowEnergyCommand.CreateConnectionParameter,
                                          commandTimeout timeout: Int = HCI.defaultTimeout) throws -> UInt16 {
        
        // connect with specified parameters
        let event = try deviceRequest(commandParameter: parameters,
                                      eventParameterType: LowEnergyEvent.ConnectionCompleteParameter.self,
                                      timeout: timeout)
        
        switch event.status {
            
        case let .error(error):
            throw error
            
        case .success:
            return event.handle
        }
    }
    
    /// LE Create Connection Cancel Command
    ///
    /// The LE_Create_Connection_Cancel command is used to cancel the LE_Create_Connection command.
    /// This command shall only be issued after the LE_Create_Connection command has been issued,
    /// a Command Status event has been received for the LE Create Connection command and before 
    /// the LE Connection Complete event.
    public func lowEnergyCreateConnectionCancel(commandTimeout timeout: Int = HCI.defaultTimeout) throws {
        
        // cancel connection
        try deviceRequest(LowEnergyCommand.createConnectionCancel, timeout: timeout)
    }
    
    public func updateLowEnergyConnection(handle: UInt16) throws {
        
        
    }
}
