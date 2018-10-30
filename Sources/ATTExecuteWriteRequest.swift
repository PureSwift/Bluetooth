//
//  ATTExecuteWriteRequest.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// Execute Write Request
///
/// The *Execute Write Request* is used to request the server to write or cancel the write
/// of all the prepared values currently held in the prepare queue from this client.
/// This request shall be handled by the server as an atomic operation.
public enum ATTExecuteWriteRequest: UInt8, ATTProtocolDataUnit {
    
    public static let attributeOpcode = ATT.Opcode.executeWriteRequest
    
    internal static let length = 1 + 1
    
    /// Cancel all prepared writes.
    case cancel = 0x00
    
    /// Immediately write all pending prepared values.
    case write  = 0x01
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let attributeOpcodeByte = data[0]
        let flagByte = data[1]
        
        guard attributeOpcodeByte == type(of: self).attributeOpcode.rawValue,
            let flag = ATTExecuteWriteRequest(rawValue: flagByte)
            else { return nil }
        
        self = flag
    }
    
    public var data: Data {
        
        return Data([type(of: self).attributeOpcode.rawValue, rawValue])
    }
}
