//
//  GAPDataEncoder.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 8/25/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

public extension GAP {
    
    public typealias DataEncoder = GAPDataEncoder
}

public struct GAPDataEncoder {
    
    public enum Error: Swift.Error {
        
        case invalidSize(Int)
    }
    
    public init() { }
    
    public func encode(_ encodables: GAPData...) -> Data {
        
        return encode(encodables)
    }
    
    public func encodeAdvertisingData(_ encodables: GAPData...) throws -> LowEnergyAdvertisingData {
        
        let encodedData = encode(encodables)
        
        guard let advertisingData = LowEnergyAdvertisingData(data: encodedData)
            else { throw Error.invalidSize(encodedData.count) }
        
        return advertisingData
    }
    
    public func encode(_ encodables: [GAPData]) -> Data {
        
        let dataLengths = encodables.map { $0.dataLength }
        let length = dataLengths.reduce(0, { $0 + $1 + 2 })
        var data = Data(capacity: length)
        
        for (index, encodable) in encodables.enumerated() {
            
            let dataLength = dataLengths[index]
            
            data += UInt8(dataLength + 1)
            data += type(of: encodable).dataType.rawValue
            encodable.append(to: &data)
        }
        
        return data
    }
}

public struct GAPDataDecoder {
    
    public enum Error: Swift.Error {
        
        case insufficientBytes(expected: Int, actual: Int)
        case cannotDecode(GAPDataType, index: Int)
        case unknownType(GAPDataType)
    }
    
    public init() { }
    
    public var ignoreUnknownType: Bool = false
    
    public var types: [GAPData.Type] = gapDataTypes
    
    public func decode(_ data: LowEnergyAdvertisingData) throws -> [GAPData] {
        
        return try data.withUnsafeData { try decode($0) }
    }
    
    public func decode(_ data: Data) throws -> [GAPData] {
        
        guard data.isEmpty == false
            else { return [] }
        
        var elements = [GAPData]()
        elements.reserveCapacity(1)
        
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
                
                value = data.subdataNoCopy(in: dataRange)
                
            } else {
                
                value = Data()
            }
            
            if let gapType = types.first(where: { $0.dataType == type }) {
                
                guard let decodable = gapType.init(data: value)
                    else { throw Error.cannotDecode(type, index: index) }
                
                elements.append(decodable)
                
            } else if ignoreUnknownType {
                
                continue
                
            } else {
                
                throw Error.unknownType(type)
            }
        }
        
        return elements
    }
}

// MARK: - Deprecated

public extension GAPDataEncoder {
    
    @available(*, deprecated)
    public static func encode(_ encodables: [GAPData]) -> Data {
        
        let encoder = GAPDataEncoder()
        return encoder.encode(encodables)
    }
}

public extension GAPDataDecoder {
    
    @available(*, deprecated)
    public static func decode(_ data: Data,
                              types: [GAPData.Type],
                              ignoreUnknownType: Bool = true) throws -> [GAPData] {
        
        var decoder = GAPDataDecoder()
        decoder.types = types
        decoder.ignoreUnknownType = ignoreUnknownType
        return try decoder.decode(data)
    }
}

internal let gapDataTypes: [GAPData.Type] = [
    GAP3DInformation.self,
    GAPAdvertisingInterval.self,
    GAPAppearanceData.self,
    GAPChannelMapUpdateIndication.self,
    GAPClassOfDevice.self,
    GAPCompleteListOf16BitServiceClassUUIDs.self,
    GAPCompleteListOf32BitServiceClassUUIDs.self,
    GAPCompleteListOf128BitServiceClassUUIDs.self,
    GAPCompleteLocalName.self,
    GAPFlags.self,
    GAPIncompleteListOf16BitServiceClassUUIDs.self,
    GAPIncompleteListOf32BitServiceClassUUIDs.self,
    GAPIncompleteListOf128BitServiceClassUUIDs.self,
    GAPIndoorPositioning.self,
    GAPLEDeviceAddress.self,
    GAPLERole.self,
    GAPLESecureConnectionsConfirmation.self,
    GAPLESecureConnectionsRandom.self,
    //GAPLESupportedFeatures.self,
    GAPListOf16BitServiceSolicitationUUIDs.self,
    GAPListOf32BitServiceSolicitationUUIDs.self,
    GAPListOf128BitServiceSolicitationUUIDs.self,
    GAPManufacturerSpecificData.self,
    GAPMeshBeacon.self,
    GAPMeshMessage.self,
    GAPPBADV.self,
    GAPPublicTargetAddress.self,
    GAPRandomTargetAddress.self,
    GAPSecurityManagerOOBFlags.self,
    GAPSecurityManagerTKValue.self,
    GAPServiceData16BitUUID.self,
    GAPServiceData32BitUUID.self,
    GAPServiceData128BitUUID.self,
    GAPShortLocalName.self,
    GAPSimplePairingHashC.self,
    GAPSimplePairingRandomizerR.self,
    GAPSlaveConnectionIntervalRange.self,
    GAPTransportDiscoveryData.self,
    GAPTxPowerLevel.self,
    GAPURI.self
]
