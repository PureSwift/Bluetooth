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
@frozen
public struct ATTReadResponse: ATTProtocolDataUnit, Equatable {
    
    public static var attributeOpcode: ATTOpcode { return .readResponse }
    
    /// The value of the attribute with the handle given.
    public var attributeValue: Data
    
    public init(attributeValue: Data) {
        
        self.attributeValue = attributeValue
    }
}

public extension ATTReadResponse {
    
    init?(data: Data) {
        
        guard data.count >= 1,
            type(of: self).validateOpcode(data)
            else { return nil }
        
        self.attributeValue = data.suffixCheckingBounds(from: 1)
    }
    
    var data: Data {
        
        return Data(self)
    }
}

// MARK: - DataConvertible

extension ATTReadResponse: DataConvertible {
    
    var dataLength: Int {
        
        return 1 + attributeValue.count
    }
    
    static func += <T: DataContainer> (data: inout T, value: ATTReadResponse) {
        
        data += attributeOpcode.rawValue
        data += value.attributeValue
    }
}
