//
//  ATTWriteRequest.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Bluetooth

/// Write Request
///
/// The *Write Request* is used to request the server to write the value of an attribute
/// and acknowledge that this has been achieved in a *Write Response*.
@frozen
public struct ATTWriteRequest<Value: DataContainer>: ATTProtocolDataUnit, Equatable, Hashable, Sendable {

    public static var attributeOpcode: ATTOpcode { .writeRequest }

    /// The handle of the attribute to be written.
    public var handle: UInt16

    /// The value to be written to the attribute.
    public var value: Value

    public init(
        handle: UInt16,
        value: Value
    ) {
        self.handle = handle
        self.value = value
    }
}

extension ATTWriteRequest: DataConvertible {

    public init?<Data: DataContainer>(data: Data) {

        guard data.count >= 3,
            Self.validateOpcode(data)
        else { return nil }

        self.handle = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))
        self.value = data.suffixCheckingBounds(from: 3)
    }

    public var dataLength: Int {
        return 3 + value.count
    }

    public func append<Data: DataContainer>(to data: inout Data) {
        data += Self.attributeOpcode.rawValue
        data += self.handle.littleEndian
        data += self.value
    }
}
