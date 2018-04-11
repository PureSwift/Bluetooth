//
//  LongTermKeyRequest.swift
//  Bluetooth
//
//  Created by Marco Estrella on 4/3/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

public extension BluetoothHostControllerInterface {
    
    /// LE Long Term Key Request Reply Command
    ///
    /// The LE_Long_Term_Key_Request Reply command is used to reply to an LE Long Term Key Request event
    /// from the Controller, and specifies the Long_Term_Key parameter that shall be used for
    /// this Connection_Handle. 
    func lowEnergyLongTermKeyRequestReply(handle: UInt16, longTermKey: UInt128, timeout: HCICommandTimeout = .default) throws -> UInt16 {
        
        let parameters = LowEnergyCommand.LongTermKeyRequestReplyParameter(connectionHandle: handle, longTermKey: longTermKey)
        
        let returnParameters = try deviceRequest(parameters, LowEnergyCommand.LongTermKeyRequestReplyReturnParameter.self, timeout: timeout)
        
        return returnParameters.connectionHandle
    }
    
    /// LE Long Term Key Request Negative Reply Command
    ///
    /// The command is used to reply to an LE Long Term Key Request event from
    /// the Controller if the Host cannot provide a Long Term Key for this Connection_Handle.
    func lowEnergyLongTermKeyRequestNegativeReply(handle: UInt16, timeout: HCICommandTimeout = .default) throws -> UInt16 {
        
        let parameters = LowEnergyCommand.LongTermKeyRequestNegativeReplyParameter(connectionHandle: handle)
        
        let returnParameters = try deviceRequest(parameters, LowEnergyCommand.LongTermKeyRequestNegativeReplyReturnParameter.self, timeout: timeout)
        
        return returnParameters.connectionHandle
    }
}
