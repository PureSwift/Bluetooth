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
@frozen
public struct ATTReadMultipleResponse: ATTProtocolDataUnit, Equatable {
    
    public static var attributeOpcode: ATTOpcode { return .readMultipleResponse }
    
    public var values: Data
    
    public init(values: Data) {
        
        self.values = values
    }
    
    public init?(data: Data) {
        
        guard type(of: self).validateOpcode(data)
            else { return nil }
        
        self.values = data.suffixCheckingBounds(from: 1)
    }
    
    public var data: Data {
        
        return Data([type(of: self).attributeOpcode.rawValue]) + values
    }
}
