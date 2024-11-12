//
//  ATTErrorResponse.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Bluetooth

/// The Error Response is used to state that a given request cannot be performed,
/// and to provide the reason.
///
/// - Note: The Write Command does not generate an Error Response.
@frozen
public struct ATTErrorResponse: ATTProtocolDataUnit, Error, Equatable, Hashable, Sendable {
    
    public static var attributeOpcode: ATTOpcode { .errorResponse }
    
    /// The request that generated this error response
    public var request: ATTOpcode
    
    /// The attribute handle that generated this error response.
    public var attributeHandle: UInt16
    
    /// The reason why the request has generated an error response.
    public var error: ATTError
    
    public init(
        request: ATTOpcode,
        attributeHandle: UInt16,
        error: ATTError
    ) {
        self.request = request
        self.attributeHandle = attributeHandle
        self.error = error
    }
}

// MARK: - DataConvertible

extension ATTErrorResponse: DataConvertible {
    
    public static var length: Int { 5 }
    
    public init?<Data: DataContainer>(data: Data) {
        
        guard data.count == Self.length,
            Self.validateOpcode(data),
            let request = ATTOpcode(rawValue: data[1]),
            let error = ATTError(rawValue: data[4])
            else { return nil }
        
        let attributeHandle = UInt16(littleEndian: UInt16(bytes: (data[2], data[3])))
        
        self.init(request: request, attributeHandle: attributeHandle, error: error)
    }
    
    public func append<Data>(to data: inout Data) where Data : DataContainer {
        data += Self.attributeOpcode.rawValue
        data += self.request.rawValue
        data += self.attributeHandle.littleEndian
        data += self.error.rawValue
    }
    
    public var dataLength: Int {
        return Self.length
    }
}
