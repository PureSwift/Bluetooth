//
//  ATTPrepareWriteRequest.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// Prepare Write Request
///
/// The *Prepare Write Request* is used to request the server to prepare to write the value of an attribute.
/// The server will respond to this request with a *Prepare Write Response*,
/// so that the client can verify that the value was received correctly.
@frozen
public struct ATTPrepareWriteRequest: ATTProtocolDataUnit, Equatable {
    
    public static var attributeOpcode: ATTOpcode { return .preparedWriteRequest }
    
    /// The handle of the attribute to be written.
    public var handle: UInt16
    
    /// The offset of the first octet to be written.
    public var offset: UInt16
    
    /// The value of the attribute to be written.
    public var partValue: Data
    
    public init(handle: UInt16,
                offset: UInt16,
                partValue: Data) {
        
        self.handle = handle
        self.offset = offset
        self.partValue = partValue
    }
}

public extension ATTPrepareWriteRequest {
    
    init?(data: Data) {
        
        guard data.count >= 5,
            type(of: self).validateOpcode(data)
            else { return nil }
        
        self.handle = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))
        self.offset = UInt16(littleEndian: UInt16(bytes: (data[3], data[4])))
        self.partValue = data.suffixCheckingBounds(from: 5)
    }
    
    var data: Data {
        
        return Data(self)
    }
}

// MARK: - DataConvertible

extension ATTPrepareWriteRequest: DataConvertible {
    
    var dataLength: Int {
        
        return 5 + partValue.count
    }
    
    static func += <T: DataContainer> (data: inout T, value: ATTPrepareWriteRequest) {
        
        data += attributeOpcode.rawValue
        data += value.handle.littleEndian
        data += value.offset.littleEndian
        data += value.partValue
    }
}
