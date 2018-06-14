//
//  ATTHandleValueIndication.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// Handle Value Indication
///
/// A server can send an indication of an attribute’s value.
public struct ATTHandleValueIndication: ATTProtocolDataUnit {
    
    public static let attributeOpcode = ATT.Opcode.handleValueIndication
    
    /// Minimum length
    internal static let length = 1 + 2 + 0
    
    /// The handle of the attribute.
    public var handle: UInt16
    
    /// The handle of the attribute.
    public var value: Data
    
    public init(handle: UInt16, value: Data) {
        
        self.handle = handle
        self.value = value
    }
    
    public init?(data: Data) {
        
        let type = ATTHandleValueIndication.self
        
        guard data.count >= type.length
            else { return nil }
        
        let attributeOpcodeByte = data[0]
        
        guard attributeOpcodeByte == type.attributeOpcode.rawValue
            else { return nil }
        
        self.handle = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))
        
        if data.count > type.length {
            
            self.value = Data(data.suffix(from: 3))
            
        } else {
            
            self.value = Data()
        }
    }
    
    public var data: Data {
        
        let type = ATTHandleValueIndication.self
        
        let handleBytes = handle.littleEndian.bytes
        
        return Data([type.attributeOpcode.rawValue, handleBytes.0, handleBytes.1]) + value
    }
}
