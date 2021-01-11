//
//  ATTExecuteWriteResponse.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// The *Execute Write Response* is sent in response to a received *Execute Write Request*.
@frozen
public struct ATTExecuteWriteResponse: ATTProtocolDataUnit {
    
    public static var attributeOpcode: ATTOpcode { return .executeWriteResponse }
    
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
