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
    
    public static var unit: UnitIdentifier = .percentage
    
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
        
        guard let bitmask = BitMaskOptionSet<Category>(bitmaskArray: data)
            else { return nil }
        
        self.categories = bitmask
    }
    
    public var data: Data {
        
        return categories.bitmaskArray
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
        
        guard let bitmask = BitMaskOptionSet<Category>(bitmaskArray: data)
            else { return nil }
        
        self.categories = bitmask
    }
    
    public var data: Data {
        
        return categories.bitmaskArray
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
 
 - Example:
 
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
        
        guard let bitmask = BitMaskOptionSet<Category>(bitmaskArray: data)
            else { return nil }
        
        self.categories = bitmask
    }
    
    public var data: Data {
        
        return categories.bitmaskArray
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
 */
public struct BloodPressureMeasurement: GATTProfileCharacteristic {
    
    public static var uuid: BluetoothUUID { return .bloodPressureMeasurement }
    
    internal static let length = MemoryLayout<UInt8>.size
    
    /// The Flags field is included in the Blood Pressure Measurement characteristic.
    /// Reserved for Future Use (RFU) bits in the Flags field shall be set to 0.
    internal var flags: BitMaskOptionSet<Flag> {
        
        var flags = BitMaskOptionSet<Flag>()
        
        
    }
    
    /**
     Blood Pressure Measurement Compound Value Field
     
     This Blood Pressure Measurement Compound Value field is composed of three subfields: Systolic, Diastolic and Mean Arterial Pressure (MAP) and is included in the Blood Pressure Measurement characteristic.
     
     If a value for Systolic, Diastolic or MAP subfields is unavailable (e.g. due to an invalid result from a computation step or missing data due to the hardware’s inability to provide a valid measurement), the special short float value NaN (see Section 4) defined in ISO/IEEE 11073-20601a [4] shall be used in each of the unavailable subfields.
     
     If the unit of the Blood Pressure Measurement is in mmHg, bit 0 of the Flags field is set to 0. Otherwise, the unit is kPa and bit 0 of the Flags field is set to 1.
     */
    public var compoundField: BloodPressureUnits
    
    ///
    public var fields = [BloodPressureField]()
    
    public init?(data: Data) {
        
        guard data.count >= type(of: self).length
            else { return nil }
        
        let flags = BitMaskOptionSet<Flag>(rawValue: data[0])
        
        var index = 0
        
        if flags.contains(.bloodPressureUnits) {
            
            guard let systolic = MilimetreOfMercuryUnit(rawValue: UInt16(littleEndian: UInt16(bytes: (data[index+1], data[index+2]))))
                else { return nil }
            
            guard let diastolic = MilimetreOfMercuryUnit(rawValue: UInt16(littleEndian: UInt16(bytes: (data[index+3], data[index+4]))))
                else { return nil }
            
            guard let map = MilimetreOfMercuryUnit(rawValue: UInt16(littleEndian: UInt16(bytes: (data[index+5], data[index+6]))))
                else { return nil }
            
            compoundField = .mmHg(systolic, diastolic, map)
            
        } else {
            
            guard let systolic = PascalUnit(rawValue: UInt16(littleEndian: UInt16(bytes: (data[index+1], data[index+2]))))
                else { return nil }
            
            guard let diastolic = PascalUnit(rawValue: UInt16(littleEndian: UInt16(bytes: (data[index+3], data[index+4]))))
                else { return nil }
            
            guard let map = PascalUnit(rawValue: UInt16(littleEndian: UInt16(bytes: (data[index+5], data[index+6]))))
                else { return nil }
            
            compoundField = .kPa(systolic, diastolic, map)
        }
        
        index += 6
        
        if flags.contains(.timestamp) {
            
            guard let datetime = DateTime(data: data.subdata(in: (index..<DateTime.length)))
                else { return nil }
            
            fields.append(.timestamp(datetime))
            
            index += 7
        }
        
        if flags.contains(.pulseRate) {
            
            let pulseRate = UInt16(littleEndian: UInt16(bytes: (data[index+1], data[index+2])))
            fields.append(.pulseRate(pulseRate))
            
            index += 2
        }
        
        if flags.contains(.userID) {
            
            let userID = data[index+1]
            fields.append(.userID(userID))
            
            index += 1
        }
        
        if flags.contains(.measurementStatus) {
            
            let measurementStatus = UInt16(littleEndian: UInt16(bytes: (data[index+1], data[index+2])))
            
            guard let flag = MeasurementStatusFlag(rawValue: measurementStatus)
                else { return nil }
            
            fields.append(.measurementStatus(flag))
        }
    }
    
    public var data: Data {
        
        let data = Data([flags.rawValue]) + compoundField.data
        
        return fields.reduce(data, { $0.0 + $0.1.data })
    }
    
    public enum Flag: UInt8, BitMaskOption, CustomStringConvertible {
        
        #if swift(>=3.2)
        #elseif swift(>=3.0)
        public typealias RawValue = UInt8
        #endif
        
        case bloodPressureUnits = 0b01
        
        case timestamp = 0b10
        
        case pulseRate = 0b100
        
        case userID = 0b1000
        
        case measurementStatus = 0b10000
        
        public static var all: Set<Flag> = [.bloodPressureUnits, .timestamp, .pulseRate, .userID, .measurementStatus]
    }
    
    public enum BloodPressureField {
        
        case timestamp(DateTime)
        
        case pulseRate(UInt16)
        
        case userID(UInt8)
        
        case measurementStatus(MeasurementStatusFlag)
        
        var data: Data {
            
            switch self {
                
            case .timestamp(let datetime):
                
                return datetime.data
                
            case .pulseRate(let rate):
                
                let bytes = rate.littleEndian.bytes
                
                return Data([bytes.0, bytes.1])
                
            case .userID(let userid):
                
                return Data([userid])
                
            case .measurementStatus(let status):
                
                let bytes = status.rawValue.littleEndian.bytes
                
                return Data([bytes.0, bytes.1])
            }
        }
    }
    
    public enum BloodPressureUnits {
        
        case mmHg(MilimetreOfMercuryUnit, MilimetreOfMercuryUnit, MilimetreOfMercuryUnit)
        
        case kPa(PascalUnit, PascalUnit, PascalUnit)
        
        var data: Data {
            
            switch self {
            case .mmHg(let systolic, let diastolic, let map):
                
                let systolicBytes = systolic.value.littleEndian.bytes
                let diastolicBytes = diastolic.value.littleEndian.bytes
                let mapBytes = map.value.littleEndian.bytes
                
                return Data([systolicBytes.0, systolicBytes.1, diastolicBytes.0, diastolicBytes.1, mapBytes.0, mapBytes.1])
                
            case .kPa(let systolic, let diastolic, let map):
                
                let systolicBytes = systolic.value.littleEndian.bytes
                let diastolicBytes = diastolic.value.littleEndian.bytes
                let mapBytes = map.value.littleEndian.bytes
                
                return Data([systolicBytes.0, systolicBytes.1, diastolicBytes.0, diastolicBytes.1, mapBytes.0, mapBytes.1])
            }
        }
    }
    
    public struct DateTime: GATTProfileCharacteristic {
        
        public static var uuid: BluetoothUUID { return .dateTime }
        
        internal static let length = 7
        
        public var year: YearUnit
        
        public var month: MonthUnit
        
        public var day: DayUnit
        
        public var hour: HourUnit
        
        public var minutes: MinuteUnit
        
        public var seconds: SecondUnit
        
        public init(year: YearUnit, month: MonthUnit, day: DayUnit, hour: HourUnit, minutes: MinuteUnit, seconds: SecondUnit) {
            
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
            
            guard let year = YearUnit(rawValue: UInt16(littleEndian: UInt16(bytes: (data[0], data[1]))))
                else {return nil }
            
            guard let month = MonthUnit(rawValue: data[2])
                else { return nil }
            
            guard let day = DayUnit(rawValue: data[3])
                else { return nil }
            
            guard let hour = HourUnit(rawValue: data[4])
                else { return nil }
            
            guard let minutes = MinuteUnit(rawValue: data[5])
                else { return nil }
            
            guard let seconds = SecondUnit(rawValue: data[6])
                else { return nil }
            
            self.init(year: year, month: month, day: day, hour: hour, minutes: minutes, seconds: seconds)
        }
        
        public var data: Data {
            
            let yearBytes = year.rawValue.bytes
            
            return Data([yearBytes.0, yearBytes.1, month.rawValue, day.rawValue, hour.rawValue, minutes.rawValue, seconds.rawValue])
        }
        
    }
    
    public enum MeasurementStatusFlag: UInt16, BitMaskOption {
        
        internal static let length = MemoryLayout<UInt16>.size
        
        #if swift(>=3.2)
        #elseif swift(>=3.0)
        public typealias RawValue = UInt16
        #endif
        
        case bodyMovementDetection = 0b01
        
        case cuffFitDetection = 0b10
        
        case irregularPulseDetection = 0b100
        
        case pulseRateRageDetection = 0b1000
        
        case measurementPositionDetection = 0b10000
        
        public static let all: Set<MeasurementStatusFlag> = [
            .bodyMovementDetection,
            .cuffFitDetection,
            .irregularPulseDetection,
            .pulseRateRageDetection,
            .measurementPositionDetection
        ]
        
    }
    
}

// MARK: - Internal

internal extension BitMaskOptionSet {
    
    /// The value of the characteristic is a bit mask implemented as an array of unsigned 8 bit integers.
    init?(bitmaskArray data: Data) {
        
        if data.count == MemoryLayout<UInt64>.size {
            
            let rawValue = UInt64(littleEndian: UInt64(bytes: (data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7])))
            
            self.init(rawValue: RawValue(rawValue))
            
        } else if data.count >= MemoryLayout<UInt32>.size {
            
            let rawValue = UInt32(littleEndian: UInt32(bytes: (data[0], data[1], data[2], data[3])))
            
            self.init(rawValue: RawValue(rawValue))
            
        } else if data.count >= MemoryLayout<UInt16>.size {
            
            let rawValue = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
            
            self.init(rawValue: RawValue(rawValue))
            
        } else if data.count >= MemoryLayout<UInt8>.size {
            
            let rawValue = data[0]
            
            self.init(rawValue: RawValue(rawValue))
            
        } else {
            
            return nil
        }
    }
    
    /// The value of the characteristic is a bit mask implemented as an array of unsigned 8 bit integers.
    var bitmaskArray: Data {
        
        if rawValue <= numericCast(UInt8.max) {
            
            return Data([UInt8(rawValue)])
            
        } else if rawValue <= numericCast(UInt16.max) {
            
            let bytes = UInt16(rawValue).littleEndian.bytes
            
            return Data([bytes.0, bytes.1])
            
        } else if rawValue <= numericCast(UInt32.max) {
            
            let bytes = UInt32(rawValue).littleEndian.bytes
            
            return Data([bytes.0, bytes.1, bytes.2, bytes.3])
            
        } else if rawValue <= numericCast(UInt64.max) {
            
            let bytes = UInt64(rawValue).littleEndian.bytes
            
            return Data([bytes.0, bytes.1, bytes.2, bytes.3, bytes.4, bytes.5, bytes.6, bytes.7])
            
        } else {
            
            fatalError("\(rawValue) is to big to encode into byte array")
        }
    }
}
