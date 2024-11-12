//
//  ATTWriteResponse.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Bluetooth

/// Write Response
///
/// The *Write Response* is sent in reply to a valid *Write Request*
/// and acknowledges that the attribute has been successfully written.
@frozen
public struct ATTWriteResponse: ATTProtocolDataUnit, Sendable {
    
    public static var attributeOpcode: ATTOpcode { .writeResponse }
    
    public init() { }
}

extension ATTWriteResponse: DataConvertible {
    
    public init?<Data: DataContainer>(data: Data) {
        
        guard data.count == 1,
            Self.validateOpcode(data)
            else { return nil }
    }
    
    public func append<Data>(to data: inout Data) where Data : DataContainer {
        data += Self.attributeOpcode.rawValue
    }
    
    public var dataLength: Int { 1 }
}
