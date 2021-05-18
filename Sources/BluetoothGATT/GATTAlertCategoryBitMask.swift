//
//  GATTAlertCategoryBitMask.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 Alert Category ID Bit Mask
 
 The value of the characteristic is a bit mask implemented as an array of unsigned 8 bit integers.
 The Alert Category ID Bit Mask characteristic defines one bit for each predefined category ID.
 
 - Example:
 
 The value 0x03 is interpreted as “Simple Alert and Email bits set”
 
 - SeeAlso: [Alert Category ID Bit Mask](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.alert_category_id_bit_mask.xml)
 */
@frozen
public struct GATTAlertCategoryBitMask: GATTCharacteristic, Equatable, Hashable {
    
    public static var uuid: BluetoothUUID { return .alertCategoryIdBitMask }
    
    /// This field shows the category of the new alert.
    public var categories: BitMaskOptionSet<Category>
    
    public init?(data: Data) {
        
        guard let bitmask = Category.RawValue(bitmaskArray: data)
            else { return nil }
        
        self.categories = BitMaskOptionSet<Category>(rawValue: bitmask)
    }
    
    public var data: Data {
        
        return categories.rawValue.bitmaskArray
    }
}

public extension GATTAlertCategoryBitMask {
    
    enum Category: UInt64, BitMaskOption {
        
        // 1st byte
        
        case simpleAlert = 0b01
        
        case email = 0b10
        
        case news = 0b100
        
        case call = 0b1000
        
        case missedCall = 0b10000
        
        case sms = 0b100000
        
        case voiceMail = 0b1000000
        
        case schedule = 0b10000000
        
        // 2nd byte
        
        case highPrioritized = 0b100000000
        
        case instantMessage = 0b1000000000
        
        public static let allCases: [Category] = [
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
