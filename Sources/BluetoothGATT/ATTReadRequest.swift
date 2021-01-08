//
//  ATTReadRequest.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// Read Request
///
/// The *Read Request* is used to request the server to read the value of an attribute
/// and return its value in a *Read Response*.
@frozen
public struct ATTReadRequest: ATTProtocolDataUnit, Equatable {
    
    public static var attributeOpcode: ATTOpcode { return .readRequest }
    
    /// The handle of the attribute to read.
    public var handle: UInt16
    
    public init(handle: UInt16) {
        
        self.handle = handle
    }
}

public extension ATTReadRequest {
    
    internal static var length: Int { return 1 + 2 }
    
    init?(data: Data) {
        
        guard data.count == type(of: self).length,
            type(of: self).validateOpcode(data)
            else { return nil }
        
        self.handle = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))
    }
    
    var data: Data {
        
        return Data(self)
    }
}

// MARK: - DataConvertible

extension ATTReadRequest: DataConvertible {
    
    var dataLength: Int {
        
        return type(of: self).length
    }
    
    static func += <T: DataContainer> (data: inout T, value: ATTReadRequest) {
        
        data += attributeOpcode.rawValue
        data += value.handle
    }
}
