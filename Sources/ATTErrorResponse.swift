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
    public var requestOpcode: ATT.Opcode
    
    /// The attribute handle that generated this error response.
    public var attributeHandle: UInt16
    
    /// The reason why the request has generated an error response.
    public var errorCode: ATT.Error
    
    public init(requestOpcode: ATT.Opcode,
                attributeHandle: UInt16,
                error: ATT.Error) {
        
        self.requestOpcode = requestOpcode
        self.attributeHandle = attributeHandle
        self.errorCode = error
    }
    
    public init?(data: Data) {
        
        guard data.count == ATTErrorResponse.length else { return nil }
        
        let attributeOpcodeByte     = data[0]
        let requestOpcodeByte       = data[1]
        let attributeHandleByte1    = data[2]
        let attributeHandleByte2    = data[3]
        let errorByte               = data[4]
        
        guard attributeOpcodeByte == ATTErrorResponse.attributeOpcode.rawValue,
            let requestOpcode = ATTOpcode(rawValue: requestOpcodeByte),
            let errorCode = ATTError(rawValue: errorByte)
            else { return nil }
        
        self.requestOpcode = requestOpcode
        self.errorCode = errorCode
        self.attributeHandle = UInt16(littleEndian: UInt16(bytes: (attributeHandleByte1, attributeHandleByte2)))
    }
    
    public var data: Data {
        
        var bytes = [UInt8](repeating: 0, count: ATTErrorResponse.length)
        
        bytes[0] = ATTErrorResponse.attributeOpcode.rawValue
        bytes[1] = requestOpcode.rawValue
        bytes[2] = attributeHandle.littleEndian.bytes.0
        bytes[3] = attributeHandle.littleEndian.bytes.1
        bytes[4] = errorCode.rawValue
        
        return bytes
    }
}
