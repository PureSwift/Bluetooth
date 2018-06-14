//
//  ATTReadByGroupTypeRequest.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// Read by Group Type Request
///
/// The *Read By Group Type Request* is used to obtain the values of attributes where the attribute type is known,
/// the type of a grouping attribute as defined by a higher layer specification, but the handle is not known.
public struct ATTReadByGroupTypeRequest: ATTProtocolDataUnit {
    
    public static let attributeOpcode = ATT.Opcode.readByGroupTypeRequest
    
    /// First requested handle number.
    public var startHandle: UInt16
    
    /// Last requested handle number.
    public var endHandle: UInt16
    
    /// Attribute Group Type
    ///
    /// 2 or 16 octet UUID
    public var type: BluetoothUUID
    
    public init(startHandle: UInt16, endHandle: UInt16, type: BluetoothUUID) {
        
        self.startHandle = startHandle
        self.endHandle = endHandle
        self.type = type
    }
    
    public init?(data: Data) {
        
        guard let length = Length(rawValue: data.count)
            else { return nil }
        
        let attributeOpcodeByte = data[0]
        
        guard attributeOpcodeByte == type(of: self).attributeOpcode.rawValue
            else { return nil }
        
        self.startHandle = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))
        
        self.endHandle = UInt16(littleEndian: UInt16(bytes: (data[3], data[4])))
        
        switch length {
            
        case .uuid16:
            
            let value = UInt16(littleEndian: UInt16(bytes: (data[5], data[6])))
            
            self.type = .bit16(value)
            
        case .uuid128:
            
            self.type = BluetoothUUID(littleEndian:
                BluetoothUUID(data: Data(data[5 ... 20]))!)
        }
    }
    
    public var data: Data {
        
        let startHandleBytes = startHandle.littleEndian.bytes
        let endHandleBytes = endHandle.littleEndian.bytes
        
        return Data([type(of: self).attributeOpcode.rawValue, startHandleBytes.0, startHandleBytes.1, endHandleBytes.0, endHandleBytes.1]) + type.littleEndian.data
    }
    
    private enum Length: Int {
        
        case uuid16     = 7
        case uuid128    = 21
        
        init?(uuid: BluetoothUUID) {
            
            switch uuid {
                
            case .bit16: self = .uuid16
            case .bit32: return nil
            case .bit128: self = .uuid128
            }
        }
    }
}
