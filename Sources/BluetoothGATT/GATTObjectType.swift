//
//  GATTObjectType.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 7/11/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Bluetooth

/// Object Type
///
/// Description: Unspecified Object Type, 16-bit UUID: << Unspecified Object Type >>
///
/// - SeeAlso: [Object Type](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.object_type.xml)
@frozen
public struct GATTObjectType: Equatable, Hashable, RawRepresentable, GATTCharacteristic {

    internal static let length = MemoryLayout<UInt16>.size

    public static var uuid: BluetoothUUID { BluetoothUUID.Characteristic.objectType }

    public let rawValue: UInt16

    public init(rawValue: UInt16) {

        self.rawValue = rawValue
    }

    public init?<Data: DataContainer>(data: Data) {

        guard data.count == Self.length
        else { return nil }

        let rawValue = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))

        self.init(rawValue: rawValue)
    }

    public func append<Data: DataContainer>(to data: inout Data) {

        let bytes = rawValue.littleEndian.bytes

        data += [bytes.0, bytes.1]
    }

    public var dataLength: Int {

        return Self.length
    }
}

extension GATTObjectType: CustomStringConvertible {

    public var description: String {

        return BluetoothUUID.bit16(rawValue).description
    }
}
