//
//  GATTFirmwareRevisionString.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/21/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation
import Bluetooth

/*+
 Firmware Revision String

 [Firmware Revision String](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.firmware_revision_string.xml)

 The value of this characteristic is a UTF-8 string representing the firmware revision for the firmware within the device.
 */
@frozen
public struct GATTFirmwareRevisionString: RawRepresentable, GATTCharacteristic, Equatable, Hashable, Sendable {

    public static var uuid: BluetoothUUID { BluetoothUUID.Characteristic.firmwareRevisionString }

    public let rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }

    public init?<Data: DataContainer>(data: Data) {

        guard let rawValue = String(utf8: data)
        else { return nil }

        self.init(rawValue: rawValue)
    }

    public func append<Data>(to data: inout Data) where Data: DataContainer {
        data += rawValue.utf8
    }
}

extension GATTFirmwareRevisionString: CustomStringConvertible {

    public var description: String {
        return rawValue
    }
}

extension GATTFirmwareRevisionString: ExpressibleByStringLiteral {

    public init(stringLiteral value: String) {
        self.init(rawValue: value)
    }
}
