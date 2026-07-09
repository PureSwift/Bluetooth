//
//  GATTDayDateTime.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 7/5/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Bluetooth

/// Day Date Time
///
/// - SeeAlso: [Day Date Time](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.day_date_time.xml)
@frozen
public struct GATTDayDateTime: GATTCharacteristic {

    internal static let length = GATTDateTime.length + GATTDayOfWeek.length

    public static var uuid: BluetoothUUID { BluetoothUUID.Characteristic.dayDateTime }

    public var dateTime: GATTDateTime

    public var dayOfWeek: GATTDayOfWeek

    public init(dateTime: GATTDateTime, dayOfWeek: GATTDayOfWeek) {

        self.dateTime = dateTime
        self.dayOfWeek = dayOfWeek
    }

    public init?<Data: DataContainer>(data: Data) {

        guard data.count == Self.length
        else { return nil }

        guard let dateTime = GATTDateTime(data: data.subdata(in: (0..<7)))
        else { return nil }

        guard let dayOfWeek = GATTDayOfWeek(data: data.subdata(in: (7..<8)))
        else { return nil }

        self.init(dateTime: dateTime, dayOfWeek: dayOfWeek)
    }

    public func append<Data: DataContainer>(to data: inout Data) {

        dateTime.append(to: &data)
        dayOfWeek.append(to: &data)
    }

    public var dataLength: Int {

        return Self.length
    }
}

extension GATTDayDateTime: Equatable {

    public static func == (lhs: GATTDayDateTime, rhs: GATTDayDateTime) -> Bool {

        return lhs.dateTime == rhs.dateTime && lhs.dayOfWeek == rhs.dayOfWeek
    }
}
