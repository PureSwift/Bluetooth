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
public struct ATTReadByTypeResponse: ATTProtocolDataUnit, Equatable {
    
    public static let attributeOpcode = ATT.Opcode.readByTypeResponse
    
    /// A list of Attribute Data.
    public let attributeData: [AttributeData]
    
    public init?(attributeData: [AttributeData]) {
        
        // must have at least one attribute data
        guard attributeData.isEmpty == false
            else { return nil }
        
        let length = attributeData[0].value.count
        
        // length must be at least 3 bytes
        guard length >= AttributeData.minimumLength
            else { return nil }
        
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
}

public extension ATTReadByTypeResponse {
    
    /// Minimum length
    private static let minimumLength = 1 + 1 + AttributeData.minimumLength
    
    public init?(data: Data) {
        
        guard data.count >= type(of: self).minimumLength
            else { return nil }
        
        let attributeOpcodeByte = data[0]
        
        guard attributeOpcodeByte == type(of: self).attributeOpcode.rawValue
            else { return nil }
        
        let attributeDataLength = Int(data[1])
        
        let attributeDataByteCount = data.count - 2
        
        guard attributeDataByteCount % attributeDataLength == 0
            else { return nil }
        
        let attributeDataCount = attributeDataByteCount / attributeDataLength
        
        guard attributeDataCount >= 1
            else { return nil }
        
        var attributeData = [AttributeData]()
        attributeData.reserveCapacity(attributeDataCount)
        
        for index in 0 ..< attributeDataCount {
            
            let byteIndex = 2 + (index * attributeDataLength)
            
            let attributeBytes = data.subdataNoCopy(in: byteIndex ..< byteIndex + attributeDataLength)
            
            guard let attribute = AttributeData(data: attributeBytes)
                else { return nil }
            
            attributeData.append(attribute)
        }
        
        self.attributeData = attributeData
    }
    
    public var data: Data {
        
        return Data(self)
    }
}

// MARK: - DataConvertible

extension ATTReadByTypeResponse: DataConvertible {
    
    static func dataLength <T: Collection> (for attributes: T) -> Int where T.Element == AttributeData {
        
        assert(attributes.isEmpty == false)
        
        return attributes.reduce(2, { $0 + $1.dataLength })
    }
    
    var dataLength: Int {
        
        return type(of: self).dataLength(for: attributeData)
    }
    
    static func += (data: inout Data, value: ATTReadByTypeResponse) {
        
        data += attributeOpcode.rawValue
        data += UInt8(value.attributeData[0].dataLength)
        value.attributeData.forEach { data += $0 }
    }
}

// MARK: - Supporting Types

public extension ATTReadByTypeResponse {
    
    /// Attribute handle and value pair.
    public struct AttributeData: Equatable {
        
        /// Attribute Handle
        public let handle: UInt16
        
        /// Attribute Value
        public let value: Data
    }
}

internal extension ATTReadByTypeResponse.AttributeData {
    
    /// Minimum length.
    internal static var minimumLength: Int { return 2 }
    
    init?(data: Data) {
        
        guard data.count >= type(of: self).minimumLength
            else { return nil }
        
        self.init(data)
    }
    
    fileprivate init(_ data: Data) {
        
        self.handle = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
        
        if data.count > type(of: self).minimumLength {
            let startingIndex = type(of: self).minimumLength
            self.value = Data(data.suffix(from: startingIndex))
        } else {
            self.value = Data()
        }
    }
}

extension ATTReadByTypeResponse.AttributeData: DataConvertible {
    
    var dataLength: Int {
        
        return type(of: self).minimumLength + value.count
    }
    
    static func += (data: inout Data, value: ATTReadByTypeResponse.AttributeData) {
        
        data += value.handle.littleEndian
        data += value.value
    }
}
