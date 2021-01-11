//
//  ATTReadByTypeResponse.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// Read By Type Response
///
/// The *Read By Type Response* is sent in reply to a received *Read By Type Request*
/// and contains the handles and values of the attributes that have been read.
@frozen
public struct ATTReadByTypeResponse: ATTProtocolDataUnit, Equatable {
    
    public static var attributeOpcode: ATTOpcode { return .readByTypeResponse }
    
    /// A list of Attribute Data.
    public let attributeData: [AttributeData]
    
    public init?(attributeData: [AttributeData]) {
        
        guard type(of: self).validate(attributeData)
            else { return nil }
        
        self.attributeData = attributeData
    }
    
    internal init(_ unsafe: [AttributeData]) {
        
        self.attributeData = unsafe
    }
}

public extension ATTReadByTypeResponse {
    
    init?(data: Data) {
        
        guard let attributeData = ATTReadByTypeResponse.from(data: data)
            else { return nil }
        
        self.attributeData = attributeData
    }
    
    var data: Data {
        
        return Data(self)
    }
}

extension ATTReadByTypeResponse: ATTAttributeDataList { }

// MARK: - DataConvertible

extension ATTReadByTypeResponse: DataConvertible {
    
    var dataLength: Int {
        
        return type(of: self).dataLength(for: attributeData)
    }
    
    static func += <T: DataContainer> (data: inout T, value: ATTReadByTypeResponse) {
        
        append(&data, value.attributeData)
    }
}

// MARK: - Supporting Types

public extension ATTReadByTypeResponse {
    
    /// Attribute handle and value pair.
    struct AttributeData: Equatable {
        
        /// Attribute Handle
        public let handle: UInt16
        
        /// Attribute Value
        public let value: Data
    }
}

extension ATTReadByTypeResponse.AttributeData: ATTAttributeData {
    
    init?(data: Data) {
        
        guard data.count >= 2
            else { return nil }
        
        self.handle = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
        self.value = data.suffixCheckingBounds(from: 2)
    }
}

extension ATTReadByTypeResponse.AttributeData: DataConvertible {
    
    var dataLength: Int {
        
        return 2 + value.count
    }
    
    static func += <T: DataContainer> (data: inout T, value: ATTReadByTypeResponse.AttributeData) {
        
        data += value.handle.littleEndian
        data += value.value
    }
}
