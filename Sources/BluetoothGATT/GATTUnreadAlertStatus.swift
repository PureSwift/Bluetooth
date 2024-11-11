//
//  GATTUnreadAlertStatus.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation
import Bluetooth

/**
 Unread Alert Status
 
 This characteristic shows how many numbers of unread alerts exist in the specific category in the device.
 This characteristic consists of “Category ID” and “uint8” which shows the number of unread alerts/messages.
 
 • Example:
 
 The value `0x01, 0x04` are interpreted that the server has 4 unread messages in Email category.
 
 - SeeAlso: [Unread Alert Status](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.unread_alert_status.xml)
 */
@frozen
public struct GATTUnreadAlertStatus: GATTCharacteristic {
    
    internal static let length = 2
    
    public static var uuid: BluetoothUUID { return .unreadAlertStatus }
    
    /// Category ID.
    public var category: GATTAlertCategory
    
    /// the number of unread alerts/messages.
    public var unreadCount: UInt8
    
    public init(category: GATTAlertCategory,
                unreadCount: UInt8) {
        
        self.category = category
        self.unreadCount = unreadCount
    }
    
    public init?<Data: DataContainer>(data: Data) {
        
        guard data.count == Self.length
            else { return nil }
        
        guard let category = GATTAlertCategory(rawValue: data[0])
            else { return nil }
        
        let unreadCount = data[1]
        
        self.init(category: category, unreadCount: unreadCount)
    }
    
    public var data: Data {
        
        return Data([category.rawValue, unreadCount])
    }
}
