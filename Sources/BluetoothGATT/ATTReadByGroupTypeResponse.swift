//
//  ATTReadByGroupTypeResponse.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// Read By Group Type Response
///
/// The *Read By Group Type Response* is sent in reply to a received *Read By Group Type Request*
/// and contains the handles and values of the attributes that have been read.
///
/// - Note: The *Read Blob Request* would be used to read the remaining octets of a long attribute value.
@frozen
public struct ATTReadByGroupTypeResponse: ATTProtocolDataUnit, Equatable {
    
    public static var attributeOpcode: ATTOpcode { return .readByGroupTypeResponse }
    
    /// A list of Attribute Data
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

public extension ATTReadByGroupTypeResponse {
    
    init?(data: Data) {
        
        guard let attributeData = ATTReadByGroupTypeResponse.from(data: data)
            else { return nil }
        
        self.attributeData = attributeData
    }
    
    var data: Data {
        
        return Data(self)
    }
}

extension ATTReadByGroupTypeResponse: ATTAttributeDataList { }

// MARK: - DataConvertible

extension ATTReadByGroupTypeResponse: DataConvertible {
    
    var dataLength: Int {
        return type(of: self).dataLength(for: attributeData)
    }
    
    static func += <T: DataContainer> (data: inout T, value: ATTReadByGroupTypeResponse) {
        append(&data, value.attributeData)
    }
}

// MARK: - Supporting Types

public extension ATTReadByGroupTypeResponse {
    
    struct AttributeData: Equatable {
        
        /// Attribute Handle
        public var attributeHandle: UInt16
        
        /// End Group Handle
        public var endGroupHandle: UInt16
        
        /// Attribute Value
        public var value: Data
        
        public init(attributeHandle: UInt16,
                    endGroupHandle: UInt16,
                    value: Data) {
            
            self.attributeHandle = attributeHandle
            self.endGroupHandle = endGroupHandle
            self.value = value
        }
    }
}

extension ATTReadByGroupTypeResponse.AttributeData: ATTAttributeData {
    
    init?(data: Data) {
        
        guard data.count >= 4
            else { return nil }
        
        self.attributeHandle = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
        self.endGroupHandle = UInt16(littleEndian: UInt16(bytes: (data[2], data[3])))
        self.value = data.suffixCheckingBounds(from: 4)
    }
}

extension ATTReadByGroupTypeResponse.AttributeData: DataConvertible {
    
    var dataLength: Int {
        
        return 4 + value.count
    }
    
    static func += <T: DataContainer> (data: inout T, value: ATTReadByGroupTypeResponse.AttributeData) {
        
        data += value.attributeHandle.littleEndian
        data += value.endGroupHandle.littleEndian
        data += value.value
    }
}
