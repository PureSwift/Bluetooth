//
//  ATTReadByTypeRequest.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// Read By Type Request
///
/// The *Read By Type Request* is used to obtain the values of attributes where the
/// attribute type is known but the handle is not known.
public struct ATTReadByTypeRequest: ATTProtocolDataUnit {
    
    public static let attributeOpcode = ATT.Opcode.readByTypeRequest
    
    /// First requested handle number
    public var startHandle: UInt16
    
    /// Last requested handle number
    public var endHandle: UInt16
    
    /// 2 or 16 octet UUID
    public var attributeType: BluetoothUUID
    
    public init(startHandle: UInt16, endHandle: UInt16, attributeType: BluetoothUUID) {
        
        self.startHandle = startHandle
        self.endHandle = endHandle
        self.attributeType = attributeType
    }
    
    public init?(data: Data) {
        
        guard let length = Length(rawValue: data.count)
            else { return nil }
        
        let attributeOpcodeByte = data[0]
        
        guard attributeOpcodeByte == type(of: self).attributeOpcode.rawValue
            else { return nil }
        
        self.startHandle = UInt16(bytes: (data[1], data[2])).littleEndian
        
        self.endHandle = UInt16(bytes: (data[3], data[4])).littleEndian
        
        switch length {
            
        case .uuid16:
            
            let value = UInt16(littleEndian: UInt16(bytes: (data[5], data[6])))
            
            self.attributeType = .bit16(value)
            
        case .uuid128:
            
            self.attributeType = BluetoothUUID(littleEndian: BluetoothUUID(data: data.subdata(in: 5 ..< 21))!)
        }
    }
    
    public var data: Data {
        
        let startHandleBytes = startHandle.littleEndian.bytes
        let endHandleBytes = endHandle.littleEndian.bytes
        
        return Data([type(of: self).attributeOpcode.rawValue, startHandleBytes.0, startHandleBytes.1, endHandleBytes.0, endHandleBytes.1]) + attributeType.littleEndian.data
    }
}

// MARK: - Supporting Types

internal extension ATTReadByTypeRequest {
    
    enum Length: Int {
        
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
