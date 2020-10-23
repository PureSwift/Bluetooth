//
//  ATTProtocolDataUnit.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 3/1/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Protocol Definition

/// Data packet for the ATT protocol.
public protocol ATTProtocolDataUnit {
    
    /// The PDU's attribute opcode.
    static var attributeOpcode: ATTOpcode { get }
    
    /// Converts PDU to raw bytes (little-endian).
    var data: Data { get }
    
    /// Initializes PDU from raw bytes (little-endian).
    init?(data: Data)
}

internal extension ATTProtocolDataUnit {
    
    @inline(__always)
    static func validateOpcode(_ data: Data) -> Bool {
        
        return data.first == attributeOpcode.rawValue
    }
}

// MARK: - Supporting Types

internal protocol ATTAttributeDataList: ATTProtocolDataUnit {
    
    associatedtype AttributeData: ATTAttributeData
    
    static var headerLength: Int { get }
}

internal protocol ATTAttributeData {
    
    init?(data: Data)
}

extension ATTAttributeDataList {
    
    static var headerLength: Int { return 2 }
}

internal extension ATTAttributeDataList where AttributeData: DataConvertible {
    
    static func validate(_ attributeData: [AttributeData]) -> Bool {
        
        // must have at least one item
        guard let valueLength = attributeData.first?.dataLength
            else { return false }
        
        for attributeData in attributeData {
            
            // all items must have same length
            guard attributeData.dataLength == valueLength
                else { return false }
        }
        
        return true
    }
    
    static func dataLength <T: Collection> (for attributes: T) -> Int where T.Element == AttributeData {
        
        assert(attributes.isEmpty == false)
        return attributes.reduce(headerLength, { $0 + $1.dataLength })
    }
    
    static func append <T: DataContainer> (_ data: inout T, _ attributeData: [AttributeData]) {
        
        data += attributeOpcode.rawValue
        data += UInt8(attributeData[0].dataLength)
        attributeData.forEach { data += $0 }
    }
}

internal extension ATTAttributeDataList {
    
    static func from(data: Data) -> [AttributeData]? {
        
        guard data.count > headerLength,
            validateOpcode(data)
            else { return nil }
        
        let attributeDataLength = Int(data[1])
        
        let attributeDataByteCount = data.count - headerLength
        
        guard attributeDataByteCount % attributeDataLength == 0
            else { return nil }
        
        let attributeDataCount = attributeDataByteCount / attributeDataLength
        
        guard attributeDataCount >= 1
            else { return nil }
        
        var attributeData = [AttributeData]()
        attributeData.reserveCapacity(attributeDataCount)
        
        for index in 0 ..< attributeDataCount {
            
            let byteIndex = headerLength + (index * attributeDataLength)
            
            let attributeBytes = data.subdataNoCopy(in: byteIndex ..< byteIndex + attributeDataLength)
            
            guard let attribute = AttributeData(data: attributeBytes)
                else { return nil }
            
            attributeData.append(attribute)
        }
        
        return attributeData
    }
}
