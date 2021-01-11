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
@frozen
public struct ATTFindByTypeRequest: ATTProtocolDataUnit, Equatable {
    
    public static var attributeOpcode: ATTOpcode { return .findByTypeRequest }
    
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
}

public extension ATTFindByTypeRequest {
    
    init?(data: Data) {
        
        guard data.count >= 7,
            type(of: self).validateOpcode(data)
            else { return nil }
        
        let startHandle = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))
        let endHandle = UInt16(littleEndian: UInt16(bytes: (data[3], data[4])))
        let attributeType = UInt16(littleEndian: UInt16(bytes: (data[5], data[6])))
        let attributeValue = data.suffixCheckingBounds(from: 7)
        
        self.init(startHandle: startHandle,
                  endHandle: endHandle,
                  attributeType: attributeType,
                  attributeValue: attributeValue)
    }
    
    var data: Data {
        
        return Data(self)
    }
}

// MARK: - DataConvertible

extension ATTFindByTypeRequest: DataConvertible {
    
    var dataLength: Int {
        
        return 7 + attributeValue.count
    }
    
    static func += <T: DataContainer> (data: inout T, value: ATTFindByTypeRequest) {
        
        data += attributeOpcode.rawValue
        data += value.startHandle.littleEndian
        data += value.endHandle.littleEndian
        data += value.attributeType.littleEndian
        data += value.attributeValue
    }
}
