//
//  ATTHandleValueConfirmation.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// Handle Value Confirmation
///
/// The *Handle Value Confirmation* is sent in response to a received *Handle Value Indication*
/// and confirms that the client has received an indication of the given attribute.
public struct ATTHandleValueConfirmation: ATTProtocolDataUnit {
    
    public static let attributeOpcode = ATT.Opcode.handleValueConfirmation
    
    internal static let length = 1
    
    public init() { }
    
    public init?(data: Data) {
        
        let type = ATTHandleValueConfirmation.self
        
        guard data.count >= type.length
            else { return nil }
        
        let attributeOpcodeByte = data[0]
        
        guard attributeOpcodeByte == type.attributeOpcode.rawValue
            else { return nil }
    }
    
    public var data: Data {
        
        return Data([ATTHandleValueConfirmation.attributeOpcode.rawValue])
    }
}
