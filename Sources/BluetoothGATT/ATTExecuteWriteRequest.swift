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
@frozen
public enum ATTExecuteWriteRequest: UInt8, ATTProtocolDataUnit {
    
    public static var attributeOpcode: ATTOpcode { return .executeWriteRequest }
    
    /// Cancel all prepared writes.
    case cancel = 0x00
    
    /// Immediately write all pending prepared values.
    case write  = 0x01
    
    public init?(data: Data) {
        
        guard data.count == 2,
            type(of: self).validateOpcode(data)
            else { return nil }
        
        self.init(rawValue: data[1])
    }
    
    public var data: Data {
        
        return Data([type(of: self).attributeOpcode.rawValue, rawValue])
    }
}
