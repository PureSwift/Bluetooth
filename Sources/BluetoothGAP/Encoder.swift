//
//  GAPDataEncoder.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 8/25/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

#if canImport(Foundation)
import Foundation
#endif
import Bluetooth

/// GAP Data Encoder
public struct GAPDataEncoder<Data: DataContainer> {

    // MARK: - Methods

    #if !hasFeature(Embedded)
    public static func encode(_ encodables: [GAPData]) -> Data {
        let dataLengths = encodables.map { $0.dataLength }
        let length = dataLengths.reduce(0, { $0 + $1 + 2 })
        var data = Data()
        data.reserveCapacity(length)
        for (index, encodable) in encodables.enumerated() {
            let length = dataLengths[index]
            Self.encode(encodable, length: length, to: &data)
        }
        assert(data.count == length, "Invalid data length")
        return data
    }
    #endif

    internal static func encode<T>(
        _ value: T,
        length: Int? = nil,
        to data: inout Data
    ) where T: GAPData {
        let length = length ?? value.dataLength  // try to use precalculated length
        data += UInt8(length + 1)
        data += T.dataType.rawValue
        value.append(to: &data)
    }
}

// Generic specializations

public extension GAPDataEncoder {

    static func encode<T: GAPData>(_ value: T) -> Data {
        var data = Data()
        data.reserveCapacity(value.dataLength + 2)
        Self.encode(value, to: &data)
        return data
    }

    static func encode<T0: GAPData, T1: GAPData>(_ value0: T0, _ value1: T1) -> Data {
        var data = Data()
        let length =
            value0.dataLength
            + value1.dataLength
            + (2 * 2)
        data.reserveCapacity(length)
        Self.encode(value0, to: &data)
        Self.encode(value1, to: &data)
        return data
    }

    static func encode<T0: GAPData, T1: GAPData, T2: GAPData>(_ value0: T0, _ value1: T1, _ value2: T2) -> Data {
        var data = Data()
        let length =
            value0.dataLength
            + value1.dataLength
            + value2.dataLength
            + (2 * 3)
        data.reserveCapacity(length)
        Self.encode(value0, to: &data)
        Self.encode(value1, to: &data)
        Self.encode(value2, to: &data)
        return data
    }

    static func encode<T0: GAPData, T1: GAPData, T2: GAPData, T3: GAPData>(_ value0: T0, _ value1: T1, _ value2: T2, _ value3: T3) -> Data {
        var data = Data()
        let length =
            value0.dataLength
            + value1.dataLength
            + value2.dataLength
            + value3.dataLength
            + (2 * 4)
        data.reserveCapacity(length)
        Self.encode(value0, to: &data)
        Self.encode(value1, to: &data)
        Self.encode(value2, to: &data)
        Self.encode(value3, to: &data)
        return data
    }
}
