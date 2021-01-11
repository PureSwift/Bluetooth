//
//  ATTErrorResponse.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// The Error Response is used to state that a given request cannot be performed,
/// and to provide the reason.
///
/// - Note: The Write Command does not generate an Error Response.
@frozen
public struct ATTErrorResponse: ATTProtocolDataUnit, Error, Equatable {
    
    public static var attributeOpcode: ATTOpcode { return .errorResponse }
    
    /// The request that generated this error response
    public var request: ATTOpcode
    
    /// The attribute handle that generated this error response.
    public var attributeHandle: UInt16
    
    /// The reason why the request has generated an error response.
    public var error: ATTError
    
    public init(request: ATTOpcode,
                attributeHandle: UInt16,
                error: ATTError) {
        
        self.request = request
        self.attributeHandle = attributeHandle
        self.error = error
    }
}

public extension ATTErrorResponse {
    
    internal static var length: Int { return 5 }
    
    init?(data: Data) {
        
        guard data.count == type(of: self).length,
            type(of: self).validateOpcode(data),
            let request = ATTOpcode(rawValue: data[1]),
            let error = ATTError(rawValue: data[4])
            else { return nil }
        
        let attributeHandle = UInt16(littleEndian: UInt16(bytes: (data[2], data[3])))
        
        self.init(request: request, attributeHandle: attributeHandle, error: error)
    }
    
    var data: Data {
        
        return Data(self)
    }
}

// MARK: - DataConvertible

extension ATTErrorResponse: DataConvertible {
    
    var dataLength: Int {
        
        return type(of: self).length
    }
    
    static func += <T: DataContainer> (data: inout T, value: ATTErrorResponse) {
        
        data += attributeOpcode.rawValue
        data += value.request.rawValue
        data += value.attributeHandle.littleEndian
        data += value.error.rawValue
    }
}
