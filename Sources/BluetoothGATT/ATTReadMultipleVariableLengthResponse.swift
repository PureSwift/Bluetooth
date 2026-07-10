//
//  ATTReadMultipleVariableLengthResponse.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 7/9/26.
//  Copyright © 2026 PureSwift. All rights reserved.
//

import Bluetooth

/// Read Multiple Variable Length Response
///
/// The *Read Multiple Variable Length Response* is sent in reply to a received
/// *Read Multiple Variable Length Request* and contains the values of the attributes that have been read.
///
/// Each value is preceded by its length, in the same order as the requested handles.
@frozen
public struct ATTReadMultipleVariableLengthResponse<Value: DataContainer>: ATTProtocolDataUnit, Equatable, Hashable, Sendable {

    public static var attributeOpcode: ATTOpcode { .readMultipleVariableLengthResponse }

    /// The values of the attributes that have been read, in the same order as the requested handles.
    public var values: [Value]

    public init(values: [Value]) {
        self.values = values
    }
}

// MARK: - DataConvertible

extension ATTReadMultipleVariableLengthResponse: DataConvertible {

    public init?<Data: DataContainer>(data: Data) {

        guard data.count >= 1,
            Self.validateOpcode(data)
        else { return nil }

        var values = [Value]()

        var offset = 1
        while offset < data.count {

            // Value_Length
            guard data.count >= offset + 2
            else { return nil }

            let length = Int(UInt16(littleEndian: UInt16(bytes: (data[offset], data[offset + 1]))))
            offset += 2

            // Value
            guard data.count >= offset + length
            else { return nil }

            if length > 0 {
                values.append(Value(data.subdata(in: offset..<offset + length)))
            } else {
                values.append(Value())
            }
            offset += length
        }

        self.init(values: values)
    }

    public func append<Data>(to data: inout Data) where Data: DataContainer {
        data += Self.attributeOpcode.rawValue
        for value in values {
            data += UInt16(value.count).littleEndian
            data += value
        }
    }

    public var dataLength: Int {
        1 + values.reduce(0) { $0 + 2 + $1.count }
    }
}
