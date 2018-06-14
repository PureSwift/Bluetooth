//
//  ATTFindInformationRequest.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// Find Information Request
///
/// The *Find Information Request* is used to obtain the mapping of attribute handles with their associated types.
/// This allows a client to discover the list of attributes and their types on a server.
public struct ATTFindInformationRequest: ATTProtocolDataUnit {
    
    public static let attributeOpcode = ATT.Opcode.findInformationRequest
    public static let length = 5
    
    public var startHandle: UInt16
    
    public var endHandle: UInt16
    
    public init(startHandle: UInt16 = 0, endHandle: UInt16 = 0) {
        
        self.startHandle = startHandle
        self.endHandle = endHandle
    }
    
    public init?(byteValue: [UInt8]) {
        
        guard byteValue.count == type(of: self).length
            else { return nil }
        
        let attributeOpcodeByte = byteValue[0]
        
        guard attributeOpcodeByte == type(of: self).attributeOpcode.rawValue
            else { return nil }
        
        self.startHandle = UInt16(bytes: (byteValue[1], byteValue[2])).littleEndian
        self.endHandle = UInt16(bytes: (byteValue[3], byteValue[4])).littleEndian
    }
    
    public var byteValue: [UInt8] {
        
        var bytes = [UInt8](repeating: 0, count: type(of: self).length)
        
        bytes[0] = type(of: self).attributeOpcode.rawValue
        
        let startHandleBytes = self.startHandle.littleEndian.bytes
        let endHandleBytes = self.endHandle.littleEndian.bytes
        
        bytes[1] = startHandleBytes.0
        bytes[2] = startHandleBytes.1
        
        bytes[3] = endHandleBytes.0
        bytes[4] = endHandleBytes.1
        
        return bytes
    }
}
