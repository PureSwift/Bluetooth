//
//  ATTReadRequest.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Bluetooth

/// Read Request
///
/// The *Read Request* is used to request the server to read the value of an attribute
/// and return its value in a *Read Response*.
@frozen
public struct ATTReadRequest: ATTProtocolDataUnit, Equatable, Hashable, Sendable {
    
    public static var attributeOpcode: ATTOpcode { .readRequest }
    
    /// The handle of the attribute to read.
    public var handle: UInt16
    
    public init(handle: UInt16) {
        self.handle = handle
    }
}

// MARK: - DataConvertible

extension ATTReadRequest: DataConvertible {
    
    public static var length: Int { 3 }
    
    public init?<Data: DataContainer>(data: Data) {
        
        guard data.count == Self.length,
            Self.validateOpcode(data)
            else { return nil }
        
        self.handle = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))
    }
    
    public func append<Data>(to data: inout Data) where Data : DataContainer {
        data += Self.attributeOpcode.rawValue
        data += self.handle.littleEndian
    }
    
    public var dataLength: Int {
        Self.length
    }
}
