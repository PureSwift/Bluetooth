//
//  LowEnergyConnection.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 11/29/17.
//  Copyright © 2017 PureSwift. All rights reserved.
//

public extension BluetoothHostControllerInterface {
    
    func lowEnergyCreateConnection(address peerAddress: Address,
                                   type peerAddressType: LowEnergyAddressType = .public,
                                   ownAddressType: LowEnergyAddressType = .public,
                                   timeout: HCICommandTimeout = .default) throws -> UInt16 {
        
        let parameters = LowEnergyCommand.CreateConnectionParameter(peerAddressType: peerAddressType,
                                                                    peerAddress: peerAddress,
                                                                    ownAddressType: ownAddressType)
        
        return try lowEnergyCreateConnection(parameters: parameters, timeout: timeout).handle
    }
    
    func lowEnergyCreateConnection(parameters: LowEnergyCommand.CreateConnectionParameter,
                                   timeout: HCICommandTimeout = .default) throws -> LowEnergyEvent.ConnectionCompleteParameter {
        
        // connect with specified parameters
        let event = try deviceRequest(parameters,
                                      LowEnergyEvent.ConnectionCompleteParameter.self,
                                      timeout: timeout)
        
        switch event.status {
            
        case let .error(error):
            throw error
            
        case .success:
            
            return event
        }
    }
    
    /// LE Create Connection Cancel Command
    ///
    /// The LE_Create_Connection_Cancel command is used to cancel the LE_Create_Connection command.
    /// This command shall only be issued after the LE_Create_Connection command has been issued,
    /// a Command Status event has been received for the LE Create Connection command and before 
    /// the LE Connection Complete event.
    func lowEnergyCreateConnectionCancel(timeout: HCICommandTimeout = .default) throws {
        
        // cancel connection
        try deviceRequest(LowEnergyCommand.createConnectionCancel, timeout: timeout)
    }
    
    /// LE Connection Update Command
    ///
    /// The LE_Connection_Update command is used to change the Link Layer connection parameters of a connection.
    /// This command may be issued on both the master and slave.
    func updateLowEnergyConnection(handle: UInt16,
                                   connectionInterval: LowEnergyConnectionIntervalRange = .full,
                                   connectionLatency: LowEnergyConnectionLatency = .zero,
                                   supervisionTimeout: LowEnergySupervisionTimeout = .max,
                                   connectionLength: LowEnergyConnectionLength = .full,
                                   timeout: HCICommandTimeout = .default) throws {
        
        let parameters = LowEnergyCommand.UpdateConnectionParameter(connectionHandle: handle,
                                                                    connectionInterval: connectionInterval,
                                                                    connectionLatency: connectionLatency,
                                                                    supervisionTimeout: supervisionTimeout,
                                                                    connectionLength: connectionLength)
        
        try deviceRequest(parameters, timeout: timeout)
    }
}
