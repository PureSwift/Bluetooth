//
//  ATTReadResponse.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Bluetooth

/// Read Response
///
/// The *Read Response* is sent in reply to a received *Read Request* and contains
/// the value of the attribute that has been read.
///
/// - Note: The *Read Blob Request* would be used to read the remaining octets of a long attribute value.
@frozen
public struct ATTReadResponse<Value: DataContainer>: ATTProtocolDataUnit, Equatable {
    
    public static var attributeOpcode: ATTOpcode { return .readResponse }
    
    /// The value of the attribute with the handle given.
    public var attributeValue: Value
    
    public init(attributeValue: Value) {
        self.attributeValue = attributeValue
    }
}

// MARK: - DataConvertible

extension ATTReadResponse: DataConvertible {
    
    public init?<Data: DataContainer>(data: Data) {
        guard data.count >= 1,
            Self.validateOpcode(data)
            else { return nil }
        self.attributeValue = data.suffixCheckingBounds(from: 1)
    }
    
    public func append<Data>(to data: inout Data) where Data : DataContainer {
        data += Self.attributeOpcode.rawValue
        data += self.attributeValue
    }
    
    public var dataLength: Int {
        return 1 + attributeValue.count
    }
}
