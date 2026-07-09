//
//  GATTAltitude.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/15/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Bluetooth

/// Altitude
///
/// The Altitude characteristic describes the altitude of the device.
///
/// - SeeAlso: [Altitude](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.altitude.xml)
@frozen
public struct GATTAltitude: RawRepresentable, GATTCharacteristic, Equatable, Hashable {

    internal static let length = MemoryLayout<UInt16>.size

    public static var uuid: BluetoothUUID { BluetoothUUID.Characteristic.altitude }

    public let rawValue: UInt16

    public init(rawValue: UInt16) {

        self.rawValue = rawValue
    }

    public init?<Data: DataContainer>(data: Data) {

        guard data.count == Self.length
        else { return nil }

        self.init(rawValue: UInt16(littleEndian: UInt16(bytes: (data[0], data[1]))))
    }

    public func append<Data: DataContainer>(to data: inout Data) {

        let bytes = rawValue.littleEndian.bytes
        data += bytes.0
        data += bytes.1
    }

    public var dataLength: Int {

        return Self.length
    }
}

extension GATTAltitude: CustomStringConvertible {

    public var description: String {

        return rawValue.description
    }
}

extension GATTAltitude: ExpressibleByIntegerLiteral {

    public init(integerLiteral value: UInt16) {

        self.init(rawValue: value)
    }
}
