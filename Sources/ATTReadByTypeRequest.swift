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
    
    public init?(byteValue: [UInt8]) {
        
        guard let length = Length(rawValue: byteValue.count)
            else { return nil }
        
        let attributeOpcodeByte = byteValue[0]
        
        guard attributeOpcodeByte == type(of: self).attributeOpcode.rawValue
            else { return nil }
        
        self.startHandle = UInt16(bytes: (byteValue[1], byteValue[2])).littleEndian
        
        self.endHandle = UInt16(bytes: (byteValue[3], byteValue[4])).littleEndian
        
        switch length {
            
        case .uuid16:
            
            let value = UInt16(bytes: (byteValue[5], byteValue[6])).littleEndian
            
            self.attributeType = .bit16(value)
            
        case .uuid128:
            
            self.attributeType = BluetoothUUID(littleEndian:
                BluetoothUUID(data: Data([byteValue[5], byteValue[6], byteValue[7], byteValue[8], byteValue[9], byteValue[10], byteValue[11], byteValue[12], byteValue[13], byteValue[14], byteValue[15], byteValue[16], byteValue[17], byteValue[18], byteValue[19], byteValue[20]]))!)
        }
    }
    
    public var byteValue: [UInt8] {
        
        let startHandleBytes = startHandle.littleEndian.bytes
        
        let endHandleBytes = endHandle.littleEndian.bytes
        
        return [type(of: self).attributeOpcode.rawValue, startHandleBytes.0, startHandleBytes.1, endHandleBytes.0, endHandleBytes.1] + [UInt8](attributeType.littleEndian.data)
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
