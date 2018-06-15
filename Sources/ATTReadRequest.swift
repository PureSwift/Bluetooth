//
//  ATTReadRequest.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// Read Request
///
/// The *Read Request* is used to request the server to read the value of an attribute
/// and return its value in a *Read Response*.
public struct ATTReadRequest: ATTProtocolDataUnit {
    
    public static let attributeOpcode = ATT.Opcode.readRequest
    
    internal static let length = 1 + 2
    
    /// The handle of the attribute to read.
    public var handle: UInt16
    
    public init(handle: UInt16) {
        
        self.handle = handle
    }
    
    public init?(data: Data) {
        
        guard data.count == ATTReadRequest.length
            else { return nil }
        
        let attributeOpcodeByte = data[0]
        
        guard attributeOpcodeByte == ATTReadRequest.attributeOpcode.rawValue
            else { return nil }
        
        self.handle = UInt16(bytes: (data[1], data[2])).littleEndian
    }
    
    public var data: Data {
        
        let handleBytes = handle.littleEndian.bytes
        
        return Data([ATTReadRequest.attributeOpcode.rawValue, handleBytes.0, handleBytes.1])
    }
}
