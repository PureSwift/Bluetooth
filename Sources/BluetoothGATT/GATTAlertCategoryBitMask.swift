//
//  GATTAlertCategoryBitMask.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Bluetooth

/// Alert Category ID Bit Mask
///
/// The value of the characteristic is a bit mask implemented as an array of unsigned 8 bit integers.
/// The Alert Category ID Bit Mask characteristic defines one bit for each predefined category ID.
///
/// - Example:
///
/// The value 0x03 is interpreted as “Simple Alert and Email bits set”
///
/// - SeeAlso: [Alert Category ID Bit Mask](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.alert_category_id_bit_mask.xml)
@frozen
public struct GATTAlertCategoryBitMask: GATTCharacteristic, Equatable, Hashable {

    public static var uuid: BluetoothUUID { BluetoothUUID.Characteristic.alertCategoryIdBitMask }

    /// This field shows the category of the new alert.
    public var categories: Category

    public init?<Data: DataContainer>(data: Data) {

        guard let bitmask = Category.RawValue(bitmaskArray: data)
        else { return nil }

        self.categories = Category(rawValue: bitmask)
    }

    public func append<Data: DataContainer>(to data: inout Data) {

        data.append(contentsOf: categories.rawValue.bitmaskArray)
    }

    public var dataLength: Int {

        return categories.rawValue.bitmaskArray.count
    }
}

public extension GATTAlertCategoryBitMask {

    struct Category: OptionSet, Hashable, Sendable, CaseIterable {

        public let rawValue: UInt64

        public init(rawValue: UInt64) {
            self.rawValue = rawValue
        }

        // 1st byte

        public static let simpleAlert = Category(rawValue: 0b01)

        public static let email = Category(rawValue: 0b10)

        public static let news = Category(rawValue: 0b100)

        public static let call = Category(rawValue: 0b1000)

        public static let missedCall = Category(rawValue: 0b10000)

        public static let sms = Category(rawValue: 0b100000)

        public static let voiceMail = Category(rawValue: 0b1000000)

        public static let schedule = Category(rawValue: 0b10000000)

        // 2nd byte

        public static let highPrioritized = Category(rawValue: 0b100000000)

        public static let instantMessage = Category(rawValue: 0b10_00000000)

        public static var allCases: [Category] {
            [
                .simpleAlert,
                .email,
                .news,
                .call,
                .missedCall,
                .sms,
                .voiceMail,
                .schedule,
                .highPrioritized,
                .instantMessage
            ]
        }
    }
}
