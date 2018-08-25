//
//  GAPDataEncoder.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 8/25/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

public struct GAPDataElement {
    
    public var type: GAPDataType
    
    public var value: Data
    
    public init(type: GAPDataType, value: Data) {
        
        self.type = type
        self.value = value
    }
    
    public init(_ data: GAPData) {
        
        self.type = type(of: data).dataType
        self.value = data.data
    }
}

public struct GAPDataEncoder {
    
    private static func encode(_ element: GAPDataElement) -> Data {
        
        return Data([UInt8(element.value.count + 1), element.type.rawValue]) + element.value
    }
    
    public static func encode(_ elements: [GAPDataElement]) -> Data {
        
        var data = Data()
        data.reserveCapacity(elements.count * 3)
        
        elements.forEach { data.append(encode($0)) }
        
        return data
    }
    
    public static func encode(_ encodables: [GAPData]) -> Data {
        
        let elements = encodables.map { GAPDataElement($0) }
        
        return encode(elements)
    }
}

public struct GAPDataDecoder {
    
    public enum Error: Swift.Error {
        
        case insufficientBytes(expected: Int, actual: Int)
        case cannotDecode(GAPData.Type, GAPDataElement)
        case unknownType(GAPDataType)
    }
    
    public static func decode(_ data: Data) throws -> [GAPDataElement] {
        
        return try decode(data, copyBytes: true)
    }
    
    internal static func decode(_ data: Data, copyBytes: Bool) throws -> [GAPDataElement] {
        
        guard data.isEmpty == false
            else { return [] }
        
        var elements = [GAPDataElement]()
        
        var index = 0
        
        while index < data.count {
            
            // get length
            let length = Int(data[index]) // 0
            index += 1
            guard index < data.count else {
                
                if length == 0 {
                    
                    break // EOF
                    
                } else {
                    
                    throw Error.insufficientBytes(expected: index + 1, actual: data.count)
                }
            }
            
            // get type
            let type = GAPDataType(rawValue: data[index]) // 1
            
            // ignore zeroed bytes
            guard (type.rawValue == 0 && length == 0) == false
                else { break }
            
            // get value
            let value: Data
            
            if length > 0 {
                
                let dataRange = index + 1 ..< index + length // 2 ..< 2 + length
                index = dataRange.upperBound
                guard index <= data.count
                    else { throw Error.insufficientBytes(expected: index + 1, actual: data.count) }
                
                value = copyBytes ? data.subdata(in: Range(dataRange)) : data.subdataNoCopy(in: dataRange)
                
            } else {
                
                value = Data()
            }
            
            elements.append(GAPDataElement(type: type, value: value))
        }
        
        return elements
    }
    
    public static func decode(_ data: Data,
                              types: [GAPData.Type],
                              ignoreUnknownType: Bool = true) throws -> [GAPData] {
        
        let elements = try decode(data, copyBytes: false) // don't allocate copies for each element
        
        var decodables = [GAPData]()
        decodables.reserveCapacity(elements.count)
        
        for element in elements {
            
            if let type = types.first(where: { $0.dataType == element.type }) {
                
                guard let decodable = type.init(data: element.value)
                    else { throw Error.cannotDecode(type, element) }
                
                decodables.append(decodable)
                
            } else if ignoreUnknownType {
                
                continue
                
            } else {
                
                throw Error.unknownType(element.type)
            }
        }
        
        return decodables
    }
}
