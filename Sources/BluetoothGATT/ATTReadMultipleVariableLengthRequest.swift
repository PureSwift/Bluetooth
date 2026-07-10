//
//  ATTReadMultipleVariableLengthRequest.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 7/9/26.
//  Copyright © 2026 PureSwift. All rights reserved.
//

import Bluetooth

/// Read Multiple Variable Length Request
///
/// The *Read Multiple Variable Length Request* is used to request the server to read two or more values
/// of a set of attributes that have a variable or unknown value length and return their values in a
/// *Read Multiple Variable Length Response*.
@frozen
public struct ATTReadMultipleVariableLengthRequest: ATTProtocolDataUnit, Equatable, Hashable, Sendable {

    public static var attributeOpcode: ATTOpcode { .readMultipleVariableLengthRequest }

    /// The handles of the attributes to read.
    public let handles: [UInt16]

    public init?(handles: [UInt16]) {
        guard handles.count >= 2
        else { return nil }
        self.handles = handles
    }
}

// MARK: - DataConvertible

extension ATTReadMultipleVariableLengthRequest: DataConvertible {

    public init?<Data: DataContainer>(data: Data) {

        guard data.count >= 5,
            Self.validateOpcode(data)
        else { return nil }

        let handleCount = (data.count - 1) / 2

        guard (data.count - 1) % 2 == 0
        else { return nil }

        let handles = (0..<handleCount).map { index in
            let handleIndex = 1 + (index * 2)
            return UInt16(littleEndian: UInt16(bytes: (data[handleIndex], data[handleIndex + 1])))
        }

        self.init(handles: handles)
    }

    public func append<Data>(to data: inout Data) where Data: DataContainer {
        data += Self.attributeOpcode.rawValue
        for handle in handles {
            data += handle.littleEndian
        }
    }

    public var dataLength: Int {
        1 + (2 * handles.count)
    }
}
