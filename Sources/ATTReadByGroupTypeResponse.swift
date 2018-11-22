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
public struct ATTReadByGroupTypeResponse: ATTProtocolDataUnit, Equatable {
    
    public static var attributeOpcode: ATT.Opcode { return .readByGroupTypeResponse }
    
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
    }
}

public extension ATTReadByGroupTypeResponse {
    
    /// Minimum length
    private static var minimumLength: Int { return 1 + 1 + 4 }
    
    public init?(data: Data) {
        
        guard data.count >= type(of: self).minimumLength
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
            
            let attributeBytes = data.subdataNoCopy(in: byteIndex ..< byteIndex + length)
            
            guard let attributeData = AttributeData(data: attributeBytes)
                else { return nil }
            
            attributeDataList.append(attributeData)
        }
        
        self.attributeData = attributeDataList
        
        assert(length == attributeData[0].dataLength)
    }
    
    public var data: Data {
        
        return Data(self)
    }
}

// MARK: - DataConvertible

extension ATTReadByGroupTypeResponse: DataConvertible {
    
    static func dataLength <T: Collection> (for attributes: T) -> Int where T.Element == AttributeData {
        
        assert(attributes.isEmpty == false)
        
        return attributes.reduce(2, { $0 + $1.dataLength })
    }
    
    var dataLength: Int {
        
        return type(of: self).dataLength(for: attributeData)
    }
    
    static func += (data: inout Data, value: ATTReadByGroupTypeResponse) {
        
        data += attributeOpcode.rawValue
        data += UInt8(value.attributeData[0].dataLength)
        value.attributeData.forEach { data += $0 }
    }
}

// MARK: - Supporting Types

public extension ATTReadByGroupTypeResponse {
    
    public struct AttributeData: Equatable {
        
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

internal extension ATTReadByGroupTypeResponse.AttributeData {
    
    internal init?(data: Data) {
        
        guard data.count >= 4
            else { return nil }
        
        self.attributeHandle = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
        self.endGroupHandle = UInt16(littleEndian: UInt16(bytes: (data[2], data[3])))
        
        if data.count > 4 {
            
            self.value = Data(data.suffix(from: 4))
            
        } else {
            
            self.value = Data()
        }
    }
}

extension ATTReadByGroupTypeResponse.AttributeData: DataConvertible {
    
    var dataLength: Int {
        
        return 4 + value.count
    }
    
    static func += (data: inout Data, value: ATTReadByGroupTypeResponse.AttributeData) {
        
        data += value.attributeHandle.littleEndian
        data += value.endGroupHandle.littleEndian
        data += value.value
    }
}
