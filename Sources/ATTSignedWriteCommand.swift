//
//  ATTSignedWriteCommand.swift
//  Bluetooth-macOS
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// Signed Write Command
///
/// The Signed Write Command is used to request the server to write the value of an attribute with an authentication signature,
/// typically into a control-point attribute.
public struct ATTSignedWriteCommand: ATTProtocolDataUnit {
    
    public typealias Signature = (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8)
    
    public static let attributeOpcode = ATT.Opcode.signedWriteCommand
    
    /// Minimum length
    internal static let length = 1 + 2 + 0 + 12
    
    /// The handle of the attribute to be set.
    public var handle: UInt16
    
    /// The value to be written to the attribute
    public var value: Data
    
    /// Authentication signature for the Attribute Upload, Attribute Handle and Attribute Value Parameters.
    public var signature: Signature
    
    public init(handle: UInt16, value: Data, signature: Signature) {
        
        self.handle = handle
        self.value = value
        self.signature = signature
    }
    
    public init?(data: Data) {
        
        let type = ATTSignedWriteCommand.self
        
        guard data.count >= type.length
            else { return nil }
        
        let attributeOpcodeByte = data[0]
        
        guard attributeOpcodeByte == type.attributeOpcode.rawValue
            else { return nil }
        
        self.handle = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))
        
        if data.count > type.length {
            
            self.value = Data(data[3 ..< data.count - 12])
            
        } else {
            
            self.value = Data()
        }
        
        self.signature = (data[data.count - 12], data[data.count - 11], data[data.count - 10], data[data.count - 9], data[data.count - 8], data[data.count - 7], data[data.count - 6], data[data.count - 5], data[data.count - 4], data[data.count - 3], data[data.count - 2], data[data.count - 1])
    }
    
    public var data: Data {
        
        let type = ATTSignedWriteCommand.self
        
        let handleBytes = handle.littleEndian.bytes
        
        return Data([type.attributeOpcode.rawValue, handleBytes.0, handleBytes.1])
            + value
            + Data([signature.0, signature.1, signature.2, signature.3, signature.4, signature.5, signature.6, signature.7, signature.8, signature.9, signature.10, signature.11])
    }
}
