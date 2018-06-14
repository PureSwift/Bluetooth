//
//  HCILELongTermKeyRequestReply.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

public extension HCILowEnergyCommand {
    
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
}
