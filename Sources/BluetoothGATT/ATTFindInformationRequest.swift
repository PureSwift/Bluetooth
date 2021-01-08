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
@frozen
public struct ATTFindInformationRequest: ATTProtocolDataUnit, Equatable {
    
    public static var attributeOpcode: ATTOpcode { return .findInformationRequest }
    
    public var startHandle: UInt16
    
    public var endHandle: UInt16
    
    public init(startHandle: UInt16,
                endHandle: UInt16) {
        
        self.startHandle = startHandle
        self.endHandle = endHandle
    }
}

public extension ATTFindInformationRequest {
    
    internal static var length: Int { return 5 }
    
    init?(data: Data) {
        
        guard data.count == type(of: self).length,
            type(of: self).validateOpcode(data)
            else { return nil }
        
        self.startHandle = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))
        self.endHandle = UInt16(littleEndian: UInt16(bytes: (data[3], data[4])))
    }
    
    var data: Data {
        
        return Data(self)
    }
}

// MARK: - DataConvertible

extension ATTFindInformationRequest: DataConvertible {
    
    var dataLength: Int {
        
        return type(of: self).length
    }
    
    static func += <T: DataContainer> (data: inout T, value: ATTFindInformationRequest) {
        
        data += attributeOpcode.rawValue
        data += value.startHandle.littleEndian
        data += value.endHandle.littleEndian
    }
}
