//
//  GATTAerobicThreshold.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation
import Bluetooth

/// Aerobic Threshold
///
/// First metabolic threshold.
///
/// - SeeAlso: [Aerobic Threshold](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.aerobic_threshold.xml)
@frozen
public struct GATTAerobicThreshold: GATTCharacteristic, Equatable, Hashable, Sendable {

    public typealias BeatsPerMinute = GATTBeatsPerMinute.Byte

    internal static let length = MemoryLayout<UInt8>.size

    public static var uuid: BluetoothUUID { BluetoothUUID.Characteristic.aerobicThreshold }

    public var beats: BeatsPerMinute

    public init(beats: BeatsPerMinute) {
        self.beats = beats
    }

    public init?<Data: DataContainer>(data: Data) {

        guard data.count == Self.length
        else { return nil }

        let beats = BeatsPerMinute(rawValue: data[0])

        self.init(beats: beats)
    }

    public func append<Data>(to data: inout Data) where Data: DataContainer {
        data.append(beats.rawValue)
    }
}

extension GATTAerobicThreshold: CustomStringConvertible {

    public var description: String {
        return beats.description
    }
}
