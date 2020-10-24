//
//  GAPDataEncoder.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 8/25/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// GAP Data Decoder
public struct GAPDataEncoder {
    
    /// GAP Data Decoder Error
    public enum Error: Swift.Error {
        
        /// Invalid data size.
        case invalidSize(Int)
    }
    
    // MARK: - Initialization
    
    /// Initialize encoder.
    public init() { }
    
    // MARK: - Methods
    
    public func encode(_ encodables: [GAPData]) -> Data {
        do { return try _encode(encodables) }
        catch { fatalError("Unable to encode GAP Data: \(error)") }
    }
    
    public func encode(_ encodables: GAPData...) -> Data {
        return encode(encodables)
    }
    
    public func encodeAdvertisingData(_ encodables: GAPData...) throws -> LowEnergyAdvertisingData {
        return try _encode(encodables)
    }
    
    @inline(__always)
    internal func _encode<S, DataType>(_ encodables: S) throws -> DataType where S: Sequence, S.Element == GAPData, DataType: GAPDataContainer {
        
        let dataLengths = encodables.map { $0.dataLength }
        let length = dataLengths.reduce(0, { $0 + $1 + 2 })
        guard length <= DataType.maxCapacity else {
            throw Error.invalidSize(length)
        }
        var data = DataType(capacity: length)
        for (index, encodable) in encodables.enumerated() {
            let dataLength = dataLengths[index]
            data += UInt8(dataLength + 1)
            data += type(of: encodable).dataType.rawValue
            data.append(encodable)
        }
        assert(data.count == length, "Invalid data length")
        return data
    }
}

/// GAP Data Decoder
public struct GAPDataDecoder {
    
    /// GAP Data Decoder Error
    public enum Error: Swift.Error {
        
        case insufficientBytes(expected: Int, actual: Int)
        case cannotDecode(GAPDataType, index: Int)
        case unknownType(GAPDataType)
    }
    
    // MARK: - Initialization
    
    /// Initialize with default data types.
    public init() {
        
        /// initialize with default precomputed values
        self.types = GAPDataDecoder.defaultTypes
        self.dataTypes = GAPDataDecoder.defaultDataTypes
    }
    
    // MARK: - Properties
    
    public var ignoreUnknownType: Bool = false
    
    public var types = [GAPData.Type]() {
        didSet {
            dataTypes = [GAPDataType: GAPData.Type](minimumCapacity: types.count)
            types.forEach { dataTypes[$0.dataType] = $0 }
        }
    }
    
    internal private(set) var dataTypes: [GAPDataType: GAPData.Type] = [:]
    
    // MARK: - Methods
    
    public func decode(_ data: LowEnergyAdvertisingData) throws -> [GAPData] {
        return try decode(data: data)
    }
    
    public func decode(_ data: Data) throws -> [GAPData] {
        return try decode(data: data)
    }
    
    @usableFromInline
    internal func decode<T: GAPDataContainer>(data: T) throws -> [GAPData] {
        
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
            let slice: T.SliceContainer
            
            if length > 0 {
                let dataRange = index + 1 ..< index + length // 2 ..< 2 + length
                index = dataRange.upperBound
                guard index <= data.count
                    else { throw Error.insufficientBytes(expected: index + 1, actual: data.count) }
                
                slice = data.subdataNoCopy(in: dataRange)
            } else {
                slice = T.SliceContainer()
            }
            
            if let gapType = dataTypes[type] {
                guard let decodable = slice.decode(gapType)
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

internal extension GAPDataDecoder {
    
    static let defaultDataTypes: [GAPDataType: GAPData.Type] = {
        var types = [GAPDataType: GAPData.Type](minimumCapacity: defaultTypes.count)
        defaultTypes.forEach { types[$0.dataType] = $0 }
        return types
    }()
    
    static let defaultTypes: [GAPData.Type] = [
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
}

// MARK: - Supporting Types

@usableFromInline
internal protocol GAPDataContainer: DataContainer {
    
    associatedtype Element = UInt8
    
    associatedtype SliceContainer: GAPSliceContainer
    
    init(capacity: Int)
    
    static var maxCapacity: Int { get }
    
    subscript (index: Int) -> UInt8 { get set }
    
    func subdataNoCopy(in range: Range<Int>) -> SliceContainer
    
    mutating func append(_ value: GAPData)
}

@usableFromInline
internal protocol GAPSliceContainer {
    
    /// Initialize empty container
    init()
    
    /// Initialize GAP Data type
    //func decode<T: GAPData>(_ type: T.Type) -> T?
    func decode(_ type: GAPData.Type) -> GAPData?
}

extension Data: GAPDataContainer {
    
    @usableFromInline
    static var maxCapacity: Int { return 512 }
    
    @usableFromInline
    mutating func append(_ value: GAPData) {
        value.append(to: &self)
    }
}

extension Data: GAPSliceContainer {
    
    @usableFromInline
    func decode(_ type: GAPData.Type) -> GAPData? {
        return type.init(data: self)
    }
}

extension LowEnergyAdvertisingData: GAPDataContainer {
    
    @usableFromInline
    mutating func append(_ value: GAPData) {
        value.append(to: &self)
    }
    
    @usableFromInline
    init(capacity: Int) {
        assert(capacity <= LowEnergyAdvertisingData.maxCapacity)
        self.init()
    }
    
    @usableFromInline
    static var maxCapacity: Int { return capacity }
    
    @usableFromInline
    func subdataNoCopy(in range: Range<Int>) -> Slice<LowEnergyAdvertisingData> {
        return self[range]
    }
}

extension Slice: GAPSliceContainer where Base == LowEnergyAdvertisingData {
    
    @usableFromInline
    init() {
        self.init(base: LowEnergyAdvertisingData(), bounds: 0 ..< 1)
    }
    
    @usableFromInline
    func decode(_ type: GAPData.Type) -> GAPData? {
        return type.init(data: self)
    }
}
