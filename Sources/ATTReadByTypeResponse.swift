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
public struct ATTReadByTypeResponse: ATTProtocolDataUnit {
    
    public static let attributeOpcode = ATT.Opcode.readByTypeResponse
    
    /// Minimum length
    internal static let length = 1 + 1 + AttributeData.length
    
    /// A list of Attribute Data.
    public let attributeData: [AttributeData]
    
    public init?(attributeData: [AttributeData]) {
        
        // must have at least one attribute data
        guard attributeData.isEmpty == false else { return nil }
        
        let length = attributeData[0].value.count
        
        // length must be at least 3 bytes
        guard length >= AttributeData.length else { return nil }
        
        // validate the length of each pair
        for pair in attributeData {
            
            guard pair.value.count == length
                else { return nil }
        }
        
        self.attributeData = attributeData
    }
    
    internal init(_ unsafe: [AttributeData]) {
        
        self.attributeData = unsafe
    }
    
    public init?(data: Data) {
        
        guard data.count >= ATTReadByTypeResponse.length
            else { return nil }
        
        let attributeOpcodeByte = data[0]
        
        guard attributeOpcodeByte == type(of: self).attributeOpcode.rawValue
            else { return nil }
        
        let attributeDataLength = Int(data[1])
        
        let attributeDataByteCount = data.count - 2
        
        guard attributeDataByteCount % attributeDataLength == 0 else { return nil }
        
        let attributeDataCount = attributeDataByteCount / attributeDataLength
        
        var attributeData = [AttributeData]()
        attributeData.reserveCapacity(attributeDataCount)
        
        for index in 0 ..< attributeDataCount {
            
            let byteIndex = 2 + (index * attributeDataLength)
            
            let attributeBytes = Data(data[byteIndex ..< byteIndex + attributeDataLength])
            
            guard let attribute = AttributeData(data: attributeBytes)
                else { return nil }
            
            attributeData.append(attribute)
        }
        
        self.attributeData = attributeData
    }
    
    public var data: Data {
        
        let valueLength = UInt8(2 + attributeData[0].value.count)
        
        var bytes = Data([type(of: self).attributeOpcode.rawValue, valueLength])
        
        for attribute in attributeData {
            
            bytes += attribute.data
        }
        
        return bytes
    }
}

// MARK: - Supporting Types

public extension ATTReadByTypeResponse {
    
    /// Attribute handle and value pair.
    public struct AttributeData {
        
        /// Minimum length.
        internal static let length = 2
        
        /// Attribute Handle
        public var handle: UInt16
        
        /// Attribute Value
        public var value: Data
        
        public init(handle: UInt16,
                    value: Data) {
            
            self.handle = handle
            self.value = value
        }
        
        public init?(data: Data) {
            
            guard data.count >= AttributeData.length
                else { return nil }
            
            self.handle = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
            
            if data.count > AttributeData.length {
                
                let startingIndex = AttributeData.length
                
                self.value = Data(data.suffix(from: startingIndex))
                
            } else {
                
                self.value = Data()
            }
        }
        
        public var data: Data {
            
            let handleBytes = handle.littleEndian.bytes
            
            return [handleBytes.0, handleBytes.1] + value
        }
    }
}
