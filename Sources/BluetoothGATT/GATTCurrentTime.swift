//
//  GATTCurrentTime.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 7/10/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Bluetooth

/// Current Time
///
/// - SeeAlso: [Current Time](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.current_time.xml)
@frozen
public struct GATTCurrentTime: GATTCharacteristic, Equatable {

    internal static let length = GATTExactTime256.length + MemoryLayout<UInt8>.size

    public static var uuid: BluetoothUUID { BluetoothUUID.Characteristic.currentTime }

    public var exactTime: GATTExactTime256

    public var adjustReason: Flag

    public init(exactTime: GATTExactTime256, adjustReason: Flag) {

        self.exactTime = exactTime
        self.adjustReason = adjustReason
    }

    public init?<Data: DataContainer>(data: Data) {

        guard data.count == Self.length
        else { return nil }

        guard let exactTime = GATTExactTime256(data: data.subdata(in: (0..<GATTExactTime256.length)))
        else { return nil }

        let adjustReason = Flag(rawValue: data[GATTExactTime256.length])

        self.init(exactTime: exactTime, adjustReason: adjustReason)
    }

    public func append<Data: DataContainer>(to data: inout Data) {

        exactTime.append(to: &data)
        data += adjustReason.rawValue
    }

    public var dataLength: Int {

        return Self.length
    }
}

extension GATTCurrentTime {

    @frozen
    public struct Flag: OptionSet, Hashable, Sendable, CaseIterable {

        public let rawValue: UInt8

        public init(rawValue: UInt8) {
            self.rawValue = rawValue
        }

        /// Manual time update
        public static let manualTimeUpdate = Flag(rawValue: 0b01)

        /// External reference time update
        public static let externalReference = Flag(rawValue: 0b10)

        /// Change of time zone
        public static let timeZoneChange = Flag(rawValue: 0b100)

        /// Change of DST (daylight savings time)
        public static let dstChange = Flag(rawValue: 0b1000)

        public static var allCases: [Flag] {
            [
                .manualTimeUpdate,
                .externalReference,
                .timeZoneChange,
                .dstChange
            ]
        }
    }

}
