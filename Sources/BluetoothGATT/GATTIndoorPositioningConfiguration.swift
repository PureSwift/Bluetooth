//
//  GATTIndoorPositioningConfiguration.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 7/2/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Bluetooth

/// Indoor Positioning Configuration
///
/// The Indoor Positioning Configuration describes the set of characteristic values included in the Indoor Positioning Service AD type.
///
/// - SeeAlso: [Indoor Positioning Configuration](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.indoor_positioning_configuration.xml)
@frozen
public struct GATTIndoorPositioningConfiguration: GATTCharacteristic {

    public static var uuid: BluetoothUUID { BluetoothUUID.Characteristic.indoorPositioningConfiguration }

    internal static let length = MemoryLayout<UInt8>.size

    public var configurations: Configuration

    public init(configurations: Configuration) {

        self.configurations = configurations
    }

    public init?<Data: DataContainer>(data: Data) {

        guard data.count == Self.length
        else { return nil }

        self.init(configurations: Configuration(rawValue: data[0]))
    }

    public func append<Data: DataContainer>(to data: inout Data) {

        data += configurations.rawValue
    }

    public var dataLength: Int {

        return Self.length
    }
}

extension GATTIndoorPositioningConfiguration {

    public struct Configuration: OptionSet, Hashable, Sendable, CaseIterable {

        public let rawValue: UInt8

        public init(rawValue: UInt8) {
            self.rawValue = rawValue
        }

        /// Presence of coordinates in advertising packets
        public static let coordinates = Configuration(rawValue: 0b01)

        /// Coordinate system used in advertising packets
        public static let coordinateSystemUsed = Configuration(rawValue: 0b10)

        /// Presence of Tx Power field in advertising packets
        public static let txPowerField = Configuration(rawValue: 0b100)

        /// Presence of Altitude field in advertising packets
        public static let altitudeField = Configuration(rawValue: 0b1000)

        /// Presence of Floor Number in advertising packets
        public static let floorNumber = Configuration(rawValue: 0b10000)

        //Location Name available in the GATT database
        public static let locationName = Configuration(rawValue: 0b100000)

        public static var allCases: [Configuration] {
            [
                .coordinates,
                .coordinateSystemUsed,
                .txPowerField,
                .altitudeField,
                .floorNumber,
                .locationName
            ]
        }
    }

}
