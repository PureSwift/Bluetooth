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
@frozen
public struct ATTReadByTypeRequest: ATTProtocolDataUnit, Equatable {
    
    public static var attributeOpcode: ATTOpcode { return .readByTypeRequest }
    
    /// First requested handle number
    public var startHandle: UInt16
    
    /// Last requested handle number
    public var endHandle: UInt16
    
    /// 2 or 16 octet UUID
    public var attributeType: BluetoothUUID
    
    public init(startHandle: UInt16,
                endHandle: UInt16,
                attributeType: BluetoothUUID) {
        
        assert(attributeType.length != .bit32, "32-bit UUID not supported")
        
        self.startHandle = startHandle
        self.endHandle = endHandle
        self.attributeType = attributeType
    }
}

public extension ATTReadByTypeRequest {
    
    init?(data: Data) {
        
        guard let length = Length(rawValue: data.count),
            type(of: self).validateOpcode(data)
            else { return nil }
        
        self.startHandle = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))
        self.endHandle = UInt16(littleEndian: UInt16(bytes: (data[3], data[4])))
        
        switch length {
        case .uuid16:
            let value = UInt16(littleEndian: UInt16(bytes: (data[5], data[6])))
            self.attributeType = .bit16(value)
        case .uuid128:
            self.attributeType = BluetoothUUID(littleEndian: BluetoothUUID(data: data.suffixNoCopy(from: 5))!)
        }
    }
    
    var data: Data {
        
        return Data(self)
    }
}

// MARK: - DataConvertible

extension ATTReadByTypeRequest: DataConvertible {
    
    var dataLength: Int {
        
        return length.rawValue
    }
    
    static func += <T: DataContainer> (data: inout T, value: ATTReadByTypeRequest) {
        
        data += attributeOpcode.rawValue
        data += value.startHandle.littleEndian
        data += value.endHandle.littleEndian
        data += value.attributeType.littleEndian
    }
}

// MARK: - Supporting Types

internal extension ATTReadByTypeRequest {
    
    enum Length: Int {
        
        case uuid16     = 7
        case uuid128    = 21
    }
    
    private var length: Length {
        
        switch attributeType {
        case .bit16: return .uuid16
        case .bit128: return .uuid128
        case .bit32: fatalError() // FIXME: Do not allow 32-bit UUID for Blueooth LE
        }
    }
}
