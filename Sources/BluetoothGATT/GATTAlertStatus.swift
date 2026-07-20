//
//  GATTAlertStatus.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/15/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Bluetooth

/// Alert Status
///
/// The Alert Status characteristic defines the Status of alert.
///
/// Bit 0, meaning “Ringer State”
/// Bit 1, meaning “Vibrator State”
/// Bit 2, meaning "Display Alert Status"
///
/// - SeeAlso: [Alert Status](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.alert_status.xml)
@frozen
public struct GATTAlertStatus: GATTCharacteristic {

    internal static let length = MemoryLayout<UInt8>.size

    public static var uuid: BluetoothUUID { BluetoothUUID.Characteristic.alertStatus }

    public var states: State

    public init(states: State) {

        self.states = states
    }

    public init?<Data: DataContainer>(data: Data) {

        guard data.count == Self.length
        else { return nil }

        self.states = State(rawValue: data[0])
    }

    public func append<Data: DataContainer>(to data: inout Data) {

        data += states.rawValue
    }

    public var dataLength: Int {

        return Self.length
    }
}
extension GATTAlertStatus: Equatable {

    public static func == (
        lhs: GATTAlertStatus,
        rhs: GATTAlertStatus
    ) -> Bool {

        return lhs.states == rhs.states
    }
}

extension GATTAlertStatus: CustomStringConvertible {

    public var description: String {

        return states.rawValue.description
    }
}

extension GATTAlertStatus {

    public struct State: OptionSet, Hashable, Sendable, CaseIterable {

        public let rawValue: UInt8

        public init(rawValue: UInt8) {
            self.rawValue = rawValue
        }

        // Ringer state
        public static let ringer = State(rawValue: 0b01)

        // Vibrate state
        public static let vibrate = State(rawValue: 0b10)

        // Display Alert state
        public static let displayAlert = State(rawValue: 0b100)

        public static var allCases: [State] { [.ringer, .vibrate, .displayAlert] }
    }
}
