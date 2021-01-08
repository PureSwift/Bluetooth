//
//  GAPDataEncoder.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 8/25/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// GAP Data Decoder
@frozen
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
        do { return try Self.encode(encodables) }
        catch { fatalError("Unable to encode GAP Data: \(error)") }
    }
    
    public func encode(_ encodables: GAPData...) -> Data {
        return encode(encodables)
    }
    
    public func encodeAdvertisingData(_ encodables: [GAPData]) throws -> LowEnergyAdvertisingData {
        return try Self.encode(encodables)
    }
    
    @inline(__always)
    internal static func encode<S, DataType>(_ encodables: S) throws -> DataType where S: Sequence, S.Element == GAPData, DataType: GAPDataContainer {
        
        let dataLengths = encodables.map { $0.dataLength }
        let length = dataLengths.reduce(0, { $0 + $1 + 2 })
        guard length <= DataType.maxCapacity else {
            throw Error.invalidSize(length)
        }
        var data = DataType(capacity: length)
        for (index, encodable) in encodables.enumerated() {
            let length = dataLengths[index]
            encode(encodable, length: length, to: &data)
        }
        assert(data.count == length, "Invalid data length")
        return data
    }
    
    internal static func encode<T: GAPData>(_ value: T, to data: inout LowEnergyAdvertisingData) throws {
        let length = value.dataLength
        data += UInt8(length + 1)
        data += T.dataType.rawValue
        value.append(to: &data)
        guard data.count <= LowEnergyAdvertisingData.maxCapacity else {
            throw Error.invalidSize(data.count)
        }
    }
    
    internal static func encode<D: GAPDataContainer>(_ value: GAPData, length: Int, to data: inout D) {
        data += UInt8(length + 1)
        data += type(of: value).dataType.rawValue
        data.append(value)
    }
}

/// Generic specializations
public extension GAPDataEncoder {
    
    func encodeAdvertisingData<T: GAPData>(_ value: T) throws -> LowEnergyAdvertisingData {
        var data = LowEnergyAdvertisingData()
        try Self.encode(value, to: &data)
        return data
    }
    
    func encodeAdvertisingData<T0: GAPData, T1: GAPData>(_ value0: T0, _ value1: T1) throws -> LowEnergyAdvertisingData {
        var data = LowEnergyAdvertisingData()
        try Self.encode(value0, to: &data)
        try Self.encode(value1, to: &data)
        return data
    }
    
    func encodeAdvertisingData<T0: GAPData, T1: GAPData, T2: GAPData>(_ value0: T0, _ value1: T1, _ value2: T2) throws -> LowEnergyAdvertisingData {
        var data = LowEnergyAdvertisingData()
        try Self.encode(value0, to: &data)
        try Self.encode(value1, to: &data)
        try Self.encode(value2, to: &data)
        return data
    }
}

/// GAP Data Decoder
@frozen
public struct GAPDataDecoder {
    
    /// GAP Data Decoder Error
    public enum Error: Swift.Error {
        
        case insufficientBytes(expected: Int, actual: Int)
        case cannotDecode(GAPDataType, offset: Int)
        case unknownType(GAPDataType, offset: Int)
        case notFound(GAPDataType)
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
    internal func decode<T: GAPDataContainer>(data: T, reserveCapacity capacity: Int = 3) throws -> [GAPData] {
        
        guard data.isEmpty == false
            else { return [] }
        
        var elements = [GAPData]()
        elements.reserveCapacity(capacity)
        
        var offset = 0
        try Self.decode(data: data, offset: &offset) { (type, slice, offset) in
            if let gapType = dataTypes[type] {
                guard let decodable = slice._decode(gapType)
                    else { throw Error.cannotDecode(type, offset: offset) }
                elements.append(decodable)
                return true
            } else if ignoreUnknownType {
                return true
            } else {
                throw Error.unknownType(type, offset: offset)
            }
        }
        
        return elements
    }
    
    @usableFromInline
    internal static func decode<T: GAPDataContainer>(data: T, reserveCapacity capacity: Int = 3) throws -> [(GAPDataType, T.SliceContainer)] {
        
        guard data.isEmpty == false
            else { return [] }
        
        var elements = [(GAPDataType, T.SliceContainer)]()
        elements.reserveCapacity(capacity)
        
        var offset = 0
        try decode(data: data, offset: &offset) { (type, data, offset) in
            elements.append((type, data))
            return true
        }
        
        return elements
    }
    
    @usableFromInline
    internal static func decode<T: GAPDataContainer>(data: T, offset: inout Int, _ block: (GAPDataType, T.SliceContainer, Int) throws -> (Bool)) throws {
        
        while offset < data.count {
            
            // get length
            let length = Int(data[offset]) // 0
            offset += 1
            guard offset < data.count else {
                if length == 0 {
                    break // EOF
                } else {
                    throw Error.insufficientBytes(expected: offset + 1, actual: data.count)
                }
            }
            
            // get type
            let type = GAPDataType(rawValue: data[offset]) // 1
            
            // ignore zeroed bytes
            guard (type.rawValue == 0 && length == 0) == false
                else { break }
            
            // get value
            let slice: T.SliceContainer
            
            if length > 0 {
                let dataRange = offset + 1 ..< offset + length // 2 ..< 2 + length
                offset = dataRange.upperBound
                guard offset <= data.count
                    else { throw Error.insufficientBytes(expected: offset + 1, actual: data.count) }
                
                slice = data.subdataNoCopy(in: dataRange)
            } else {
                slice = T.SliceContainer()
            }
            
            // process and continue
            guard try block(type, slice, offset) else { return }
        }
    }
}

public extension GAPDataDecoder {
    
    internal static func decodeFirst<T: GAPData, DataType: GAPDataContainer>(_ type: T.Type, _ offset: inout Int, _ data: DataType) throws -> T? {
        
        var offset = 0
        var value: T?
        try Self.decode(data: data, offset: &offset) { (dataType, slice, offset) in
            guard dataType == T.dataType else { return true }
            value = slice.decode(type)
            guard value != nil else {
                throw Error.cannotDecode(dataType, offset: offset)
            }
            return false
        }
        return value
    }
    
    static func decodeFirst<T: GAPData>(_ type: T.Type, from data: LowEnergyAdvertisingData) throws -> T? {
        
        var offset = 0
        return try decodeFirst(type, &offset, data)
    }
    
    static func decodeFirst<T: GAPData>(_ type: T.Type, from data: Data) throws -> T? {
        
        var offset = 0
        return try decodeFirst(type, &offset, data)
    }
}

public extension GAPDataDecoder {
    
    static func decode<T: GAPData>(_ type: T.Type, from data: LowEnergyAdvertisingData) throws -> T {
        
        var offset = 0
        guard let value = try decodeFirst(type, &offset, data) else {
            throw Error.notFound(T.dataType)
        }
        return value
    }
    
    static func decode<T0: GAPData, T1: GAPData>(_ type0: T0.Type, _ type1: T1.Type, from data: LowEnergyAdvertisingData) throws -> (T0, T1) {
        
        var offset = 0
        guard let value0 = try decodeFirst(type0, &offset, data) else {
            throw Error.notFound(T0.dataType)
        }
        guard let value1 = try decodeFirst(type1, &offset, data) else {
            throw Error.notFound(T1.dataType)
        }
        return (value0, value1)
    }
    
    static func decode<T0: GAPData, T1: GAPData, T2: GAPData>(_ type0: T0.Type, _ type1: T1.Type, _ type2: T2.Type, from data: LowEnergyAdvertisingData) throws -> (T0, T1, T2) {
        
        var offset = 0
        guard let value0 = try decodeFirst(type0, &offset, data) else {
            throw Error.notFound(T0.dataType)
        }
        guard let value1 = try decodeFirst(type1, &offset, data) else {
            throw Error.notFound(T1.dataType)
        }
        guard let value2 = try decodeFirst(type2, &offset, data) else {
            throw Error.notFound(T2.dataType)
        }
        return (value0, value1, value2)
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
    func _decode(_ type: GAPData.Type) -> GAPData?
    
    func decode<T: GAPData>(_ type: T.Type) -> T?
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
    func _decode(_ type: GAPData.Type) -> GAPData? {
        return type.init(data: self)
    }
    
    @usableFromInline
    func decode<T: GAPData>(_ type: T.Type) -> T? {
        return T.init(data: self)
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
    func _decode(_ type: GAPData.Type) -> GAPData? {
        return type.init(data: self)
    }
    
    @usableFromInline
    func decode<T: GAPData>(_ type: T.Type) -> T? {
        return T.init(data: self)
    }
}
