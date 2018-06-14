//
//  GATTAlertCategory.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 Categories of alerts/messages.
 
 The value of the characteristic is an unsigned 8 bit integer that has a fixed point exponent of 0.
 The Alert Category ID characteristic defines the predefined categories of messages as an enumeration.
 
 - Example:
 
 The value 0x01 is interpreted as “Email”
 
 - SeeAlso: [New Alert](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.new_alert.xml)
 */
public enum GATTAlertCategory: UInt8, GATTCharacteristic {
    
    internal static let length = 1
    
    public static var uuid: BluetoothUUID { return .alertCategoryId }
    
    /// Simple Alert: General text alert or non-text alert
    case simpleAlert = 0
    
    /// Email: Alert when Email messages arrives
    case email
    
    /// News: News feeds such as RSS, Atom
    case news
    
    /// Call: Incoming call
    case call
    
    /// Missed call: Missed Call
    case missedCall
    
    /// SMS/MMS: SMS/MMS message arrives
    case sms
    
    /// Voice mail: Voice mail
    case voiceMail
    
    /// Schedule: Alert occurred on calendar, planner
    case schedule
    
    /// High Prioritized Alert: Alert that should be handled as high priority
    case highPrioritizedAlert
    
    /// Instant Message: Alert for incoming instant messages
    case instantMessage
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        self.init(rawValue: data[0])
    }
    
    public var data: Data {
        
        return Data([rawValue])
    }
    
}

extension GATTAlertCategory: Equatable {
    
    public static func == (lhs: GATTAlertCategory,
                           rhs: GATTAlertCategory) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}
