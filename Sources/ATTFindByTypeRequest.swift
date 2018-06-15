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
    internal static let length = 1 + 2 + 2 + 2 + 0
    
    /// First requested handle number
    public var startHandle: UInt16
    
    /// Last requested handle number
    public var endHandle: UInt16
    
    /// 2 octet UUID to find.
    public var attributeType: UInt16
    
    /// Attribute value to find.
    public var attributeValue: Data
    
    public init(startHandle: UInt16,
                endHandle: UInt16,
                attributeType: UInt16,
                attributeValue: Data) {
        
        self.startHandle = startHandle
        self.endHandle = endHandle
        self.attributeType = attributeType
        self.attributeValue = attributeValue
    }
    
    public init?(data: Data) {
        
        guard data.count >= type(of: self).length else { return nil }
        
        let attributeOpcodeByte = data[0]
        
        guard attributeOpcodeByte == type(of: self).attributeOpcode.rawValue
            else { return nil }
        
        let startHandle = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))
        let endHandle = UInt16(littleEndian: UInt16(bytes: (data[3], data[4])))
        let attributeType = UInt16(littleEndian: UInt16(bytes: (data[5], data[6])))
        
        let attributeValue: Data
        
        /// if attributeValue is included
        if data.count >= 7 {
            
            // rest of data is attribute
            attributeValue = Data(data.suffix(from: 7))
            
        } else {
            
            attributeValue = Data()
        }
        
        self.init(startHandle: startHandle,
                  endHandle: endHandle,
                  attributeType: attributeType,
                  attributeValue: attributeValue)
    }
    
    public var data: Data {
        
        let startHandleBytes = self.startHandle.littleEndian.bytes
        
        let endHandleBytes = self.endHandle.littleEndian.bytes
        
        let attributeTypeBytes = self.attributeType.littleEndian.bytes
        
        return Data([type(of: self).attributeOpcode.rawValue,
                     startHandleBytes.0,
                     startHandleBytes.1,
                     endHandleBytes.0,
                     endHandleBytes.1,
                     attributeTypeBytes.0,
                     attributeTypeBytes.1]) + attributeValue
    }
}
