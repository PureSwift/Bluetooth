//
//  GATTTimeWithDst.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 7/10/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation
import Bluetooth

/// Time with DST
///
/// - SeeAlso: [Time with DST](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.time_with_dst.xml)
@frozen
public struct GATTTimeWithDst: GATTCharacteristic, Equatable {

    internal static let length = GATTDateTime.length + GATTDstOffset.length

    public static var uuid: BluetoothUUID { BluetoothUUID.Characteristic.timeWithDst }

    public var datetime: GATTDateTime

    public var dstOffset: GATTDstOffset

    public init(datetime: GATTDateTime, dstOffset: GATTDstOffset) {

        self.datetime = datetime
        self.dstOffset = dstOffset
    }

    public init?<Data: DataContainer>(data: Data) {

        guard data.count == Self.length
        else { return nil }

        guard let datetime = GATTDateTime(data: data.subdata(in: (0..<GATTDateTime.length)))
        else { return nil }

        guard let dstOffset = GATTDstOffset(data: data.subdata(in: GATTDateTime.length..<GATTDateTime.length + GATTDstOffset.length))
        else { return nil }

        self.init(datetime: datetime, dstOffset: dstOffset)
    }

    public var data: Data {

        return datetime.data + dstOffset.data
    }
}
