//
//  ATTReadMultipleResponse.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// Read Multiple Response
///
/// The read response is sent in reply to a received *Read Multiple Request* and
/// contains the values of the attributes that have been read.
public struct ATTReadMultipleResponse: ATTProtocolDataUnit {
    
    public static let attributeOpcode = ATT.Opcode.readMultipleResponse
    
    /// Minimum length
    internal static let length = 1 + 0
    
    public var values: Data
    
    public init(values: Data) {
        
        self.values = values
    }
    
    public init?(data: Data) {
        
        let type = ATTReadMultipleResponse.self
        
        guard data.count >= type.length
            else { return nil }
        
        let attributeOpcodeByte = data[0]
        
        guard attributeOpcodeByte == type.attributeOpcode.rawValue
            else { return nil }
        
        if data.count > 1 {
            
            self.values = Data(data.suffix(from: 1))
            
        } else {
            
            self.values = Data()
        }
    }
    
    public var data: Data {
        
        let type = ATTReadBlobResponse.self
        
        return Data([type.attributeOpcode.rawValue]) + values
    }
}
