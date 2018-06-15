//
//  ATTWriteResponse.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// Write Response
///
/// The *Write Response* is sent in reply to a valid *Write Request*
/// and acknowledges that the attribute has been successfully written.
public struct ATTWriteResponse: ATTProtocolDataUnit {
    
    public static let attributeOpcode = ATT.Opcode.writeResponse
    internal static let length = 1
    
    public init() { }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let attributeOpcodeByte = data[0]
        
        guard attributeOpcodeByte == type(of: self).attributeOpcode.rawValue
            else { return nil }
    }
    
    public var data: Data {
        
        return Data([type(of: self).attributeOpcode.rawValue])
    }
}
