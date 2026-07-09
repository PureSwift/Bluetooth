//
//  GATTBatteryLevel.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Bluetooth

/// Battery Level
///
/// The current charge level of a battery. 100% represents fully charged while 0% represents fully discharged.
///
/// - SeeAlso: [Battery Level](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.battery_level.xml)
@frozen
public struct GATTBatteryLevel: GATTCharacteristic, Equatable, Hashable {

    public typealias Percentage = GATTBatteryPercentage

    internal static let length = 1

    public static var uuid: BluetoothUUID { BluetoothUUID.Characteristic.batteryLevel }

    public var level: Percentage

    public init(level: Percentage) {

        self.level = level
    }
}

public extension GATTBatteryLevel {

    init?<Data: DataContainer>(data: Data) {

        guard data.count == Self.length
        else { return nil }

        guard let level = Percentage(rawValue: data[0])
        else { return nil }

        self.init(level: level)
    }

    func append<Data: DataContainer>(to data: inout Data) {

        data += level.rawValue
    }

    var dataLength: Int {

        return Self.length
    }
}

// MARK: - CustomStringConvertible

extension GATTBatteryLevel: CustomStringConvertible {

    public var description: String {

        return level.description
    }
}
