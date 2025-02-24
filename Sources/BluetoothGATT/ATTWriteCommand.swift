//
//  ATTWriteCommand.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Bluetooth

/// Write Command
///
/// The *Write Command* is used to request the server to write the value of an attribute, typically into a control-point attribute.
@frozen
public struct ATTWriteCommand<Value: DataContainer>: ATTProtocolDataUnit, Equatable, Hashable, Sendable {

    public static var attributeOpcode: ATTOpcode { .writeCommand }

    /// The handle of the attribute to be set.
    public var handle: UInt16

    /// The value of be written to the attribute.
    public var value: Value

    public init(
        handle: UInt16,
        value: Value
    ) {
        self.handle = handle
        self.value = value
    }
}

// MARK: - DataConvertible

extension ATTWriteCommand: DataConvertible {

    public init?<Data: DataContainer>(data: Data) {

        guard data.count >= 3,
            Self.validateOpcode(data)
        else { return nil }

        self.handle = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))
        self.value = data.suffixCheckingBounds(from: 3)
    }

    public func append<Data>(to data: inout Data) where Data: DataContainer {
        data += Self.attributeOpcode.rawValue
        data += self.handle.littleEndian
        data += self.value
    }

    public var dataLength: Int {
        return 3 + value.count
    }
}
