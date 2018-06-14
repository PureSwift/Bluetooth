//
//  ATTReadMultipleRequest.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// Read Multiple Request
///
/// The *Read Multiple Request* is used to request the server to read two or more values
/// of a set of attributes and return their values in a *Read Multiple Response*.
///
/// Only values that have a known fixed size can be read, with the exception of the last value that can have a variable length.
/// The knowledge of whether attributes have a known fixed size is defined in a higher layer specification.
public struct ATTReadMultipleRequest: ATTProtocolDataUnit {
    
    public static let attributeOpcode = ATT.Opcode.readMultipleRequest
    
    /// Minimum length
    internal static let length = 1 + 4
    
    /// The handles of the attributes to read.
    public var handles: [UInt16]
    
    public init?(handles: [UInt16]) {
        
        guard handles.count >= 2
            else { return nil }
        
        self.handles = handles
    }
    
    public init?(data: Data) {
        
        guard data.count >= type(of: self).length
            else { return nil }
        
        let attributeOpcodeByte = data[0]
        
        guard attributeOpcodeByte == type(of: self).attributeOpcode.rawValue
            else { return nil }
        
        let handleCount = (data.count - 1) / 2
        
        guard (data.count - 1) % 2 == 0
            else { return nil }
        
        // preallocate handle buffer
        var handles = [UInt16]()
        handles.reserveCapacity(handleCount)
        
        for index in 0 ..< handleCount {
            
            let handleIndex = 1 + (index * 2)
            
            let handle = UInt16(littleEndian: UInt16(bytes: (data[handleIndex], data[handleIndex + 1])))
            
            handles.append(handle)
        }
        
        self.handles = handles
    }
    
    public var data: Data {
        
        var handlesBytes = Data(repeating: 0, count: handles.count * 2)
        
        for handle in handles {
            
            let handleBytes = handle.littleEndian.bytes
            
            let handleByteIndex = handles.count * 2
            
            handlesBytes[handleByteIndex] = handleBytes.0
            
            handlesBytes[handleByteIndex + 1] = handleBytes.1
        }
        
        return Data([type(of: self).attributeOpcode.rawValue]) + handlesBytes
    }
}
