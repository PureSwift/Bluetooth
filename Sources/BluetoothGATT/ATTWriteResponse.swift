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
@frozen
public struct ATTWriteResponse: ATTProtocolDataUnit {
    
    public static var attributeOpcode: ATTOpcode { return .writeResponse }
    
    public init() { }
    
    public init?(data: Data) {
        
        guard data.count == 1,
            type(of: self).validateOpcode(data)
            else { return nil }
    }
    
    public var data: Data {
        
        return Data([type(of: self).attributeOpcode.rawValue])
    }
}
