//
//  HCILELongTermKeyRequestNegativeReply.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// LE Long Term Key Request Negative Reply Command
    ///
    /// The command is used to reply to an LE Long Term Key Request event from
    /// the Controller if the Host cannot provide a Long Term Key for this Connection_Handle.
    func lowEnergyLongTermKeyRequestNegativeReply(handle: UInt16, timeout: HCICommandTimeout = .default) throws -> UInt16 {
        
        let parameters = HCILELongTermKeyRequestNegativeReply(connectionHandle: handle)
        
        let returnParameters = try deviceRequest(parameters, HCILELongTermKeyRequestNegativeReplyReturn.self, timeout: timeout)
        
        return returnParameters.connectionHandle
    }
}

// MARK: - Command

/// LE Long Term Key Request Negative Reply Command
///
/// The command is used to reply to an LE Long Term Key Request event
/// from the Controller if the Host cannot provide a Long Term Key for this Connection_Handle.
public struct HCILELongTermKeyRequestNegativeReply: HCICommandParameter {
    
    public static let command = HCILowEnergyCommand.longTermKeyNegativeReply //0x001B
    
    /// Range 0x0000-0x0EFF (all other values reserved for future use)
    public let connectionHandle: UInt16 //Connection_Handle
    
    public init(connectionHandle: UInt16) {
        
        self.connectionHandle = connectionHandle
    }
    
    public var data: Data {
        
        let connectionHandleBytes = connectionHandle.littleEndian.bytes
        
        return Data([
            connectionHandleBytes.0,
            connectionHandleBytes.1
            ])
    }
}

// MARK: - Return parameter

/// LE Long Term Key Request Negative Reply Command
///
/// The command is used to reply to an LE Long Term Key Request event
/// from the Controller if the Host cannot provide a Long Term Key for this Connection_Handle.
public struct HCILELongTermKeyRequestNegativeReplyReturn: HCICommandReturnParameter {
    
    public static let command = HCILowEnergyCommand.longTermKeyNegativeReply //0x001B
    
    public static let length: Int = 2
    
    /// Connection_Handle
    /// Range 0x0000-0x0EFF (all other values reserved for future use)
    public let connectionHandle: UInt16 // Connection_Handle
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        connectionHandle = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
    }
}
