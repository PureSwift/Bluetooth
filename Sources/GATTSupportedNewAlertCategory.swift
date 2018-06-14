//
//  GATTSupportedNewAlertCategory.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 Supported New Alert Category
 
 Category that the server supports for new alert.
 
 This characteristic uses the Alert Category ID Bit Mask Characteristic. If bit(s) is/are set, it means the server supports the corresponded categories for new incoming alert.
 
 • Example:
 
 The value 0x0a is interpreted that this server supports “Call” and “Email” categories.
 
 - SeeAlso: [Supported New Alert Category](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.supported_new_alert_category.xml)
 */
public struct GATTSupportedNewAlertCategory: GATTCharacteristic {
    
    public typealias Category = GATTAlertCategoryBitMask.Category
    
    public static var uuid: BluetoothUUID { return .supportedNewAlertCategory }
    
    public var categories: BitMaskOptionSet<Category>
    
    public init(categories: BitMaskOptionSet<Category> = []) {
        
        self.categories = categories
    }
    
    public init?(data: Data) {
        
        guard let bitmask = Category.RawValue(bitmaskArray: data)
            else { return nil }
        
        self.categories = BitMaskOptionSet<Category>(rawValue: bitmask)
    }
    
    public var data: Data {
        
        return categories.rawValue.bitmaskArray
    }
    
    public var characteristic: GATT.Characteristic {
        
        return GATT.Characteristic(uuid: type(of: self).uuid,
                                   value: data,
                                   permissions: [.read],
                                   properties: [.read],
                                   descriptors: [])
    }
}

extension GATTSupportedNewAlertCategory: Equatable {
    
    public static func == (lhs: GATTSupportedNewAlertCategory,
                           rhs: GATTSupportedNewAlertCategory) -> Bool {
        
        return lhs.categories == rhs.categories
    }
}
