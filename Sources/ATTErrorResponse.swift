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
public struct ATTErrorResponse: ATTProtocolDataUnit, Error {
    
    public static let attributeOpcode = ATT.Opcode.errorResponse
    
    internal static let length = 5
    
    /// The request that generated this error response
    public var request: ATT.Opcode
    
    /// The attribute handle that generated this error response.
    public var attributeHandle: UInt16
    
    /// The reason why the request has generated an error response.
    public var error: ATT.Error
    
    public init(request: ATT.Opcode,
                attributeHandle: UInt16,
                error: ATT.Error) {
        
        self.request = request
        self.attributeHandle = attributeHandle
        self.error = error
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length,
            data[0] == type(of: self).attributeOpcode.rawValue,
            let request = ATTOpcode(rawValue: data[1]),
            let error = ATTError(rawValue: data[4])
            else { return nil }
        
        let attributeHandle = UInt16(littleEndian: UInt16(bytes: (data[2], data[3])))
        
        self.init(request: request, attributeHandle: attributeHandle, error: error)
    }
    
    public var data: Data {
        
        var bytes = Data(repeating: 0, count: type(of: self).length)
        
        let attributeHandleBytes = attributeHandle.littleEndian.bytes
        
        bytes[0] = type(of: self).attributeOpcode.rawValue
        bytes[1] = request.rawValue
        bytes[2] = attributeHandleBytes.0
        bytes[3] = attributeHandleBytes.1
        bytes[4] = error.rawValue
        
        return bytes
    }
}
