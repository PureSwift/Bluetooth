//
//  ATTReadBlobRequest.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// Read Blob Request
///
/// The *Read Blob Request* is used to request the server to read part of the value of an attribute
/// at a given offset and return a specific part of the value in a *Read Blob Response*.
@frozen
public struct ATTReadBlobRequest: ATTProtocolDataUnit, Equatable {
    
    public static var attributeOpcode: ATTOpcode { return .readBlobRequest }
    
    /// The handle of the attribute to be read.
    public var handle: UInt16
    
    /// The offset of the first octet to be read.
    public var offset: UInt16
    
    public init(handle: UInt16,
                offset: UInt16) {
        
        self.handle = handle
        self.offset = offset
    }
}

public extension ATTReadBlobRequest {
    
    internal static var length: Int { return 1 + 2 + 2 }
    
    init?(data: Data) {
        
        guard data.count == type(of: self).length,
            type(of: self).validateOpcode(data)
            else { return nil }
        
        self.handle = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))
        self.offset = UInt16(littleEndian: UInt16(bytes: (data[3], data[4])))
    }
    
    var data: Data {
        
        return Data(self)
    }
}

// MARK: - DataConvertible

extension ATTReadBlobRequest: DataConvertible {
    
    var dataLength: Int {
        
        return type(of: self).length
    }
    
    static func += <T: DataContainer> (data: inout T, value: ATTReadBlobRequest) {
        
        data += attributeOpcode.rawValue
        data += value.handle.littleEndian
        data += value.offset.littleEndian
    }
}
