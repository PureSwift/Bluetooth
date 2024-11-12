//
//  ATTExecuteWriteResponse.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Bluetooth

/// The *Execute Write Response* is sent in response to a received *Execute Write Request*.
@frozen
public struct ATTExecuteWriteResponse: ATTProtocolDataUnit, Sendable {
    
    public static var attributeOpcode: ATTOpcode { .executeWriteResponse }
    
    public init() { }
}

extension ATTExecuteWriteResponse: DataConvertible {
    
    public init?<Data: DataContainer>(data: Data) {
        
        guard data.count == 1,
            Self.validateOpcode(data)
            else { return nil }
    }
    
    public func append<Data>(to data: inout Data) where Data : DataContainer {
        data += Self.attributeOpcode.rawValue
    }
    
    public var dataLength: Int {
        1
    }
}
