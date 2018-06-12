//
//  GATTCharacteristic.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/10/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// Battery Level
///
/// The current charge level of a battery. 100% represents fully charged while 0% represents fully discharged.
///
/// - SeeAlso: [Battery Level](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.battery_level.xml)
public struct GATTBatteryLevel: GATTProfileCharacteristic {
    
    internal static let max = GATTBatteryLevel(100)
    
    internal static let min = GATTBatteryLevel(0)
    
    internal static let length = 1
    
    public static var uuid: BluetoothUUID { return .batteryLevel }
    
    public static var unit: UnitIdentifier { return .percentage }
    
    public var level: UInt8
    
    public init?(level: UInt8) {
        
        guard GATTBatteryLevel.min.level <= level,
            GATTBatteryLevel.max.level >= level
            else { return nil }
        
        self.level = level
    }
    
    fileprivate init(_ unsafe: UInt8) {
        
        self.level = unsafe
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        self.init(level: data[0])
    }
    
    public var data: Data {
        
        return Data([level])
    }
    
    public var characteristic: GATT.Characteristic {
        
        return GATT.Characteristic(uuid: type(of: self).uuid,
                                   value: data,
                                   permissions: [.read],
                                   properties: [.read, .notify],
                                   descriptors: [GATTClientCharacteristicConfiguration().descriptor])
    }
}

extension GATTBatteryLevel: Equatable {
    
    public static func == (lhs: GATTBatteryLevel, rhs: GATTBatteryLevel) -> Bool {
        
        return lhs.level == rhs.level
    }
}

extension GATTBatteryLevel: CustomStringConvertible {
    
    public var description: String {
        
        return "\(level)%"
    }
}

extension GATTBatteryLevel: Hashable {
    
    public var hashValue: Int {
        
        return Int(level)
    }
}

public struct GATTDateTime: GATTProfileCharacteristic {
    
    public static var uuid: BluetoothUUID { return .dateTime }
    
    internal static let length = 7
    
    public var year: Year
    
    public var month: Month
    
    public var day: Day
    
    public var hour: Hour
    
    public var minutes: Minute
    
    public var seconds: Second
    
    public init(year: Year, month: Month, day: Day, hour: Hour, minutes: Minute, seconds: Second) {
        
        self.year = year
        self.month = month
        self.day = day
        self.hour = hour
        self.minutes = minutes
        self.seconds = seconds
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        guard let year = Year(rawValue: UInt16(littleEndian: UInt16(bytes: (data[0], data[1]))))
            else {return nil }
        
        guard let month = Month(rawValue: data[2])
            else { return nil }
        
        guard let day = Day(rawValue: data[3])
            else { return nil }
        
        guard let hour = Hour(rawValue: data[4])
            else { return nil }
        
        guard let minutes = Minute(rawValue: data[5])
            else { return nil }
        
        guard let seconds = Second(rawValue: data[6])
            else { return nil }
        
        self.init(year: year, month: month, day: day, hour: hour, minutes: minutes, seconds: seconds)
    }
    
    public var data: Data {
        
        let yearBytes = year.rawValue.littleEndian.bytes
        
        return Data([yearBytes.0, yearBytes.1, month.rawValue, day.rawValue, hour.rawValue, minutes.rawValue, seconds.rawValue])
    }
}

public extension GATTDateTime {
    
    public struct Year: BluetoothUnit {
        
        internal static let length = MemoryLayout<UInt16>.size
        
        public static var unitType: UnitIdentifier { return .year }
        
        public var value: UInt16
        
        public init?(data: Data) {
            
            guard data.count == type(of: self).length
                else { return nil }
            
            let value = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
            
            self.init(rawValue: value)
        }
        
        public init?(rawValue value: UInt16) {
            
            self.value = value
        }
        
        fileprivate init(unsafe value: UInt16) {
            
            self.value = value
        }
        
        public var rawValue: UInt16 {
            
            return value
        }
        
        public var data: Data {
            
            let bytes = value.littleEndian.bytes
            
            return Data([bytes.0, bytes.1])
        }
    }
}

extension GATTDateTime.Year: Equatable {
    
    public static func == (lhs: GATTDateTime.Year, rhs: GATTDateTime.Year) -> Bool {
        
        return lhs.value == rhs.value
    }
}

extension GATTDateTime.Year: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt16) {
        
        self.init(unsafe: value)
    }
    
}

extension GATTDateTime.Year: CustomStringConvertible {
    
    public var description: String {
        
        return value.description
    }
}

public extension GATTDateTime {
    
    public enum Month: UInt8, BluetoothUnit {
        
        internal static let length = MemoryLayout<UInt16>.size
        
        public static var unitType: UnitIdentifier { return .month }
        
        case unknown = 0
        
        case january
        
        case february
        
        case march
        
        case april
        
        case may
        
        case june
        
        case july
        
        case august
        
        case september
        
        case october
        
        case november
        
        case december
        
        public init?(data: Data) {
            
            guard data.count == type(of: self).length
                else { return nil }
            
            self.init(rawValue: data[0])
        }
        
        public var data: Data {
            
            return Data([self.rawValue])
        }
    }
}

extension GATTDateTime.Month: Equatable {
    
    public static func == (lhs: GATTDateTime.Month, rhs: GATTDateTime.Month) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

extension GATTDateTime.Month: CustomStringConvertible {
    
    public var description: String {
        
        return rawValue.description
    }
}

public extension GATTDateTime {
    
    public struct Day: BluetoothUnit {
        
        internal static let length = MemoryLayout<UInt8>.size
        
        public static var unitType: UnitIdentifier { return .hour }
        
        public var value: UInt8
        
        public init?(rawValue value: UInt8) {
            
            self.value = value
        }
        
        public init?(data: Data) {
            
            guard data.count == type(of: self).length
                else { return nil }
            
            self.init(rawValue: data[0])
        }
        
        fileprivate init(unsafe value: UInt8) {
            
            self.value = value
        }
        
        public var rawValue: UInt8 {
            
            return value
        }
        
        public var data: Data {
            
            return Data([value])
        }
    }
}

extension GATTDateTime.Day: Equatable {
    
    public static func == (lhs: GATTDateTime.Day, rhs: GATTDateTime.Day) -> Bool {
        
        return lhs.value == rhs.value
    }
}

extension GATTDateTime.Day: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt8) {
        
        self.init(unsafe: value)
    }
}

extension GATTDateTime.Day: CustomStringConvertible {
    
    public var description: String {
        
        return value.description
    }
}

public extension GATTDateTime {
    
    public struct Hour: BluetoothUnit {
        
        internal static let length = MemoryLayout<UInt8>.size
        
        public static var unitType: UnitIdentifier { return .hour }
        
        public var value: UInt8
        
        public init?(rawValue value: UInt8) {
            
            self.value = value
        }
        
        public init?(data: Data) {
            
            guard data.count == type(of: self).length
                else { return nil }
            
            self.init(rawValue: data[0])
        }
        
        fileprivate init(unsafe value: UInt8) {
            
            self.value = value
        }
        
        public var rawValue: UInt8 {
            
            return value
        }
        
        public var data: Data {
            
            return Data([value])
        }
    }
}

extension GATTDateTime.Hour: Equatable {
    
    public static func == (lhs: GATTDateTime.Hour, rhs: GATTDateTime.Hour) -> Bool {
        
        return lhs.value == rhs.value
    }
    
}

extension GATTDateTime.Hour: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt8) {
        
        self.init(unsafe: value)
    }
    
}

extension GATTDateTime.Hour: CustomStringConvertible {
    
    public var description: String {
        
        return value.description
    }
}

public extension GATTDateTime {
    
    public struct Minute: BluetoothUnit {
        
        internal static let length = MemoryLayout<UInt8>.size
        
        public static var unitType: UnitIdentifier { return .hour }
        
        public var value: UInt8
        
        public init?(rawValue value: UInt8) {
            
            self.value = value
        }
        
        public init?(data: Data) {
            
            guard data.count == type(of: self).length
                else { return nil }
            
            self.init(rawValue: data[0])
        }
        
        fileprivate init(unsafe value: UInt8) {
            
            self.value = value
        }
        
        public var rawValue: UInt8 {
            
            return value
        }
        
        public var data: Data {
            
            return Data([value])
        }
    }
}

extension GATTDateTime.Minute: Equatable {
    
    public static func == (lhs: GATTDateTime.Minute, rhs: GATTDateTime.Minute) -> Bool {
        
        return lhs.value == rhs.value
    }
    
}

extension GATTDateTime.Minute: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt8) {
        
        self.init(unsafe: value)
    }
    
}

extension GATTDateTime.Minute: CustomStringConvertible {
    
    public var description: String {
        
        return value.description
    }
}

public extension GATTDateTime {
    
    public struct Second: BluetoothUnit {
        
        internal static let length = MemoryLayout<UInt8>.size
        
        public static var unitType: UnitIdentifier { return .hour }
        
        public var value: UInt8
        
        public init?(rawValue value: UInt8) {
            
            self.value = value
        }
        
        public init?(data: Data) {
            
            guard data.count == type(of: self).length
                else { return nil }
            
            self.init(rawValue: data[0])
        }
        
        fileprivate init(unsafe value: UInt8) {
            
            self.value = value
        }
        
        public var rawValue: UInt8 {
            
            return value
        }
        
        public var data: Data {
            
            return Data([value])
        }
    }
}

extension GATTDateTime.Second: Equatable {
    
    public static func == (lhs: GATTDateTime.Second, rhs: GATTDateTime.Second) -> Bool {
        
        return lhs.value == rhs.value
    }
    
}

extension GATTDateTime.Second: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt8) {
        
        self.init(unsafe: value)
    }
    
}

extension GATTDateTime.Second: CustomStringConvertible {
    
    public var description: String {
        
        return value.description
    }
}

/**
 
 Supported New Alert Category
 
 Category that the server supports for new alert.
 
 This characteristic uses the Alert Category ID Bit Mask Characteristic. If bit(s) is/are set, it means the server supports the corresponded categories for new incoming alert.
 
 • Example:
 
 The value 0x0a is interpreted that this server supports “Call” and “Email” categories.
 
 - SeeAlso: [Supported New Alert Category](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.supported_new_alert_category.xml)
 */
public struct GATTSupportedNewAlertCategory: GATTProfileCharacteristic {
    
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

/**
 Alert Category ID Bit Mask
 
 The value of the characteristic is a bit mask implemented as an array of unsigned 8 bit integers.
 The Alert Category ID Bit Mask characteristic defines one bit for each predefined category ID.
 
 - Example:
 
 The value 0x03 is interpreted as “Simple Alert and Email bits set”
 
 - SeeAlso: [Alert Category ID Bit Mask](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.alert_category_id_bit_mask.xml)
 */
public struct GATTAlertCategoryBitMask: GATTProfileCharacteristic {
    
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
    
    public enum Category: UInt64, BitMaskOption {
        
        #if swift(>=3.2)
        #elseif swift(>=3.0)
        public typealias RawValue = UInt64
        #endif
        
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
        
        public static var all: Set<Category> = [
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

extension GATTAlertCategoryBitMask: Equatable {
    
    public static func == (lhs: GATTAlertCategoryBitMask,
                           rhs: GATTAlertCategoryBitMask) -> Bool {
        
        return lhs.categories == rhs.categories
    }
}

/**
 Categories of alerts/messages.
 
 The value of the characteristic is an unsigned 8 bit integer that has a fixed point exponent of 0.
 The Alert Category ID characteristic defines the predefined categories of messages as an enumeration.
 
 - Example:
 
 The value 0x01 is interpreted as “Email”
 
 - SeeAlso: [New Alert](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.new_alert.xml)
 */
public enum GATTAlertCategory: UInt8, GATTProfileCharacteristic {
    
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

/**
 New Alert
 
 This characteristic defines the category of the alert and how many new alerts of that category have occurred in the server device.
 Brief text information may also be included for the last alert in the category.
 
 This characteristic consists of “Category ID”, “uint8”, and “UTF-8 string” fields.
 The size of this characteristic is dynamic because of the variable length text (“UTF-8”) field.
 The minimum length of “UTF-8 string” is 0 octets and maximum length of “UTF-8 string” is 18 octets.
 
 • Example:
 
 The value `0x01, 0x04, 0x52, 0x69, 0x63, 0x68, 0x61, 0x72, 0x64` are interpreted that the server has 4 new email messages and the last message was sent by “Richard”.
 */
public struct GATTNewAlert: GATTProfileCharacteristic {
    
    internal static let minLength = 2
    
    public static var uuid: BluetoothUUID { return .newAlert }
    
    /// Alert category.
    public var category: GATTAlertCategory
    
    /// Number of new alerts.
    public var newAlertsCount: UInt8
    
    /// Alert textual information.
    public var information: Information
    
    public init(category: GATTAlertCategory,
                newAlertsCount: UInt8,
                information: Information) {
        
        self.category = category
        self.newAlertsCount = newAlertsCount
        self.information = information
    }
    
    public init?(data: Data) {
        
        guard data.count >= type(of: self).minLength
            else { return nil }
        
        guard let categoryID = GATTAlertCategory(rawValue: data[0])
            else { return nil }
        
        let numberOfNewAlerts = data[1]
        let textStringInformationData = data.subdata(in: (2 ..< data.count))
        
        guard let information = Information(data: textStringInformationData)
            else { return nil }
        
        self.init(category: categoryID,
                  newAlertsCount: numberOfNewAlerts,
                  information: information)
    }
    
    public var data: Data {
        
        return Data([category.rawValue, newAlertsCount]) + information.data
    }
    
    public var characteristic: GATT.Characteristic {
        
        return GATT.Characteristic(uuid: type(of: self).uuid,
                                   value: data,
                                   permissions: [.read, .write],
                                   properties: [.notify],
                                   descriptors: [])
    }
}

extension GATTNewAlert: Equatable {
    
    public static func == (lhs: GATTNewAlert,
                           rhs: GATTNewAlert) -> Bool {
        
        return lhs.category == rhs.category &&
            lhs.newAlertsCount == rhs.newAlertsCount &&
            lhs.information == rhs.information
    }
}

public extension GATTNewAlert {
    
    /// Alert textual information.
    public struct Information: RawRepresentable {
        
        /// The minimum length of “UTF-8 string” is 0 octets and maximum length of “UTF-8 string” is 18 octets.
        internal static let length = (min: 0, max: 18)
        
        public let rawValue: String
        
        public init() {
            
            self.rawValue = ""
        }
        
        public init?(rawValue: String) {
            
            let length = rawValue.utf8.count
            
            guard length >= type(of: self).length.min,
                length <= type(of: self).length.max
                else { return nil }
            
            self.rawValue = rawValue
        }
        
        public init?(data: Data) {
            
            guard let string = String(data: data, encoding: .utf8)
                else { return nil }
            
            self.init(rawValue: string)
        }
        
        public var data: Data {
            
            guard let data = rawValue.data(using: .utf8)
                else { fatalError("Could not encode string") }
            
            return data
        }
    }
}

extension GATTNewAlert.Information: Equatable {
    
    public static func == (lhs: GATTNewAlert.Information, rhs: GATTNewAlert.Information) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

extension GATTNewAlert.Information: CustomStringConvertible {
    
    public var description: String {
        
        return rawValue
    }
}

/**
 Supported Unread Alert Category
 
 Category that the server supports for unread alert.
 
 This characteristic uses the Alert Category ID Bit Mask Characteristic. If bit(s) is/are set, it means the server supports the corresponded categories for unread alert.
 
 - Example:
 The value 0x03 is interpreted that this server supports “Simple Alert” and “Email” categories for unread alert.
 
 - SeeAlso: [Supported Unread Alert Category](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.supported_unread_alert_category.xml)
 */
public struct GATTSupportedUnreadAlertCategory: GATTProfileCharacteristic {
    
    public typealias Category = GATTAlertCategoryBitMask.Category
    
    public static var uuid: BluetoothUUID { return .supportedUnreadAlertCategory }
    
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

extension GATTSupportedUnreadAlertCategory: Equatable {
    
    public static func == (lhs: GATTSupportedUnreadAlertCategory,
                           rhs: GATTSupportedUnreadAlertCategory) -> Bool {
        
        return lhs.categories == rhs.categories
    }
}

/**
 Unread Alert Status
 
 This characteristic shows how many numbers of unread alerts exist in the specific category in the device.
 This characteristic consists of “Category ID” and “uint8” which shows the number of unread alerts/messages.
 
 • Example:
 
 The value `0x01, 0x04` are interpreted that the server has 4 unread messages in Email category.
 
 - SeeAlso: [Unread Alert Status](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.unread_alert_status.xml)
 */
public struct GATTUnreadAlertStatus: GATTProfileCharacteristic {
    
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
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        guard let category = GATTAlertCategory(rawValue: data[0])
            else { return nil }
        
        let unreadCount = data[1]
        
        self.init(category: category, unreadCount: unreadCount)
    }
    
    public var data: Data {
        
        return Data([category.rawValue, unreadCount])
    }
    
    public var characteristic: GATT.Characteristic {
        
        return GATT.Characteristic(uuid: type(of: self).uuid,
                                   value: data,
                                   permissions: [.read],
                                   properties: [.read, .notify],
                                   descriptors: [])
    }
}

extension GATTUnreadAlertStatus: Equatable {
    
    public static func == (lhs: GATTUnreadAlertStatus,
                           rhs: GATTUnreadAlertStatus) -> Bool {
        
        return lhs.category == rhs.category
            && lhs.unreadCount == rhs.unreadCount
    }
}

/**
 Alert Notification Control Point
 
 Control point of the Alert Notification server. Client can write the command here to request the several functions toward the server.
 
 The 1st octet value of the characteristic is an unsigned 8 bit integer that has a fixed point exponent of 0. The 1st octet value expresses the command ID that defines the server’s actions.
 
 The 2nd octet value of the characteristic is an “Alert Category ID” format. This octet shows the target category that the command ID applies for.
 
 • Example:
 
 The data 0x02 0x01 interprets “Disable New Incoming Notification for Email Category”.
 
 - SeeAlso: [Alert Notification Control Point](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.alert_notification_control_point.xml)
 */
public struct GATTAlertNotificationControlPoint: GATTProfileCharacteristic {
    
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

/**
 Blood Pressure Feature
 
 The Blood Pressure Feature characteristic is used to describe the supported features of the Blood Pressure Sensor.
 
 - SeeAlso: [https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.blood_pressure_feature.xml]()
 */
public struct GATTBloodPressureFeature: GATTProfileCharacteristic {
    
    public static var uuid: BluetoothUUID { return .bloodPressureFeature }
    
    internal static let length = MemoryLayout<UInt16>.size
    
    public var features: BitMaskOptionSet<Feature>
    
    public init(features: BitMaskOptionSet<Feature>) {
        
        self.features = features
    }
    
    public init?(data: Data) {
        
        guard data.count >= type(of: self).length
            else { return nil }
        
        let features = BitMaskOptionSet<Feature>(rawValue: UInt16(littleEndian: UInt16(bytes: (data[0], data[1]))))
        
        self.init(features: features)
    }
    
    public var data: Data {
        
        let bytes = features.rawValue.littleEndian.bytes
        
        return Data([bytes.0, bytes.1])
    }
    
    /// Blood Pressure Feature
    public enum Feature: UInt16, BitMaskOption {
        
        internal static let length = MemoryLayout<UInt16>.size
        
        #if swift(>=3.2)
        #elseif swift(>=3.0)
        public typealias RawValue = UInt16
        #endif
        
        /// Body Movement Detection Support
        case bodyMovement = 0b01
        
        /// Cuff Fit Detection Support
        case cuttFit = 0b10
        
        /// Irregular Pulse Detection Support
        case irregularPulse = 0b100
        
        /// Pulse Rate Range Detection Support
        case pulseRateRage = 0b1000
        
        /// Measurement Position Detection Support
        case measurementPosition = 0b10000
        
        /// Multiple Bond Support
        case multipleBond = 0b100000
        
        public static let all: Set<Feature> = [
            .bodyMovement,
            .cuttFit,
            .irregularPulse,
            .pulseRateRage,
            .measurementPosition,
            .multipleBond
        ]
    }
}

/**
 Blood Pressure Measurement
 
 The Blood Pressure Measurement characteristic shall be used to send Blood Pressure measurements. Included in the characteristic are a Flags field (containing units of Blood Pressure and used to show presence of optional fields), the Blood Pressure Measurement Compound Value field and, depending upon the contents of the Flags field, Time Stamp (time of the measurement), Pulse Rate, User ID and Measurement Status fields.
 
 - SeeAlso: [Blood Pressure Measurement](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.blood_pressure_measurement.xml)
 */
public struct GATTBloodPressureMeasurement: GATTProfileCharacteristic {
    
    public static var uuid: BluetoothUUID { return .bloodPressureMeasurement }
    
    internal static let length = MemoryLayout<UInt8>.size
    
    /// The Flags field is included in the Blood Pressure Measurement characteristic.
    /// Reserved for Future Use (RFU) bits in the Flags field shall be set to 0.
    internal var flags: BitMaskOptionSet<Flag> {
        
        var flags = BitMaskOptionSet<Flag>()
        
        if case .kPa = compoundValue.unit {
            
            flags.insert(.bloodPressureUnits)
        }
        
        if timestamp != nil {
            
            flags.insert(.timestamp)
        }
        
        if pulseRate != nil {
            
            flags.insert(.pulseRate)
        }
        
        if userIdentifier != nil {
            
            flags.insert(.userID)
        }
        
        if measurementStatus != nil {
            
            flags.insert(.measurementStatus)
        }
        
        return flags
    }
    
    /// Blood Pressure Measurement Compound Value
    public var compoundValue: CompoundValue
    
    /// Time Stamp
    public var timestamp: GATTDateTime?
    
    /// Pulse Rate
    public var pulseRate: SFloat?
    
    /// User ID
    public var userIdentifier: UInt8?
    
    /// Measurement Status
    public var measurementStatus: BitMaskOptionSet<MeasurementStatus>?
    
    public init(compoundValue: CompoundValue,
                timestamp: GATTDateTime? = nil,
                pulseRate: SFloat? = nil,
                userIdentifier: UInt8? = nil,
                measurementStatus: BitMaskOptionSet<MeasurementStatus>? = nil) {
        
        self.compoundValue = compoundValue
        self.timestamp = timestamp
        self.pulseRate = pulseRate
        self.userIdentifier = userIdentifier
        self.measurementStatus = measurementStatus
    }
    
    public init?(data: Data) {
        
        guard data.count >= type(of: self).length
            else { return nil }
        
        let flags = BitMaskOptionSet<Flag>(rawValue: data[0])
        
        let unit: Unit = flags.contains(.bloodPressureUnits) ? .kPa : .mmHg
        
        let systolic = SFloat(builtin: UInt16(littleEndian: UInt16(bytes: (data[1], data[2]))))
        
        let diastolic = SFloat(builtin: UInt16(littleEndian: UInt16(bytes: (data[3], data[4]))))
        
        let meanArterialPressure = SFloat(builtin: UInt16(littleEndian: UInt16(bytes: (data[5], data[6]))))
        
        self.compoundValue = CompoundValue(unit: unit, systolic: systolic, diastolic: diastolic, meanArterialPressure: meanArterialPressure)
        
        var index = 6 // last accessed index
        
        if flags.contains(.timestamp) {
            
            guard index + GATTDateTime.length < data.count
                else { return nil }
            
            let timestampData = Data(data[index + 1 ... index + GATTDateTime.length])
            
            assert(timestampData.count == GATTDateTime.length)
            
            guard let timestamp = GATTDateTime(data: timestampData)
                else { return nil }
            
            self.timestamp = timestamp
            
            index += GATTDateTime.length
            
        } else {
            
            self.timestamp = nil
        }
        
        if flags.contains(.pulseRate) {
            
            guard index + MemoryLayout<UInt16>.size < data.count
                else { return nil }
            
            self.pulseRate = SFloat(builtin: UInt16(littleEndian: UInt16(bytes: (data[index + 1], data[index + 2]))))
            
            index += MemoryLayout<UInt16>.size
            
        } else {
            
            self.pulseRate = nil
        }
        
        if flags.contains(.userID) {
            
            guard index + 1 < data.count
                else { return nil }
            
            self.userIdentifier = data[index + 1]
            
            index += 1
            
        } else {
            
            self.pulseRate = nil
        }
        
        if flags.contains(.measurementStatus) {
            
            guard index + MemoryLayout<MeasurementStatus.RawValue>.size < data.count
                else { return nil }
            
            self.measurementStatus = BitMaskOptionSet<MeasurementStatus>(rawValue: UInt16(littleEndian: UInt16(bytes: (data[index + 1], data[index + 2]))))
            
            index += MemoryLayout<MeasurementStatus.RawValue>.size
            
        } else {
            
            self.pulseRate = nil
        }
    }
    
    public var data: Data {
        
        let flags = self.flags
        
        var totalBytes = 7 // flags + compound value
        
        if flags.contains(.timestamp) {
            
            totalBytes += GATTDateTime.length // 7
        }
        
        if flags.contains(.pulseRate) {
            
            totalBytes += MemoryLayout<SFloat>.size // 2
        }
        
        if flags.contains(.userID) {
            
            totalBytes += MemoryLayout<UInt8>.size // 1
        }
        
        if flags.contains(.measurementStatus) {
            
            totalBytes += MemoryLayout<MeasurementStatus.RawValue>.size // 2
        }
        
        let systolicBytes = compoundValue.systolic.littleEndian.builtin.bytes
        let distolicBytes = compoundValue.diastolic.littleEndian.builtin.bytes
        let meanArterialPressureBytes = compoundValue.meanArterialPressure.builtin.bytes
        
        var data = Data([
            flags.rawValue,
            systolicBytes.0,
            systolicBytes.1,
            distolicBytes.0,
            distolicBytes.1,
            meanArterialPressureBytes.0,
            meanArterialPressureBytes.1
            ])
        
        data.reserveCapacity(totalBytes)
        
        if let timestamp = self.timestamp {
            
            data.append(timestamp.data)
        }
        
        if let pulseRate = self.pulseRate {
            
            let bytes = pulseRate.littleEndian.builtin.bytes
            
            data += [bytes.0, bytes.1]
        }
        
        if let userIdentifier = self.userIdentifier {
            
            data.append(userIdentifier)
        }
        
        if let measurementStatus = self.measurementStatus {
            
            let bytes = measurementStatus.rawValue.littleEndian.bytes
            
            data += [bytes.0, bytes.1]
        }
        
        assert(data.count == totalBytes, "Encoded data is \(data.count), expected is \(totalBytes)")
        
        return data
    }
    
    /// These flags define which data fields are present in the Characteristic value.
    internal enum Flag: UInt8, BitMaskOption {
        
        #if swift(>=3.2)
        #elseif swift(>=3.0)
        public typealias RawValue = UInt8
        #endif
        
        /// Blood pressure for Systolic, Diastolic and MAP in units of kPa
        case bloodPressureUnits = 0b01
        
        /// Time Stamp present
        case timestamp = 0b10
        
        /// Pulse Rate present
        case pulseRate = 0b100
        
        /// User ID present
        case userID = 0b1000
        
        /// Measurement Status present
        case measurementStatus = 0b10000
        
        public static var all: Set<Flag> = [.bloodPressureUnits, .timestamp, .pulseRate, .userID, .measurementStatus]
    }
    
    /// Unit of measurement
    public enum Unit: UInt16 {
        
        /// Millimetre of Mercury
        case mmHg = 0x2781
        
        /// Kilo Pascal
        case kPa = 0x2724
        
        public init?(unit: UnitIdentifier) {
            
            self.init(rawValue: unit.rawValue)
        }
        
        public var unit: UnitIdentifier {
            
            return UnitIdentifier(rawValue: rawValue)
        }
    }
    
    /**
     Blood Pressure Measurement Compound Value Field
     
     This Blood Pressure Measurement Compound Value field is composed of three subfields: Systolic, Diastolic and Mean Arterial Pressure (MAP) and is included in the Blood Pressure Measurement characteristic.
     
     If a value for Systolic, Diastolic or MAP subfields is unavailable (e.g. due to an invalid result from a computation step or missing data due to the hardware’s inability to provide a valid measurement), the special short float value NaN (see Section 4) defined in ISO/IEEE 11073-20601a [4] shall be used in each of the unavailable subfields.
     
     If the unit of the Blood Pressure Measurement is in mmHg, bit 0 of the Flags field is set to 0. Otherwise, the unit is kPa and bit 0 of the Flags field is set to 1.
     */
    public struct CompoundValue {
        
        /// Unit of measurement for compound value.
        public var unit: Unit
        
        /// Systolic
        public var systolic: SFloat
        
        /// Diastolic
        public var diastolic: SFloat
        
        /// Mean Arterial Pressure
        public var meanArterialPressure: SFloat
    }
    
    public enum MeasurementStatus: UInt16, BitMaskOption {
        
        #if swift(>=3.2)
        #elseif swift(>=3.0)
        public typealias RawValue = UInt16
        #endif
        
        case bodyMovement = 0b01
        
        case cuffFit = 0b10
        
        case irregularPulse = 0b100
        
        case pulseRate = 0b1000
        
        case measurementPosition = 0b10000
        
        public static let all: Set<MeasurementStatus> = [
            .bodyMovement,
            .cuffFit,
            .irregularPulse,
            .pulseRate,
            .measurementPosition
        ]
    }
}

/**
 Aerobic Heart Rate Lower Limit
 
 Lower limit of the heart rate where the user enhances his endurance while exercising
 
 - SeeAlso: [Aerobic Heart Rate Lower Limit](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.aerobic_heart_rate_lower_limit.xml)
 */
public struct GATTAerobicHeartRateLowerLimit: GATTProfileCharacteristic {
    
    internal static let length = MemoryLayout<UInt8>.size
    
    public static var uuid: BluetoothUUID { return .aerobicHeartRateLowerLimit }
    
    public var beats: BeatsPerMinute
    
    public init(beats: BeatsPerMinute) {
        
        self.beats = beats
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        guard let beats = BeatsPerMinute(rawValue: data[0])
            else { return nil }
        
        self.init(beats: beats)
    }
    
    public var data: Data {
        
        return Data([beats.rawValue])
    }
    
    public struct BeatsPerMinute: BluetoothUnit {
        
        internal static let length = MemoryLayout<UInt8>.size
        
        public static var unitType: UnitIdentifier { return .beatsPerMinute }
        
        public var value: UInt8
        
        public init?(rawValue value: UInt8) {
            
            self.value = value
        }
        
        fileprivate init(unsafe value: UInt8) {
            
            self.value = value
        }
        
        public var rawValue: UInt8 {
            
            return value
        }
        
    }
}

extension GATTAerobicHeartRateLowerLimit.BeatsPerMinute: CustomStringConvertible {
    
    public var description: String {
        
        return value.description
    }
    
}

extension GATTAerobicHeartRateLowerLimit.BeatsPerMinute: Equatable {
    
    public static func == (lhs: GATTAerobicHeartRateLowerLimit.BeatsPerMinute,
                           rhs: GATTAerobicHeartRateLowerLimit.BeatsPerMinute) -> Bool {
        
        return lhs.value == rhs.value
    }
    
}

extension GATTAerobicHeartRateLowerLimit.BeatsPerMinute: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt8) {
        
        self.init(unsafe: value)
    }
    
}

extension GATTAerobicHeartRateLowerLimit: Equatable {
    
    public static func == (lhs: GATTAerobicHeartRateLowerLimit,
                           rhs: GATTAerobicHeartRateLowerLimit) -> Bool {
        
        return lhs.beats == rhs.beats
    }
}

extension GATTAerobicHeartRateLowerLimit: CustomStringConvertible {
    
    public var description: String {
        
        return beats.description
    }
}

// MARK: - Internal

internal extension UInt64 {
    
    /// The value of the characteristic is a bit mask implemented as an array of unsigned 8 bit integers.
    init?(bitmaskArray data: Data) {
        
        if data.count == MemoryLayout<UInt64>.size {
            
            self = UInt64(littleEndian: UInt64(bytes: (data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7])))
            
        } else if data.count >= MemoryLayout<UInt32>.size {
            
            let rawValue = UInt32(littleEndian: UInt32(bytes: (data[0], data[1], data[2], data[3])))
            
            self = UInt64(rawValue)
            
        } else if data.count >= MemoryLayout<UInt16>.size {
            
            let rawValue = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
            
            self = UInt64(rawValue)
            
        } else if data.count >= MemoryLayout<UInt8>.size {
            
            let rawValue = data[0]
            
            self = UInt64(rawValue)
            
        } else {
            
            return nil
        }
    }
    
    /// The value of the characteristic is a bit mask implemented as an array of unsigned 8 bit integers.
    var bitmaskArray: Data {
        
        if self <= numericCast(UInt8.max) {
            
            return Data([UInt8(self)])
            
        } else if self <= numericCast(UInt16.max) {
            
            let bytes = UInt16(self).littleEndian.bytes
            
            return Data([bytes.0, bytes.1])
            
        } else if self <= numericCast(UInt32.max) {
            
            let bytes = UInt32(self).littleEndian.bytes
            
            return Data([bytes.0, bytes.1, bytes.2, bytes.3])
            
        } else {
            
            let bytes = self.littleEndian.bytes
            
            return Data([bytes.0, bytes.1, bytes.2, bytes.3, bytes.4, bytes.5, bytes.6, bytes.7])
        }
    }
}
