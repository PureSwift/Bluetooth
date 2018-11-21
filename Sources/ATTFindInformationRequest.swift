//
//  ATTFindInformationRequest.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// Find Information Request
///
/// The *Find Information Request* is used to obtain the mapping of attribute handles with their associated types.
/// This allows a client to discover the list of attributes and their types on a server.
public struct ATTFindInformationRequest: ATTProtocolDataUnit, Equatable {
    
    public static var attributeOpcode: ATT.Opcode { return .findInformationRequest }
    
    public var startHandle: UInt16
    
    public var endHandle: UInt16
    
    public init(startHandle: UInt16 = 0, endHandle: UInt16 = 0) {
        
        self.startHandle = startHandle
        self.endHandle = endHandle
    }
}

public extension ATTFindInformationRequest {
    
    internal static var length: Int { return 5 }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let attributeOpcodeByte = data[0]
        
        guard attributeOpcodeByte == type(of: self).attributeOpcode.rawValue
            else { return nil }
        
        self.startHandle = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))
        self.endHandle = UInt16(littleEndian: UInt16(bytes: (data[3], data[4])))
    }
    
    public var data: Data {
        
        return Data(self)
    }
}

// MARK: - DataConvertible

extension ATTFindInformationRequest: DataConvertible {
    
    var dataLength: Int {
        
        return type(of: self).length
    }
    
    static func += (data: inout Data, value: ATTFindInformationRequest) {
        
        data += attributeOpcode.rawValue
        data += value.startHandle.littleEndian
        data += value.endHandle.littleEndian
    }
}
