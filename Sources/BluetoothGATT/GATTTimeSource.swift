//
//  GATTTimeSource.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 7/6/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation
import Bluetooth

/// Time Source
///
/// - SeeAlso: [Time Source](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.time_source.xml)
@frozen
public enum GATTTimeSource: UInt8, GATTCharacteristic {

    internal static let length = MemoryLayout<UInt8>.size

    public static var uuid: BluetoothUUID { BluetoothUUID.Characteristic.timeSource }

    /// Unknown
    case unknown = 0

    /// Network Time Protocol
    case networkTimeProtocol = 1

    /// GPS
    case gps = 2

    /// Radio Time Signal
    case radioTimeSignal = 3

    /// Manual
    case manual = 4

    /// Atomic Clock
    case atomicClock = 5

    /// Cellular Network
    case cellularNetwork = 6

    public init?<Data: DataContainer>(data: Data) {

        guard data.count == Self.length
        else { return nil }

        self.init(rawValue: data[0])
    }

    public var data: Data {

        return Data([rawValue])
    }

}

extension GATTTimeSource: Equatable {

    public static func == (lhs: GATTTimeSource, rhs: GATTTimeSource) -> Bool {

        return lhs.rawValue == rhs.rawValue
    }
}

extension GATTTimeSource: CustomStringConvertible {

    public var description: String {

        return rawValue.description
    }

}
