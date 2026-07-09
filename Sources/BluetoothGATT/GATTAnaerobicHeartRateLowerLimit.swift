//
//  GATTAnaerobicHeartRateLowerLimit.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/15/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Bluetooth

/// Anaerobic Heart Rate Lower Limit
///
/// Lower limit of the heart rate where the user enhances his anaerobic tolerance while exercising.
///
/// - SeeAlso: [Anaerobic Heart Rate Lower Limit](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.anaerobic_heart_rate_lower_limit.xml)
@frozen
public struct GATTAnaerobicHeartRateLowerLimit: GATTCharacteristic, Equatable, Hashable {

    public typealias BeatsPerMinute = GATTBeatsPerMinute.Byte

    internal static let length = MemoryLayout<UInt8>.size

    public static var uuid: BluetoothUUID { BluetoothUUID.Characteristic.anaerobicHeartRateLowerLimit }

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

    public func append<Data: DataContainer>(to data: inout Data) {

        data += beats.rawValue
    }

    public var dataLength: Int {

        return Self.length
    }

}

extension GATTAnaerobicHeartRateLowerLimit: CustomStringConvertible {

    public var description: String {

        return beats.description
    }
}
