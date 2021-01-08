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
@frozen
public struct ATTHandleValueConfirmation: ATTProtocolDataUnit {
    
    public static var attributeOpcode: ATTOpcode { return .handleValueConfirmation }
    
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
