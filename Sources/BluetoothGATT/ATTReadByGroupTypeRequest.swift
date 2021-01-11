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
@frozen
public struct ATTReadByGroupTypeRequest: ATTProtocolDataUnit, Equatable {
    
    public static var attributeOpcode: ATTOpcode { return .readByGroupTypeRequest }
    
    /// First requested handle number.
    public var startHandle: UInt16
    
    /// Last requested handle number.
    public var endHandle: UInt16
    
    /// Attribute Group Type
    ///
    /// 2 or 16 octet UUID
    public var type: BluetoothUUID
    
    public init(startHandle: UInt16,
                endHandle: UInt16,
                type: BluetoothUUID) {
        
        assert(type.length != .bit32)
        
        self.startHandle = startHandle
        self.endHandle = endHandle
        self.type = type
    }
}

public extension ATTReadByGroupTypeRequest {
    
    init?(data: Data) {
        
        guard let length = Length(rawValue: data.count),
            Swift.type(of: self).validateOpcode(data)
            else { return nil }
        
        self.startHandle = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))
        self.endHandle = UInt16(littleEndian: UInt16(bytes: (data[3], data[4])))
        
        switch length {
        case .uuid16:
            let value = UInt16(littleEndian: UInt16(bytes: (data[5], data[6])))
            self.type = .bit16(value)
        case .uuid128:
            self.type = BluetoothUUID(littleEndian: BluetoothUUID(data: data.subdataNoCopy(in: 5 ..< 21))!)
        }
    }
    
    var data: Data {
        
        return Data(self)
    }
}

// MARK: - DataConvertible

extension ATTReadByGroupTypeRequest: DataConvertible {
    
    var dataLength: Int {
        
        return length.rawValue
    }
    
    static func += <T: DataContainer> (data: inout T, value: ATTReadByGroupTypeRequest) {
        
        data += attributeOpcode.rawValue
        data += value.startHandle.littleEndian
        data += value.endHandle.littleEndian
        data += value.type.littleEndian
    }
}

// MARK: - Supporting Types

private extension ATTReadByGroupTypeRequest {
    
    enum Length: Int {
        
        case uuid16     = 7
        case uuid128    = 21
    }
    
    var length: Length {
        
        switch type {
        case .bit16: return .uuid16
        case .bit128: return .uuid128
        case .bit32: fatalError()
        }
    }
}
