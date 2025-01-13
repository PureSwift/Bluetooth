//
//  GATTScanRefresh.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 7/11/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation
import Bluetooth

/// Scan Refresh
///
/// The Scan Refresh characteristic is used to notify the Client that the Server requires the Scan Interval Window characteristic to be written with the latest values upon notification.
///
/// - SeeAlso: [Scan Refresh](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.scan_refresh.xml)
@frozen
public enum GATTScanRefresh: UInt8, GATTCharacteristic {

    internal static let length = MemoryLayout<UInt8>.size

    public static var uuid: BluetoothUUID { BluetoothUUID.Characteristic.scanRefresh }

    case serverRequiredRefresh = 0

    public init?<Data: DataContainer>(data: Data) {

        guard data.count == Self.length
        else { return nil }

        self.init(rawValue: data[0])
    }

    public var data: Data {

        return Data([rawValue])
    }

}

extension GATTScanRefresh: CustomStringConvertible {

    public var description: String {

        return rawValue.description
    }
}
