//
//  ATTHandleValueConfirmation.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Bluetooth

/// Handle Value Confirmation
///
/// The *Handle Value Confirmation* is sent in response to a received *Handle Value Indication*
/// and confirms that the client has received an indication of the given attribute.
@frozen
public struct ATTHandleValueConfirmation: ATTProtocolDataUnit, Sendable {
    
    public static var attributeOpcode: ATTOpcode { .handleValueConfirmation }
    
    public init() { }
}

extension ATTHandleValueConfirmation: DataConvertible {
    
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
