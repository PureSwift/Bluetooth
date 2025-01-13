//
//  GATTSupportedUnreadAlertCategory.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation
import Bluetooth

/// Supported Unread Alert Category
///
/// Category that the server supports for unread alert.
///
/// This characteristic uses the Alert Category ID Bit Mask Characteristic. If bit(s) is/are set, it means the server supports the corresponded categories for unread alert.
///
/// - Example:
/// The value 0x03 is interpreted that this server supports “Simple Alert” and “Email” categories for unread alert.
///
/// - SeeAlso: [Supported Unread Alert Category](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.supported_unread_alert_category.xml)
@frozen
public struct GATTSupportedUnreadAlertCategory: GATTCharacteristic {

    public typealias Category = GATTAlertCategoryBitMask.Category

    public static var uuid: BluetoothUUID { BluetoothUUID.Characteristic.supportedUnreadAlertCategory }

    public var categories: BitMaskOptionSet<Category>

    public init(categories: BitMaskOptionSet<Category> = []) {

        self.categories = categories
    }

    public init?<Data: DataContainer>(data: Data) {

        guard let bitmask = Category.RawValue(bitmaskArray: data)
        else { return nil }

        self.categories = BitMaskOptionSet<Category>(rawValue: bitmask)
    }

    public var data: Data {

        return Data(categories.rawValue.bitmaskArray)
    }
}

extension GATTSupportedUnreadAlertCategory: Equatable {

    public static func == (
        lhs: GATTSupportedUnreadAlertCategory,
        rhs: GATTSupportedUnreadAlertCategory
    ) -> Bool {

        return lhs.categories == rhs.categories
    }
}
