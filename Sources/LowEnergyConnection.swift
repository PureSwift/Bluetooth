//
//  LowEnergyConnection.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 11/29/17.
//  Copyright © 2017 PureSwift. All rights reserved.
//

public extension BluetoothHostControllerInterface {
    
    /// LE Remote Connection Parameter Request Reply Command
    ///
    /// Both the master Host and the slave Host use this command to reply to the HCI
    /// LE Remote Connection Parameter Request event. This indicates that the Host
    /// has accepted the remote device’s request to change connection parameters.
    func lowEnergyRemoteConnectionParameterRequestReply(connectionHandle: UInt16,
                                                        interval: LowEnergyConnectionIntervalRange,
                                                        latency: LowEnergyConnectionLatency,
                                                        timeOut: LowEnergySupervisionTimeout,
                                                        length: LowEnergyConnectionLength,
                                                        timeout: HCICommandTimeout = .default) throws -> UInt16 {
        
        let parameters = HCILERemoteConnectionParameterRequestReply(connectionHandle: connectionHandle,
                                                                                         interval: interval,
                                                                                         latency: latency,
                                                                                         timeOut: timeOut,
                                                                                         length: length)
        
        let returnParameters = try deviceRequest(parameters, HCILowEnergyCommand.RemoteConnectionParameterRequestReplyReturnParameter.self, timeout: timeout)
        
        return returnParameters.connectionHandle
    }
    
    /// LE Remote Connection Parameter Request Negative Reply Command
    ///
    /// Both the master Host and the slave Host use this command to reply to the HCI
    /// LE Remote Connection Parameter Request event. This indicates that the Host
    /// has rejected the remote device’s request to change connection parameters.
    /// The reason for the rejection is given in the Reason parameter.
    func lowEnergyRemoteConnectionParameterRequestNegativeReply(connectionHandle: UInt16,
                                                                reason: UInt8,
                                                                timeout: HCICommandTimeout = .default) throws -> UInt16 {
        
        let parameters = HCILowEnergyCommand.HCILERemoteConnectionParameterRequestNegativeReply(connectionHandle: connectionHandle,
                                                                                                 reason: reason)
        
        let returnParameters = try deviceRequest(parameters, HCILowEnergyCommand.RemoteConnectionParameterRequestNegativeReplyReturnParameter.self, timeout: timeout)
        
        return returnParameters.connectionHandle
    }
    
    func lowEnergyCreateConnection(address peerAddress: Address,
                                   type peerAddressType: LowEnergyAddressType = .public,
                                   ownAddressType: LowEnergyAddressType = .public,
                                   timeout: HCICommandTimeout = .default) throws -> UInt16 {
        
        let parameters = HCILECreateConnection(peerAddressType: peerAddressType,
                                                                    peerAddress: peerAddress,
                                                                    ownAddressType: ownAddressType)
        
        return try lowEnergyCreateConnection(parameters: parameters, timeout: timeout).handle
    }
    
    func lowEnergyCreateConnection(parameters: HCILECreateConnection,
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
        try deviceRequest(HCILowEnergyCommand.createConnectionCancel, timeout: timeout)
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
        
        let parameters = HCILEUpdateConnection(connectionHandle: handle,
                                                                    connectionInterval: connectionInterval,
                                                                    connectionLatency: connectionLatency,
                                                                    supervisionTimeout: supervisionTimeout,
                                                                    connectionLength: connectionLength)
        
        try deviceRequest(parameters, timeout: timeout)
    }
    
    /// LE Set Data Length Command
    ///
    /// This command allows the Host to suggest maximum transmission packet size and maximum packet transmission time
    /// to be used for a given connection. The Controller may use smaller or larger values based on local information.
    func lowEnergySetDataLength(connectionHandle: UInt16,
                                txOctets: LowEnergyMaxTxOctets,
                                txTime: LowEnergyMaxTxTime,
                                timeout: HCICommandTimeout = .default) throws -> UInt16 {
        
        let parameters = HCILowEnergyCommand.HCILESetDataLength(connectionHandle: connectionHandle,
                                                                       txOctets: txOctets,
                                                                       txTime: txTime)
        
        let returnParameters = try deviceRequest(parameters, HCILowEnergyCommand.SetDataLengthReturnParameter.self, timeout: timeout)
        
        return returnParameters.connectionHandle
    }
    
    /// LE Read Suggested Default Data Length Command
    ///
    /// This command allows the Host to read the Host's suggested values (SuggestedMaxTxOctets and SuggestedMaxTxTime)
    /// for the Controller's maximum transmitted number of payload octets and maximum packet transmission time to be used for new connections.
    func lowEnergyReadSuggestedDefaultDataLength(timeout: HCICommandTimeout = .default) throws -> HCILowEnergyCommand.ReadSuggestedDefaultDataLengthReturnParameter {
        
        return try deviceRequest(HCILowEnergyCommand.ReadSuggestedDefaultDataLengthReturnParameter.self, timeout: timeout)
    }
    
    /// LE Write Suggested Default Data Length Command
    ///
    /// The command allows the Host to specify its suggested values for the Controller's maximum transmission number
    /// of payload octets and maximum packet transmission time to be used for new connections.
    func lowEnergyWriteSuggestedDefaultDataLength(suggestedMaxTxOctets: LowEnergyMaxTxOctets,
                                                  suggestedMaxTxTime: LowEnergyMaxTxTime,
                                                  timeout: HCICommandTimeout = .default) throws {
        
        let parameters = HCILowEnergyCommand.HCILEWriteSuggestedDefaultDataLength(suggestedMaxTxOctets: suggestedMaxTxOctets,
                                                                                   suggestedMaxTxTime: suggestedMaxTxTime)
        
        try deviceRequest(parameters, timeout: timeout)
    }
    
    /// LE Read Local P-256 Public Key Command
    ///
    /// This command is used to return the local P-256 public key from the Controller.
    func lowEnergyReadLocalP256PublicKey(timeout: HCICommandTimeout = .default) throws -> UInt512 {
        
        let event = try deviceRequest(HCILowEnergyCommand.readLocalP256PublicKeyCommand,
                          LowEnergyEvent.ReadLocalP256PublicKeyCompleteEventParameter.self,
                          timeout: timeout)
        
        switch event.status {
            
        case let .error(error):
            throw error
            
        case .success:
            
            return event.localP256PublicKey
        }
    }
}
