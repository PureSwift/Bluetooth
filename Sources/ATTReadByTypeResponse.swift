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
    public static let length = 1 + 1 + AttributeData.length
    
    /// A list of Attribute Data.
    public let data: [AttributeData]
    
    public init?(data: [AttributeData]) {
        
        // must have at least one attribute data
        guard data.isEmpty == false else { return nil }
        
        let length = data[0].value.count
        
        // length must be at least 3 bytes
        guard length >= AttributeData.length else { return nil }
        
        // validate the length of each pair
        for pair in data {
            
            guard pair.value.count == length
                else { return nil }
        }
        
        self.data = data
    }
    
    public init?(byteValue: [UInt8]) {
        
        guard byteValue.count >= ATTReadByTypeResponse.length
            else { return nil }
        
        let attributeOpcodeByte = byteValue[0]
        
        guard attributeOpcodeByte == type(of: self).attributeOpcode.rawValue
            else { return nil }
        
        let attributeDataLength = Int(byteValue[1])
        
        let attributeDataByteCount = byteValue.count - 2
        
        guard attributeDataByteCount % attributeDataLength == 0 else { return nil }
        
        let attributeDataCount = attributeDataByteCount / attributeDataLength
        
        var attributeData = [AttributeData](repeating: AttributeData(), count: attributeDataCount)
        
        for index in 0 ..< attributeDataCount {
            
            let byteIndex = 2 + (index * attributeDataLength)
            
            let dataBytes = Array(byteValue[byteIndex ..< byteIndex + attributeDataLength])
            
            guard let data = AttributeData(byteValue: dataBytes)
                else { return nil }
            
            attributeData[index] = data
        }
        
        self.data = attributeData
    }
    
    public var byteValue: [UInt8] {
        
        let valueLength = UInt8(2 + data[0].value.count)
        
        var bytes = [type(of: self).attributeOpcode.rawValue, valueLength]
        
        for attributeData in data {
            
            bytes += attributeData.byteValue
        }
        
        return bytes
    }
}

// MARK: - Supporting Types

public extension ATTReadByTypeResponse {
    
    /// Attribute handle and value pair.
    public struct AttributeData {
        
        /// Minimum length.
        public static let length = 2
        
        /// Attribute Handle
        public var handle: UInt16
        
        /// Attribute Value
        public var value: [UInt8]
        
        public init(handle: UInt16 = 0, value: [UInt8] = []) {
            
            self.handle = handle
            self.value = value
        }
        
        public init?(byteValue: [UInt8] = []) {
            
            guard byteValue.count >= AttributeData.length
                else { return nil }
            
            self.handle = UInt16(bytes: (byteValue[0], byteValue[1])).littleEndian
            
            if byteValue.count > AttributeData.length {
                
                let startingIndex = AttributeData.length
                
                self.value = Array(byteValue.suffix(from: startingIndex))
                
            } else {
                
                self.value = []
            }
        }
        
        public var byteValue: [UInt8] {
            
            let handleBytes = handle.littleEndian.bytes
            
            return [handleBytes.0, handleBytes.1] + value
        }
    }
}
