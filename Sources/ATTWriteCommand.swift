//
//  ATTWriteCommand.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// Write Command
///
/// The *Write Command* is used to request the server to write the value of an attribute, typically into a control-point attribute.
public struct ATTWriteCommand: ATTProtocolDataUnit {
    
    public static let attributeOpcode = ATT.Opcode.writeCommand
    
    /// Minimum length
    internal static let length = 3
    
    /// The handle of the attribute to be set.
    public var handle: UInt16
    
    /// The value of be written to the attribute.
    public var value: Data
    
    public init(handle: UInt16,
                value: Data) {
        
        self.handle = handle
        self.value = value
    }
    
    public init?(data: Data) {
        
        guard data.count >= type(of: self).length
            else { return nil }
        
        let attributeOpcodeByte = data[0]
        
        guard attributeOpcodeByte == type(of: self).attributeOpcode.rawValue
            else { return nil }
        
        self.handle = UInt16(bytes: (data[1], data[2])).littleEndian
        
        if data.count > type(of: self).length {
            
            self.value = Data(data.suffix(from: 3))
            
        } else {
            
            self.value = Data()
        }
    }
    
    public var data: Data {
        
        let handleBytes = handle.littleEndian.bytes
        
        return Data([type(of: self).attributeOpcode.rawValue, handleBytes.0, handleBytes.1]) + value
    }
}
