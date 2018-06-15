//
//  ATTReadBlobResponse.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// Read Blob Response
///
/// The *Read Blob Response* is sent in reply to a received *Read Blob Request*
/// and contains part of the value of the attribute that has been read.
public struct ATTReadBlobResponse: ATTProtocolDataUnit {
    
    public static let attributeOpcode = ATT.Opcode.readBlobResponse
    
    /// Minimum length
    internal static let length = 1 + 0
    
    /// Part of the value of the attribute with the handle given.
    ///
    ///
    /// The part attribute value shall be set to part of the value of the attribute identified
    /// by the attribute handle and the value offset in the request.
    public var partAttributeValue: Data
    
    public init(partAttributeValue: Data) {
        
        self.partAttributeValue = partAttributeValue
    }
    
    public init?(data: Data) {
        
        guard data.count >= ATTReadBlobResponse.length
            else { return nil }
        
        let attributeOpcodeByte = data[0]
        
        guard attributeOpcodeByte == ATTReadBlobResponse.attributeOpcode.rawValue
            else { return nil }
        
        if data.count > ATTReadBlobResponse.length {
            
            self.partAttributeValue = Data(data.suffix(from: 1))
            
        } else {
            
            self.partAttributeValue = Data()
        }
    }
    
    public var data: Data {
        
        return Data([ATTReadBlobResponse.attributeOpcode.rawValue]) + partAttributeValue
    }
}
