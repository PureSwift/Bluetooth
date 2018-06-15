//
//  ATTReadBlobRequest.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// Read Blob Request
///
/// The *Read Blob Request* is used to request the server to read part of the value of an attribute
/// at a given offset and return a specific part of the value in a *Read Blob Response*.
public struct ATTReadBlobRequest: ATTProtocolDataUnit {
    
    public static let attributeOpcode = ATT.Opcode.readBlobRequest
    
    internal static let length = 1 + 2 + 2
    
    /// The handle of the attribute to be read.
    public var handle: UInt16
    
    /// The offset of the first octet to be read.
    public var offset: UInt16
    
    public init(handle: UInt16,
                offset: UInt16) {
        
        self.handle = handle
        self.offset = offset
    }
    
    public init?(data: Data) {
        
        guard data.count == ATTReadBlobRequest.length
            else { return nil }
        
        let attributeOpcodeByte = data[0]
        
        guard attributeOpcodeByte == ATTReadBlobRequest.attributeOpcode.rawValue
            else { return nil }
        
        self.handle = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))
        self.offset = UInt16(littleEndian: UInt16(bytes: (data[3], data[4])))
    }
    
    public var data: Data {
        
        let handleBytes = handle.littleEndian.bytes
        let offsetBytes = offset.littleEndian.bytes
        
        return Data([ATTReadBlobRequest.attributeOpcode.rawValue, handleBytes.0, handleBytes.1, offsetBytes.0, offsetBytes.1])
    }
}
