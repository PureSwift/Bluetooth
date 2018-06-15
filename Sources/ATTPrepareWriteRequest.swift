//
//  ATTPrepareWriteRequest.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// Prepare Write Request
///
/// The *Prepare Write Request* is used to request the server to prepare to write the value of an attribute.
/// The server will respond to this request with a *Prepare Write Response*,
/// so that the client can verify that the value was received correctly.
public struct ATTPrepareWriteRequest: ATTProtocolDataUnit {
    
    public static let attributeOpcode = ATT.Opcode.preparedWriteRequest
    
    /// Minimum length
    internal static let length = 1 + 2 + 2 + 0
    
    /// The handle of the attribute to be written.
    public var handle: UInt16
    
    /// The offset of the first octet to be written.
    public var offset: UInt16
    
    /// The value of the attribute to be written.
    public var partValue: Data
    
    public init(handle: UInt16,
                offset: UInt16,
                partValue: Data) {
        
        self.handle = handle
        self.offset = offset
        self.partValue = partValue
    }
    
    public init?(data: Data) {
        
        guard data.count >= type(of: self).length
            else { return nil }
        
        let attributeOpcodeByte = data[0]
        
        guard attributeOpcodeByte == type(of: self).attributeOpcode.rawValue
            else { return nil }
        
        self.handle = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))
        
        self.offset = UInt16(littleEndian: UInt16(bytes: (data[3], data[4])))
        
        if data.count > type(of: self).length {
            
            self.partValue = Data(data.suffix(from: type(of: self).length))
            
        } else {
            
            self.partValue = Data()
        }
    }
    
    public var data: Data {
        
        let handleBytes = handle.littleEndian.bytes
        
        let offsetBytes = offset.littleEndian.bytes
        
        return Data([type(of: self).attributeOpcode.rawValue, handleBytes.0, handleBytes.1, offsetBytes.0, offsetBytes.1]) + partValue
    }
}
