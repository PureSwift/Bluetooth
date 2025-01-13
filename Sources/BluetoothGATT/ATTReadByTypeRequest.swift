//
//  ATTReadByTypeRequest.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Bluetooth

/// Read By Type Request
///
/// The *Read By Type Request* is used to obtain the values of attributes where the
/// attribute type is known but the handle is not known.
@frozen
public struct ATTReadByTypeRequest: ATTProtocolDataUnit, Equatable, Hashable, Sendable {

    public static var attributeOpcode: ATTOpcode { .readByTypeRequest }

    /// First requested handle number
    public var startHandle: UInt16

    /// Last requested handle number
    public var endHandle: UInt16

    /// 2 or 16 octet UUID
    public var attributeType: BluetoothUUID

    public init(
        startHandle: UInt16,
        endHandle: UInt16,
        attributeType: BluetoothUUID
    ) {
        assert(attributeType.dataLength != 4, "32-bit UUID not supported")
        self.startHandle = startHandle
        self.endHandle = endHandle
        self.attributeType = attributeType
    }
}

// MARK: - DataConvertible

extension ATTReadByTypeRequest: DataConvertible {

    public init?<Data: DataContainer>(data: Data) {

        guard let length = Length(rawValue: data.count),
            Self.validateOpcode(data)
        else { return nil }

        self.startHandle = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))
        self.endHandle = UInt16(littleEndian: UInt16(bytes: (data[3], data[4])))

        switch length {
        case .uuid16:
            let value = UInt16(littleEndian: UInt16(bytes: (data[5], data[6])))
            self.attributeType = .bit16(value)
        case .uuid128:
            self.attributeType = BluetoothUUID(littleEndian: BluetoothUUID(data: data.subdata(in: 5..<length.rawValue))!)
        }
    }

    public func append<Data>(to data: inout Data) where Data: DataContainer {
        data += Self.attributeOpcode.rawValue
        data += self.startHandle.littleEndian
        data += self.endHandle.littleEndian
        data += self.attributeType.littleEndian
    }

    public var dataLength: Int {
        length.rawValue
    }
}

// MARK: - Supporting Types

internal extension ATTReadByTypeRequest {

    enum Length: Int {

        case uuid16 = 7
        case uuid128 = 21
    }

    private var length: Length {
        switch attributeType {
        case .bit16:
            return .uuid16
        case .bit128:
            return .uuid128
        case .bit32:
            fatalError()  // Do not allow 32-bit UUID for Blueooth LE
        }
    }
}
