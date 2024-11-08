//
//  ATTPrepareWriteResponse.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Bluetooth

/// Prepare Write Response
/// The *Prepare Write Response* is sent in response to a received *Prepare Write Request*
/// and acknowledges that the value has been successfully received and placed in the prepare write queue.
@frozen
public struct ATTPrepareWriteResponse <Value: DataContainer> : ATTProtocolDataUnit, Equatable, Hashable, Sendable {
    
    public static var attributeOpcode: ATTOpcode { .preparedWriteResponse }
    
    /// The handle of the attribute to be written.
    public var handle: UInt16
    
    /// The offset of the first octet to be written.
    public var offset: UInt16
    
    /// The value of the attribute to be written.
    public var partValue: Value
    
    public init(
        handle: UInt16,
        offset: UInt16,
        partValue: Value
    ) {
        self.handle = handle
        self.offset = offset
        self.partValue = partValue
    }
}

// MARK: - DataConvertible

extension ATTPrepareWriteResponse: DataConvertible {
    
    public init?<Data: DataContainer>(data: Data) {
        
        guard data.count >= 5,
            Self.validateOpcode(data)
            else { return nil }
        
        self.handle = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))
        self.offset = UInt16(littleEndian: UInt16(bytes: (data[3], data[4])))
        self.partValue = Value(data.suffixCheckingBounds(from: 5))
    }
    
    public func append<Data>(to data: inout Data) where Data : DataContainer {
        data += Self.attributeOpcode.rawValue
        data += self.handle.littleEndian
        data += self.offset.littleEndian
        data += self.partValue
    }
    
    public var dataLength: Int {
        5 + partValue.count
    }
}
