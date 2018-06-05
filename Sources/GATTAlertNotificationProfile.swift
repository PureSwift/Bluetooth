//
//  AlertNotificationProfile.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/1/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
     Alert Notification service exposes:
 
     • The different types of alerts with the short text messages.
     • The information how many count of new alert messages.
     • The information how many count of unread alerts.
 
     The Alert Notification service exposes alert information in a device. This information includes the following:
 
     - Type of alert occuring in a device.
     - Additional text information such as caller ID or sender ID
     - Count of new alerts.
     - Count of unread alert items.
 */
public struct GATTAlertNotificationService: GATTProfileService {
    
    public static let UUID: BluetoothUUID = .supportedNewAlertCategory
    
}

/**
     Category that the server supports for new alert.
 
     This characteristic uses the Alert Category ID Bit Mask Characteristic. If bit(s) is/are set, it means the server supports the corresponded categories for new incoming alert.
 
     - Example
 
        The value 0x0a is interpreted that this server supports “Call” and “Email” categories.
 */
public struct GATTSupportedNewAlertCategoryCharacteristic: GATTProfileCharacteristic {
    
    public static var UUID: BluetoothUUID { return .supportedNewAlertCategory }
    
    public var alertCategoryBitMaskCharacteristic: GATTAlertCategoryIdBitMaskCharacteristic
    
    public init(alertCategoryBitMaskCharacteristic: GATTAlertCategoryIdBitMaskCharacteristic) {
        
        self.alertCategoryBitMaskCharacteristic = alertCategoryBitMaskCharacteristic
    }
    
    public init?(data: Data) {
        
        guard data.count == GATTAlertCategoryIdBitMaskCharacteristic.length
            else { return nil }
        
        guard let characteristic = GATTAlertCategoryIdBitMaskCharacteristic(data: data)
            else { return nil }
        
        self.init(alertCategoryBitMaskCharacteristic: characteristic)
    }
    
    public var data: Data {
        
        return Data([alertCategoryBitMaskCharacteristic.bitMask0.rawValue, alertCategoryBitMaskCharacteristic.bitMask1.rawValue])
    }
    
    public var characteristic: GATT.Characteristic {
        
        return GATT.Characteristic(uuid: type(of: self).UUID, value: data, permissions: [], properties: [.read], descriptors: [])
    }
    
}

extension GATTSupportedNewAlertCategoryCharacteristic: Equatable {
    
    public static func == (lhs: GATTSupportedNewAlertCategoryCharacteristic, rhs: GATTSupportedNewAlertCategoryCharacteristic) -> Bool {
        
        return lhs.alertCategoryBitMaskCharacteristic == rhs.alertCategoryBitMaskCharacteristic
    }
    
}

/**
     The value of the characteristic is a bit mask implemented as an array of unsigned 8 bit integers.
     The Alert Category ID Bit Mask characteristic defines one bit for each predefined category ID.
 
     - Example
 
        The value 0x03 is interpreted as “Simple Alert and Email bits set”
 */
public struct GATTAlertCategoryIdBitMaskCharacteristic: GATTProfileCharacteristic {
    
    internal static let length = 2
    
    public static var UUID: BluetoothUUID { return .alertCategoryIdBitMask }
    
    public var bitMask0: BitMaskOptionSet<BitMask0>
    
    public var bitMask1: BitMaskOptionSet<BitMask1>
    
    public init(bitMask0: BitMaskOptionSet<BitMask0>,
                bitMask1: BitMaskOptionSet<BitMask1>) {
        
        self.bitMask0 = bitMask0
        self.bitMask1 = bitMask1
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        self.init(bitMask0: BitMaskOptionSet<BitMask0>(rawValue: data[0]),
                  bitMask1: BitMaskOptionSet<BitMask1>(rawValue: data[1]))
    }
    
    public var data: Data {
        
        return Data([bitMask0.rawValue, bitMask1.rawValue])
    }
    
    public var characteristic: GATT.Characteristic {
        
        return GATT.Characteristic(uuid: type(of: self).UUID, value: data, permissions: [], properties: [], descriptors: [])
    }
    
    public enum BitMask0: UInt8, BitMaskOption {
        
        #if swift(>=3.2)
        #elseif swift(>=3.0)
        public typealias RawValue = UInt8
        #endif
        
        case simpleAlert = 0b01
        
        case email = 0b10
        
        case news = 0b100
        
        case call = 0b1000
        
        case missedCall = 0b10000
        
        case sms = 0b100000
        
        case voiceMail = 0b1000000
        
        case schedule = 0b10000000
        
        public static var all: Set<BitMask0> = [
            .simpleAlert,
            .email,
            .news,
            .call,
            .missedCall,
            .sms,
            .voiceMail,
            .schedule
        ]
        
    }
    
    public enum BitMask1: UInt8, BitMaskOption {
        
        #if swift(>=3.2)
        #elseif swift(>=3.0)
        public typealias RawValue = UInt8
        #endif
        
        case highPrioritized = 0b01
        
        case instantMessage = 0b10
        
        public static var all: Set<BitMask1> = [
            .highPrioritized,
            .instantMessage
        ]
        
    }
}

extension GATTAlertCategoryIdBitMaskCharacteristic: Equatable {
    
    public static func == (lhs: GATTAlertCategoryIdBitMaskCharacteristic, rhs: GATTAlertCategoryIdBitMaskCharacteristic) -> Bool {
        
        return lhs.bitMask0 == rhs.bitMask0 && lhs.bitMask1 == rhs.bitMask1
    }
    
}

/**
     This characteristic defines the category of the alert and how many new alerts of that category have occurred in the server device.
     Brief text information may also be included for the last alert in the category.
 
     This characteristic consists of “Category ID”, “uint8”, and “UTF-8 string” fields.
     The size of this characteristic is dynamic because of the variable length text (“UTF-8”) field.
     The minimum length of “UTF-8 string” is 0 octets and maximum length of “UTF-8 string” is 18 octets.
 
     - Example:
 
        The value 0x01, 0x04, 0x52, 0x69, 0x63, 0x68, 0x61, 0x72, 0x64 are interpreted that the server has 4 new email messages and the last message was sent by “Richard”.
 */
public struct GATTNewAlertCharacteristic: GATTProfileCharacteristic {
    
    internal static let minLength = 2
    
    public static var UUID: BluetoothUUID { return .newAlert }
    
    public var categoryID: GATTAlertCategoryIDCharacteristic
    
    public var numberOfNewAlerts: UInt8
    
    public var textStringInformation: Data
    
    public init(categoryID: GATTAlertCategoryIDCharacteristic, numberOfNewAlerts: UInt8, textStringInformation: Data) {
        
        self.categoryID = categoryID
        self.numberOfNewAlerts = numberOfNewAlerts
        self.textStringInformation = textStringInformation
    }
    
    public init?(data: Data) {
        
        guard data.count >= GATTNewAlertCharacteristic.minLength
            else { return nil }
        
        guard let categoryID = GATTAlertCategoryIDCharacteristic(rawValue: data[0])
            else { return nil }
        
        let numberOfNewAlerts = data[1]
        let textStringInformation = data.subdata(in: (2..<data.count))
        
        self.init(categoryID: categoryID, numberOfNewAlerts: numberOfNewAlerts, textStringInformation: textStringInformation)
    }
    
    public var data: Data {
        
        let data = Data([categoryID.rawValue, numberOfNewAlerts])
        return textStringInformation.reduce(data, { $0.0 + [$0.1] })
    }
    
    public var characteristic: GATT.Characteristic {
        
        return GATT.Characteristic(uuid: type(of: self).UUID, value: data, permissions: [.read, .write], properties: [.notify], descriptors: [])
    }
    
}

extension GATTNewAlertCharacteristic: Equatable {
    
    public static func == (lhs: GATTNewAlertCharacteristic, rhs: GATTNewAlertCharacteristic) -> Bool {
        
        return lhs.categoryID == rhs.categoryID &&
            lhs.numberOfNewAlerts == rhs.numberOfNewAlerts &&
            lhs.textStringInformation == rhs.textStringInformation
    }
    
}

/**
     Categories of alerts/messages.
 
     The value of the characteristic is an unsigned 8 bit integer that has a fixed point exponent of 0.
     The Alert Category ID characteristic defines the predefined categories of messages as an enumeration.
 
     - Example:
 
        The value 0x01 is interpreted as “Email”
 */
public enum GATTAlertCategoryIDCharacteristic: UInt8, GATTProfileCharacteristic {
    
    internal static let length = 1
    
    public static var UUID: BluetoothUUID { return .alertCategoryId }
    
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
    
    public var characteristic: GATT.Characteristic {
        
        return GATT.Characteristic(uuid: type(of: self).UUID, value: data, permissions: [], properties: [], descriptors: [])
    }
}

extension GATTAlertCategoryIDCharacteristic: Equatable {
    
    public static func == (lhs: GATTAlertCategoryIDCharacteristic, rhs: GATTAlertCategoryIDCharacteristic) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
    
}

/**
 Category that the server supports for unread alert.
 
 This characteristic uses the Alert Category ID Bit Mask Characteristic. If bit(s) is/are set, it means the server supports the corresponded categories for unread alert.
 
 - Example:
 The value 0x03 is interpreted that this server supports “Simple Alert” and “Email” categories for unread alert.
 */
public struct GATTSupportedUnreadAlertCategoryCharacteristic: GATTProfileCharacteristic {
    
    public static var UUID: BluetoothUUID { return .supportedUnreadAlertCategory }
    
    public var alertCategoryBitMaskCharacteristic: GATTAlertCategoryIdBitMaskCharacteristic
    
    public init(alertCategoryBitMaskCharacteristic: GATTAlertCategoryIdBitMaskCharacteristic) {
        
        self.alertCategoryBitMaskCharacteristic = alertCategoryBitMaskCharacteristic
    }
    
    public init?(data: Data) {
        
        guard data.count == GATTAlertCategoryIdBitMaskCharacteristic.length
            else { return nil }
        
        guard let characteristic = GATTAlertCategoryIdBitMaskCharacteristic(data: data)
            else { return nil }
        
        self.init(alertCategoryBitMaskCharacteristic: characteristic)
    }
    
    public var data: Data {
        
        return Data([alertCategoryBitMaskCharacteristic.bitMask0.rawValue, alertCategoryBitMaskCharacteristic.bitMask1.rawValue])
    }
    
    public var characteristic: GATT.Characteristic {
        
        return GATT.Characteristic(uuid: type(of: self).UUID, value: data, permissions: [], properties: [.read], descriptors: [])
    }
    
}

extension GATTSupportedUnreadAlertCategoryCharacteristic: Equatable {
    
    public static func == (lhs: GATTSupportedUnreadAlertCategoryCharacteristic, rhs: GATTSupportedUnreadAlertCategoryCharacteristic) -> Bool {
        
        return lhs.alertCategoryBitMaskCharacteristic == rhs.alertCategoryBitMaskCharacteristic
    }
    
}

/**
    This characteristic shows how many numbers of unread alerts exist in the specific category in the device.
    This characteristic consists of “Category ID” and “uint8” which shows the number of unread alerts/messages.
 
    - Example

        The value 0x01, 0x04 are interpreted that the server has 4 unread messages in Email category.
 */
public struct GATTUnreadAlertStatusCharacteristic: GATTProfileCharacteristic {
    
    internal static let length = 2
    
    public static var UUID: BluetoothUUID { return .unreadAlertStatus }
    
    public var categoryID: GATTAlertCategoryIDCharacteristic
    
    public var unreadCount: UInt8
    
    public init(categoryID: GATTAlertCategoryIDCharacteristic, unreadCount: UInt8) {
        
        self.categoryID = categoryID
        self.unreadCount = unreadCount
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        guard let categoryID = GATTAlertCategoryIDCharacteristic(rawValue: data[0])
            else { return nil }
        
        let unreadCount = data[1]
        
        self.init(categoryID: categoryID, unreadCount: unreadCount)
    }
    
    public var data: Data {
        
        return Data([categoryID.rawValue, unreadCount])
    }
    
    public var characteristic: GATT.Characteristic {
        
        return GATT.Characteristic(uuid: type(of: self).UUID, value: data, permissions: [], properties: [.notify], descriptors: [])
    }
    
}

extension GATTUnreadAlertStatusCharacteristic: Equatable {
    
    public static func == (lhs: GATTUnreadAlertStatusCharacteristic, rhs: GATTUnreadAlertStatusCharacteristic) -> Bool {
        
        return lhs.categoryID == rhs.categoryID && lhs.unreadCount == rhs.unreadCount
    }
    
}

/**
    Control point of the Alert Notification server. Client can write the command here to request the several functions toward the server.
 
    The 1st octet value of the characteristic is an unsigned 8 bit integer that has a fixed point exponent of 0. The 1st octet value expresses the command ID that defines the server’s actions.
 
    The 2nd octet value of the characteristic is an “Alert Category ID” format. This octet shows the target category that the command ID applies for.
 
    - Example:
 
        The data 0x02 0x01 interprets “Disable New Incoming Notification for Email Category”.
 */
public struct GATTAlertNotificationControlPointCharacteristic: GATTProfileCharacteristic {
    
    internal static let length = 2
    
    public static var UUID: BluetoothUUID { return .alertNotificationControlPoint }
    
    public var commandID: CommandID
    
    public var categoryID: GATTAlertCategoryIDCharacteristic
    
    public init(commandID: CommandID, categoryID: GATTAlertCategoryIDCharacteristic) {
        
        self.commandID = commandID
        self.categoryID = categoryID
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        guard let commandID = CommandID(rawValue: data[0])
            else { return nil }
        
        guard let categoryID = GATTAlertCategoryIDCharacteristic(rawValue: data[1])
            else { return nil }
        
        self.init(commandID: commandID, categoryID: categoryID)
    }
    
    public var data: Data {
        
        return Data([commandID.rawValue, categoryID.rawValue])
    }
    
    public var characteristic: GATT.Characteristic {
        
        return GATT.Characteristic(uuid: type(of: self).UUID, value: data, permissions: [], properties: [.notify], descriptors: [])
    }
    
    public enum CommandID: UInt8 {
        
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

extension GATTAlertNotificationControlPointCharacteristic: Equatable {
    
    public static func == (lhs: GATTAlertNotificationControlPointCharacteristic, rhs: GATTAlertNotificationControlPointCharacteristic) -> Bool {
        
        return lhs.commandID == rhs.commandID && lhs.categoryID == rhs.categoryID
    }
    
}
