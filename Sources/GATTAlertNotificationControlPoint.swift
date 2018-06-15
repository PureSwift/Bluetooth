//
//  GATTAlertNotificationControlPoint.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 Alert Notification Control Point
 
 Control point of the Alert Notification server. Client can write the command here to request the several functions toward the server.
 
 The 1st octet value of the characteristic is an unsigned 8 bit integer that has a fixed point exponent of 0. The 1st octet value expresses the command ID that defines the server’s actions.
 
 The 2nd octet value of the characteristic is an “Alert Category ID” format. This octet shows the target category that the command ID applies for.
 
 • Example:
 
 The data 0x02 0x01 interprets “Disable New Incoming Notification for Email Category”.
 
 - SeeAlso: [Alert Notification Control Point](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.alert_notification_control_point.xml)
 */
public struct GATTAlertNotificationControlPoint: GATTCharacteristic {
    
    internal static let length = 2
    
    public static var uuid: BluetoothUUID { return .alertNotificationControlPoint }
    
    /// Command ID
    ///
    /// The command ID that defines the server’s actions.
    public var command: Command
    
    /// Category ID
    ///
    /// The target category that the command ID applies for.
    public var category: GATTAlertCategory
    
    public init(command: Command,
                category: GATTAlertCategory) {
        
        self.command = command
        self.category = category
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        guard let command = Command(rawValue: data[0])
            else { return nil }
        
        guard let category = GATTAlertCategory(rawValue: data[1])
            else { return nil }
        
        self.init(command: command, category: category)
    }
    
    public var data: Data {
        
        return Data([command.rawValue, category.rawValue])
    }
    
    public var characteristic: GATT.Characteristic {
        
        return GATT.Characteristic(uuid: type(of: self).uuid,
                                   value: data,
                                   permissions: [.read],
                                   properties: [.notify],
                                   descriptors: [])
    }
}

public extension GATTAlertNotificationControlPoint {
    
    public enum Command: UInt8 {
        
        /// Enable New Incoming Alert Notification
        case enableNewIncomingAlertNotification
        
        /// Enable Unread Category Status Notification
        case enableUnreadCategoryStatusNotification
        
        /// Disable New Incoming Alert Notification
        case disableNewIncomingAlertNotification
        
        /// Disable Unread Category Status Notification
        case disableUnreadCategoryStatusNotification
        
        /// Notify New Incoming Alert immediately
        case notifyNewIncomingAlertImmediately
        
        /// Notify Unread Category Status immediately
        case notifyUnreadCategoryStatusImmediately
    }
}

extension GATTAlertNotificationControlPoint: Equatable {
    
    public static func == (lhs: GATTAlertNotificationControlPoint,
                           rhs: GATTAlertNotificationControlPoint) -> Bool {
        
        return lhs.command == rhs.command
            && lhs.category == rhs.category
    }
}
