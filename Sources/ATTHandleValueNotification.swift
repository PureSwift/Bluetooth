//
//  ATTHandleValueNotification.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// Handle Value Notification
///
/// A server can send a notification of an attribute’s value at any time.
public struct ATTHandleValueNotification: ATTProtocolDataUnit {
    
    public static let attributeOpcode = ATT.Opcode.handleValueNotification
    
    /// minimum length
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
        
        let minimumLength = type(of: self).length
        
        guard data.count >= minimumLength
            else { return nil }
        
        let attributeOpcodeByte = data[0]
        
        guard attributeOpcodeByte == type(of: self).attributeOpcode.rawValue
            else { return nil }
        
        self.handle = UInt16(bytes: (data[1], data[2])).littleEndian
        
        if data.count > minimumLength {
            
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
