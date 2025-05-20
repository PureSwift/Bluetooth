//
//  GATTBloodPressureFeature.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation
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

    public var data: Data {

        let bytes = features.rawValue.littleEndian.bytes

        return Data([bytes.0, bytes.1])
    }

    /// Blood Pressure Feature
    @OptionSet<UInt16>
    public struct Feature: Sendable {

        internal static let length = MemoryLayout<UInt16>.size
        private enum Options: UInt16 {
            /// Body Movement Detection Support
            case bodyMovement = 0b01
            
            /// Cuff Fit Detection Support
            case cuttFit = 0b10
            
            /// Irregular Pulse Detection Support
            case irregularPulse = 0b100
            
            /// Pulse Rate Range Detection Support
            case pulseRateRage = 0b1000
            
            /// Measurement Position Detection Support
            case measurementPosition = 0b10000
            
            /// Multiple Bond Support
            case multipleBond = 0b100000
        }
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
