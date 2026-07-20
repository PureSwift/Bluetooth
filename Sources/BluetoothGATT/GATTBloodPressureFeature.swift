//
//  GATTBloodPressureFeature.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Bluetooth

/// Blood Pressure Feature
///
/// The Blood Pressure Feature characteristic is used to describe the supported features of the Blood Pressure Sensor.
///
/// - SeeAlso: [https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.blood_pressure_feature.xml]()
@frozen
public struct GATTBloodPressureFeature: GATTCharacteristic {

    public static var uuid: BluetoothUUID { BluetoothUUID.Characteristic.bloodPressureFeature }

    internal static let length = MemoryLayout<UInt16>.size

    public var features: Feature

    public init(features: Feature) {

        self.features = features
    }

    public init?<Data: DataContainer>(data: Data) {

        guard data.count >= Self.length
        else { return nil }

        let features = Feature(rawValue: UInt16(littleEndian: UInt16(bytes: (data[0], data[1]))))

        self.init(features: features)
    }

    public func append<Data: DataContainer>(to data: inout Data) {

        let bytes = features.rawValue.littleEndian.bytes

        data += bytes.0
        data += bytes.1
    }

    public var dataLength: Int {

        return Self.length
    }

    /// Blood Pressure Feature
    public struct Feature: OptionSet, Hashable, Sendable, CaseIterable {

        internal static let length = MemoryLayout<UInt16>.size

        public let rawValue: UInt16

        public init(rawValue: UInt16) {
            self.rawValue = rawValue
        }

        /// Body Movement Detection Support
        public static let bodyMovement = Feature(rawValue: 0b01)

        /// Cuff Fit Detection Support
        public static let cuttFit = Feature(rawValue: 0b10)

        /// Irregular Pulse Detection Support
        public static let irregularPulse = Feature(rawValue: 0b100)

        /// Pulse Rate Range Detection Support
        public static let pulseRateRage = Feature(rawValue: 0b1000)

        /// Measurement Position Detection Support
        public static let measurementPosition = Feature(rawValue: 0b10000)

        /// Multiple Bond Support
        public static let multipleBond = Feature(rawValue: 0b100000)

        public static var allCases: [Feature] {
            [
                .bodyMovement,
                .cuttFit,
                .irregularPulse,
                .pulseRateRage,
                .measurementPosition,
                .multipleBond
            ]
        }
    }
}
