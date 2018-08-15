//
//  GenericAccessProfile.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 4/26/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 Generic Access Profile
 
 - SeeAlso:
 [Generic Access Profile](https://www.bluetooth.com/specifications/assigned-numbers/generic-access-profile)
 */
public enum GAP {
    
    public typealias DataType = GAPDataType
}

// MARK: - Generic Access Profile Data

/// Generic Access Profile Data
public protocol GAPData {
    
    static var dataType: GAPDataType { get }
    
    init?(data: Data)
    
    var data: Data { get }
}

// MARK: - Internal

/// Encodes / Decodes an array of 16 bit values. 
internal struct Bit16UUIDList {
    
    public var uuids: [UInt16]
    
    public init(uuids: [UInt16]) {
        
        self.uuids = uuids
    }
    
    public init?(data: Data) {
                
        var uuids = [UInt16]()
        uuids.reserveCapacity(data.count / 2)
        
        var index = 0
        while index < data.count {
            
            guard index + 1 < data.count
                else { return nil }
            
            let value = UInt16(littleEndian: UInt16(bytes: (data[index], data[index + 1])))
            
            index += 2
            
            uuids.append(value)
        }
        
        self.uuids = uuids
    }
    
    public var data: Data {
        
        return uuids.reduce(Data(), { $0.0 + [$0.1.littleEndian.bytes.0, $0.1.littleEndian.bytes.1] })
    }
}

/// Encodes / Decodes an array of 32 bit values.
internal struct Bit32UUIDList {
    
    public var uuids: [UInt32]
    
    public init(uuids: [UInt32]) {
        
        self.uuids = uuids
    }
    
    public init?(data: Data) {
        
        var uuids = [UInt32]()
        uuids.reserveCapacity(data.count / 4)
        
        var index = 0
        while index < data.count {
            
            guard index + 3 < data.count
                else { return nil }
            
            let value = UInt32(littleEndian: UInt32(bytes: (data[index], data[index + 1], data[index + 2], data[index + 3])))
            
            index += 4
            
            uuids.append(value)
        }
        
        self.uuids = uuids
    }
    
    public var data: Data {
        
        return uuids.reduce(Data(), { $0.0 + [$0.1.littleEndian.bytes.0, $0.1.littleEndian.bytes.1, $0.1.littleEndian.bytes.2, $0.1.littleEndian.bytes.3] })
    }
}

/// Encodes / Decodes an array of 128 bit values.
internal struct Bit128UUIDList {
    
    public var uuids: [UInt128]
    
    public init(uuids: [UInt128]) {
        
        self.uuids = uuids
    }
    
    public init?(data: Data) {
        
        var uuids = [UInt128]()
        uuids.reserveCapacity(data.count / 16)
        
        var index = 0
        while index < data.count {
            
            guard index + 15 < data.count
                else { return nil }
            
            let value = UInt128(littleEndian: UInt128(bytes: (data[index], data[index + 1], data[index + 2], data[index + 3], data[index + 4], data[index + 5], data[index + 6], data[index + 7], data[index + 8], data[index + 9], data[index + 10], data[index + 11], data[index + 12], data[index + 13], data[index + 14], data[index + 15])))
            
            index += 16
            
            uuids.append(value)
        }
        
        self.uuids = uuids
    }
    
    public var data: Data {
        
        return uuids.reduce(Data(), { $0.0 + [$0.1.littleEndian.bytes.0, $0.1.littleEndian.bytes.1, $0.1.littleEndian.bytes.2, $0.1.littleEndian.bytes.3, $0.1.littleEndian.bytes.4, $0.1.littleEndian.bytes.5, $0.1.littleEndian.bytes.6, $0.1.littleEndian.bytes.7, $0.1.littleEndian.bytes.8, $0.1.littleEndian.bytes.9, $0.1.littleEndian.bytes.10, $0.1.littleEndian.bytes.11, $0.1.littleEndian.bytes.12, $0.1.littleEndian.bytes.13, $0.1.littleEndian.bytes.14, $0.1.littleEndian.bytes.15] })
    }
}

// MARK: - Coding

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
        
        assert(value.count <= Int(UInt8.max))
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
        
        guard data.isEmpty == false
            else { return [] }
        
        var elements = [GAPDataElement]()
        
        var index = 0
        
        while index < data.count {
            
            // get length
            let length = Int(data[index]) // 0
            index += 1
            guard index < data.count
                else { throw Error.insufficientBytes(expected: index + 1, actual: data.count) }
            
            // get type
            let type = GAPDataType(rawValue: data[index]) // 1
            
            // get value
            let value: Data
            
            if length > 0 {
                
                let dataRange = index + 1 ..< index + length // 2 ..< 2 + length
                index = dataRange.upperBound
                guard index <= data.count
                    else { throw Error.insufficientBytes(expected: index + 1, actual: data.count) }
                
                value = Data(data[dataRange])
                
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
        
        let elements = try decode(data)
        
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
