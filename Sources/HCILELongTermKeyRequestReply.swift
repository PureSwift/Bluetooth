//
//  HCILELongTermKeyRequestReply.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// LE Long Term Key Request Reply Command
    ///
    /// The LE_Long_Term_Key_Request Reply command is used to reply to an LE Long Term Key Request event
    /// from the Controller, and specifies the Long_Term_Key parameter that shall be used for
    /// this Connection_Handle.
    func lowEnergyLongTermKeyRequestReply(handle: UInt16, longTermKey: UInt128, timeout: HCICommandTimeout = .default) throws -> UInt16 {
        
        let parameters = HCILELongTermKeyRequestReply(connectionHandle: handle, longTermKey: longTermKey)
        
        let returnParameters = try deviceRequest(parameters, HCILELongTermKeyRequestReplyReturn.self, timeout: timeout)
        
        return returnParameters.connectionHandle
    }
}

// MARK: - Command

/// LE Long Term Key Request Reply Command
///
/// The command is used to reply to an LE Long Term Key Request event from the Controller,
/// and specifies the Long_Term_Key parameter that shall be used for this Connection_Handle.
public struct HCILELongTermKeyRequestReply: HCICommandParameter {
    
    public static let command = HCILowEnergyCommand.longTermKeyReply //0x001A
    
    /// Range 0x0000-0x0EFF (all other values reserved for future use)
    public let connectionHandle: UInt16 //Connection_Handle
    
    /// 128 bit long term key for the given connection.
    public let longTermKey: UInt128 //Long_Term_Key
    
    public init(connectionHandle: UInt16, longTermKey: UInt128) {
        
        self.connectionHandle = connectionHandle
        self.longTermKey = longTermKey
    }
    
    public var data: Data {
        
        let connectionHandleBytes = connectionHandle.littleEndian.bytes
        let longTermKeyBytes = longTermKey.littleEndian.bytes
        
        return Data([
            connectionHandleBytes.0,
            connectionHandleBytes.1,
            longTermKeyBytes.0,
            longTermKeyBytes.1,
            longTermKeyBytes.2,
            longTermKeyBytes.3,
            longTermKeyBytes.4,
            longTermKeyBytes.5,
            longTermKeyBytes.6,
            longTermKeyBytes.7,
            longTermKeyBytes.8,
            longTermKeyBytes.9,
            longTermKeyBytes.10,
            longTermKeyBytes.11,
            longTermKeyBytes.12,
            longTermKeyBytes.13,
            longTermKeyBytes.14,
            longTermKeyBytes.15
            ])
    }
}

// MARK: - Return parameter

/// LE Long Term Key Request Reply Command
///
/// The command is used to reply to an LE Long Term Key Request event from the Controller,
/// and specifies the Long_Term_Key parameter that shall be used for this Connection_Handle.
public struct HCILELongTermKeyRequestReplyReturn: HCICommandReturnParameter {
    
    public static let command = HCILowEnergyCommand.longTermKeyReply //0x001A
    
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
