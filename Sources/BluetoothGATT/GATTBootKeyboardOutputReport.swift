//
//  GATTBootKeyboardOutputReport.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/18/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation
import Bluetooth

/// Boot Keyboard Output Report
///
/// The Boot Keyboard Input Report characteristic is used to transfer fixed format and length Input Report data between a HID Host operating in Boot Protocol Mode and a HID Service corresponding to a boot keyboard.
///
/// [Boot Keyboard Output Report](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.boot_keyboard_output_report.xml)
@frozen
public struct GATTBootKeyboardOutputReport: RawRepresentable, GATTCharacteristic {

    internal static let length = MemoryLayout<UInt8>.size

    public static var uuid: BluetoothUUID { BluetoothUUID.Characteristic.bootKeyboardOutputReport }

    public var rawValue: UInt8

    public init(rawValue: UInt8) {

        self.rawValue = rawValue
    }

    public init?<Data: DataContainer>(data: Data) {

        guard data.count == Self.length
        else { return nil }

        self.init(rawValue: data[0])
    }

    public var data: Data {

        return Data([rawValue])
    }
}

extension GATTBootKeyboardOutputReport: Equatable {

    public static func == (lhs: GATTBootKeyboardOutputReport, rhs: GATTBootKeyboardOutputReport) -> Bool {

        return lhs.rawValue == rhs.rawValue
    }
}

extension GATTBootKeyboardOutputReport: CustomStringConvertible {

    public var description: String {

        return rawValue.description
    }
}

extension GATTBootKeyboardOutputReport: ExpressibleByIntegerLiteral {

    public init(integerLiteral value: UInt8) {

        self.init(rawValue: value)
    }
}
