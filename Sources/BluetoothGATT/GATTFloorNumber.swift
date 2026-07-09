//
//  GATTFloorNumber.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 7/4/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Bluetooth

/// Floor Number
///
/// The Floor Number characteristic describes in which floor the device is installed.
///
/// - SeeAlso: [Floor Number](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.floor_number.xml)
@frozen
public struct GATTFloorNumber: RawRepresentable, GATTCharacteristic {

    internal static let length = MemoryLayout<UInt8>.size

    public static var uuid: BluetoothUUID { BluetoothUUID.Characteristic.floorNumber }

    public let rawValue: UInt8

    public init(rawValue: UInt8) {

        self.rawValue = rawValue
    }

    public init?<Data: DataContainer>(data: Data) {

        guard data.count == Self.length
        else { return nil }

        self.init(rawValue: data[0])
    }

    public func append<Data: DataContainer>(to data: inout Data) {

        data += rawValue
    }

    public var dataLength: Int {

        return Self.length
    }
}

extension GATTFloorNumber: Equatable {

    public static func == (lhs: GATTFloorNumber, rhs: GATTFloorNumber) -> Bool {

        return lhs.rawValue == rhs.rawValue
    }
}

extension GATTFloorNumber: CustomStringConvertible {

    public var description: String {

        return rawValue.description
    }
}

extension GATTFloorNumber: ExpressibleByIntegerLiteral {

    public init(integerLiteral value: UInt8) {

        self.init(rawValue: value)
    }
}
