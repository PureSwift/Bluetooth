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
public struct ATTReadByGroupTypeResponse: ATTProtocolDataUnit {
    
    public static let attributeOpcode = ATT.Opcode.readByGroupTypeResponse
    
    /// Minimum length
    internal static let length = 1 + 1 + 4
    
    /// A list of Attribute Data
    public let attributeData: [AttributeData]
    
    public init?(attributeData attributeDataList: [AttributeData]) {
        
        // must have at least one item
        guard let valueLength = attributeDataList.first?.value.count
            else { return nil }
        
        for attributeData in attributeDataList {
            
            // all items must have same length
            guard attributeData.value.count == valueLength
                else { return nil }
        }
        
        self.attributeData = attributeDataList
    }
    
    internal init(_ unsafe: [AttributeData]) {
        
        self.attributeData = unsafe
        
        assert(ATTReadByGroupTypeResponse(attributeData: unsafe) != nil)
    }
    
    public init?(data: Data) {
        
        guard data.count >= type(of: self).length
            else { return nil }
        
        let attributeOpcodeByte = data[0]
        
        guard attributeOpcodeByte == type(of: self).attributeOpcode.rawValue
            else { return nil }
        
        let length = Int(data[1])
        
        let attributeDataBytesCount = data.count - 2
        
        let attributeCount = attributeDataBytesCount / length
        
        guard attributeDataBytesCount % length == 0
            else { return nil }
        
        var attributeDataList = [AttributeData]()
        attributeDataList.reserveCapacity(attributeCount)
        
        for index in 0 ..< attributeCount {
            
            let byteIndex = 2 + (index * length)
            
            let attributeBytes = Data(data[byteIndex ..< byteIndex + length])
            
            guard let attributeData = AttributeData(data: attributeBytes)
                else { return nil }
            
            attributeDataList.append(attributeData)
        }
        
        self.attributeData = attributeDataList
        
        assert(length == (attributeData[0].data.count))
    }
    
    public var data: Data {
        
        let length = UInt8(attributeData[0].value.count + 4)
        
        var attributeDataBytes = Data()
        
        for attribute in attributeData {
            
            attributeDataBytes += attribute.data
        }
        
        return Data([type(of: self).attributeOpcode.rawValue, length]) + attributeDataBytes
    }
    
    public struct AttributeData {
        
        /// Minimum length
        internal static let length = 4
        
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
        
        public init?(data: Data) {
            
            guard data.count >= AttributeData.length
                else { return nil }
            
            self.attributeHandle = UInt16(bytes: (data[0], data[1])).littleEndian
            self.endGroupHandle = UInt16(bytes: (data[2], data[3])).littleEndian
            
            if data.count > type(of: self).length {
                
                self.value = Data(data.suffix(from: type(of: self).length))
                
            } else {
                
                self.value = Data()
            }
        }
        
        public var data: Data {
            
            let attributeHandleBytes = attributeHandle.littleEndian.bytes
            
            let endGroupHandleBytes = endGroupHandle.littleEndian.bytes
            
            return Data([attributeHandleBytes.0, attributeHandleBytes.1, endGroupHandleBytes.0, endGroupHandleBytes.1]) + value
        }
    }
}
