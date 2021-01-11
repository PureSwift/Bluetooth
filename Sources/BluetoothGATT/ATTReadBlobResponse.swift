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
@frozen
public struct ATTReadBlobResponse: ATTProtocolDataUnit, Equatable {
    
    public static var attributeOpcode: ATTOpcode { return .readBlobResponse }
    
    /// Part of the value of the attribute with the handle given.
    ///
    ///
    /// The part attribute value shall be set to part of the value of the attribute identified
    /// by the attribute handle and the value offset in the request.
    public var partAttributeValue: Data
    
    public init(partAttributeValue: Data) {
        
        self.partAttributeValue = partAttributeValue
    }
}

public extension ATTReadBlobResponse {
    
    init?(data: Data) {
        
        guard data.count >= 1,
            type(of: self).validateOpcode(data)
            else { return nil }
        
        self.partAttributeValue = data.suffixCheckingBounds(from: 1)
    }
    
    var data: Data {
        
        return Data(self)
    }
}

// MARK: - DataConvertible

extension ATTReadBlobResponse: DataConvertible {
    
    var dataLength: Int {
        
        return 1 + partAttributeValue.count
    }
    
    static func += <T: DataContainer> (data: inout T, value: ATTReadBlobResponse) {
        
        data += attributeOpcode.rawValue
        data += value.partAttributeValue
    }
}
