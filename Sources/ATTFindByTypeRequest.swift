//
//  ATTFindByTypeRequest.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// Find By Type Value Request
///
/// The *Find By Type Value Request* is used to obtain the handles of attributes that
/// have a 16-bit UUID attribute type and attribute value.
/// This allows the range of handles associated with a given attribute to be discovered when
/// the attribute type determines the grouping of a set of attributes.
///
/// - Note: Generic Attribute Profile defines grouping of attributes by attribute type.
public struct ATTFindByTypeRequest: ATTProtocolDataUnit {
    
    public static let attributeOpcode = ATT.Opcode.findByTypeRequest
    
    /// Minimum length.
    public static let length = 1 + 2 + 2 + 2 + 0
    
    /// First requested handle number
    public var startHandle: UInt16
    
    /// Last requested handle number
    public var endHandle: UInt16
    
    /// 2 octet UUID to find.
    public var attributeType: UInt16
    
    /// Attribute value to find.
    public var attributeValue: [UInt8]
    
    public init(startHandle: UInt16 = 0, endHandle: UInt16 = 0, attributeType: UInt16 = 0, attributeValue: [UInt8] = []) {
        
        self.startHandle = startHandle
        self.endHandle = endHandle
        self.attributeType = attributeType
        self.attributeValue = attributeValue
    }
    
    public init?(byteValue: [UInt8]) {
        
        guard byteValue.count >= ATTFindByTypeRequest.length else { return nil }
        
        let attributeOpcodeByte = byteValue[0]
        
        guard attributeOpcodeByte == type(of: self).attributeOpcode.rawValue
            else { return nil }
        
        self.startHandle = UInt16(bytes: (byteValue[1], byteValue[2])).littleEndian
        
        self.endHandle = UInt16(bytes: (byteValue[3], byteValue[4])).littleEndian
        
        self.attributeType = UInt16(bytes: (byteValue[5], byteValue[6])).littleEndian
        
        /// if attributeValue is included
        if byteValue.count >= 7 {
            
            // rest of data is attribute
            self.attributeValue = Array(byteValue.suffix(from: 7))
            
        } else {
            
            self.attributeValue = []
        }
    }
    
    public var byteValue: [UInt8] {
        
        let startHandleBytes = self.startHandle.littleEndian.bytes
        
        let endHandleBytes = self.endHandle.littleEndian.bytes
        
        let attributeTypeBytes = self.attributeType.littleEndian.bytes
        
        return [type(of: self).attributeOpcode.rawValue, startHandleBytes.0, startHandleBytes.1, endHandleBytes.0, endHandleBytes.1, attributeTypeBytes.0, attributeTypeBytes.1] + attributeValue
    }
}
