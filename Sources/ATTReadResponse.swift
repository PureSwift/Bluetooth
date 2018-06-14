//
//  ATTReadResponse.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// Read Response
///
/// The *Read Response* is sent in reply to a received *Read Request* and contains
/// the value of the attribute that has been read.
///
/// - Note: The *Read Blob Request* would be used to read the remaining octets of a long attribute value.
public struct ATTReadResponse: ATTProtocolDataUnit {
    
    public static let attributeOpcode = ATT.Opcode.readResponse
    
    /// Minimum length
    internal static let length = 1 + 0
    
    /// The value of the attribute with the handle given.
    public var attributeValue: Data
    
    public init(attributeValue: Data) {
        
        self.attributeValue = attributeValue
    }
    
    public init?(data: Data) {
        
        guard data.count >= type(of: self).length
            else { return nil }
        
        let attributeOpcodeByte = data[0]
        
        guard attributeOpcodeByte == type(of: self).attributeOpcode.rawValue
            else { return nil }
        
        if data.count > type(of: self).length {
            
            self.attributeValue = Data(data.suffix(from: 1))
            
        } else {
            
            self.attributeValue = Data()
        }
    }
    
    public var data: Data {
        
        return Data([ATTReadResponse.attributeOpcode.rawValue]) + attributeValue
    }
}
