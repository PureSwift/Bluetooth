//
//  GATTDateTime.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 Date Time
 
 The Date Time characteristic is used to represent time.
 
 The Date Time characteristic contains fields for year, month, day, hours, minutes and seconds. Calendar days in Date Time are represented using Gregorian calendar. Hours in Date Time are represented in the 24h system.
 
 - SeeAlso: [Date Time](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.date_time.xml)
 */
public struct GATTDateTime: GATTCharacteristic {
    
    public static var uuid: BluetoothUUID { return .dateTime }
    
    internal static let length = 7
    
    public var year: Year
    
    public var month: Month
    
    public var day: Day
    
    public var hour: Hour
    
    public var minute: Minute
    
    public var second: Second
    
    public init(year: Year,
                month: Month,
                day: Day,
                hour: Hour,
                minute: Minute,
                second: Second) {
        
        self.year = year
        self.month = month
        self.day = day
        self.hour = hour
        self.minute = minute
        self.second = second
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        guard let year = Year(rawValue: UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))),
            let month = Month(rawValue: data[2]),
            let day = Day(rawValue: data[3]),
            let hour = Hour(rawValue: data[4]),
            let minute = Minute(rawValue: data[5]),
            let second = Second(rawValue: data[6])
            else { return nil }
        
        self.init(year: year, month: month, day: day, hour: hour, minute: minute, second: second)
    }
    
    public var data: Data {
        
        let yearBytes = year.rawValue.littleEndian.bytes
        
        return Data([yearBytes.0, yearBytes.1, month.rawValue, day.rawValue, hour.rawValue, minute.rawValue, second.rawValue])
    }
}

// MARK: - Date conversion

public extension GATTDateTime {
    
    /// Default calender to use for `Date` conversion.
    private static var calendar: Calendar {
        
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = TimeZone(identifier: "UTC")!
        return calendar
    }
    
    /// Initialize with the current date.
    public init() {
        
        self.init(date: Date())
    }
    
    /// Initialize with the specified date.
    public init(date: Date) {
        
        let calendar = type(of: self).calendar
        
        let dateComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second],
                                                     from: date)
        
        guard let dateTime = GATTDateTime(dateComponents: dateComponents)
            else { fatalError("Could not create \(GATTDateTime.self) from \(date)") }
        
        self = dateTime
    }
    
    /// Initialize with the specified `DateComponents`.
    init?(dateComponents: DateComponents) {
        
        guard let year = Year(rawValue: UInt16(dateComponents.year ?? 0)),
            let month = Month(rawValue: UInt8(dateComponents.month ?? 0)),
            let day = Day(rawValue: UInt8(dateComponents.day ?? 0)),
            let hour = Hour(rawValue: UInt8(dateComponents.hour ?? 0)),
            let minutes = Minute(rawValue: UInt8(dateComponents.minute ?? 0)),
            let seconds = Second(rawValue: UInt8(dateComponents.second ?? 0))
            else { return nil }
        
        self.init(year: year,
                  month: month,
                  day: day,
                  hour: hour,
                  minute: minutes,
                  second: seconds)
    }
    
    /// Date components for the date time.
    var dateComponents: DateComponents {
        
        let calendar = type(of: self).calendar
        
        return DateComponents(calendar: calendar,
                              timeZone: calendar.timeZone,
                              year: year == .unknown ? nil : Int(year.rawValue),
                              month: month == .unknown ? nil : Int(month.rawValue),
                              day: day == .unknown ? nil : Int(day.rawValue),
                              hour: Int(hour.rawValue),
                              minute: Int(minute.rawValue),
                              second: Int(second.rawValue))
    }
}

public extension Date {
    
    /// Initialize from `Bluetooth.GATTDateTime`.
    init?(dateTime: GATTDateTime) {
        
        guard let date = dateTime.dateComponents.date
            else { return nil }
        
        self = date
    }
}

// MARK: - Equatable

extension GATTDateTime: Equatable {
    
    public static func == (lhs: GATTDateTime, rhs: GATTDateTime) -> Bool {
        
        return lhs.year == rhs.year
            && lhs.month == rhs.month
            && lhs.day == rhs.day
            && lhs.hour == lhs.hour
            && lhs.minute == lhs.minute
            && lhs.second == rhs.second
    }
}

// MARK: - Supporting Types

public extension GATTDateTime {
    
    /// Year as defined by the Gregorian calendar.
    ///
    /// - SeeAlso: [Units](https://www.bluetooth.com/specifications/assigned-numbers/units)
    public struct Year: BluetoothUnit {
        
        public static var unitType: UnitIdentifier { return .year }
        
        /// Unknown year
        public static let unknown = Year(0)
        
        public static let min = Year(1582)
        
        public static let max = Year(9999)
        
        public let rawValue: UInt16
        
        public init?(rawValue: UInt16) {
            
            guard rawValue == Year.unknown.rawValue
                || (rawValue <= Year.max.rawValue && rawValue >= Year.min.rawValue)
                else { return nil }
            
            self.rawValue = rawValue
        }
        
        private init(_ unsafe: UInt16) {
            
            self.rawValue = unsafe
        }
    }
}

extension GATTDateTime.Year: Equatable {
    
    public static func == (lhs: GATTDateTime.Year, rhs: GATTDateTime.Year) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

extension GATTDateTime.Year: CustomStringConvertible {
    
    public var description: String {
        
        return rawValue.description
    }
}

public extension GATTDateTime {
    
    /// Month of the year as defined by the Gregorian calendar.
    ///
    /// - SeeAlso: [Units](https://www.bluetooth.com/specifications/assigned-numbers/units)
    public enum Month: UInt8, BluetoothUnit {
        
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
    }
}

extension GATTDateTime.Month: Equatable {
    
    public static func == (lhs: GATTDateTime.Month, rhs: GATTDateTime.Month) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

public extension GATTDateTime {
    
    /// Day of the month as defined by the Gregorian calendar.
    ///
    /// - SeeAlso: [Units](https://www.bluetooth.com/specifications/assigned-numbers/units)
    public struct Day: BluetoothUnit {
        
        public static var unitType: UnitIdentifier { return .day }
        
        /// Day of Month is not known.
        public static let unknown = Day(0)
        
        /// The minimum value
        public static let min = Day(1)
        
        /// The maximum value.
        public static let max = Day(31)
        
        public let rawValue: UInt8
        
        public init?(rawValue: UInt8) {
            
            guard rawValue == Day.unknown.rawValue
                || (rawValue <= Day.max.rawValue && rawValue >= Day.min.rawValue)
                else { return nil }
            
            self.rawValue = rawValue
        }
        
        private init(_ unsafe: UInt8) {
            
            self.rawValue = unsafe
        }
    }
}

extension GATTDateTime.Day: Equatable {
    
    public static func == (lhs: GATTDateTime.Day, rhs: GATTDateTime.Day) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

extension GATTDateTime.Day: CustomStringConvertible {
    
    public var description: String {
        
        return rawValue.description
    }
}

public extension GATTDateTime {
    
    /// Number of hours past midnight.
    ///
    /// - SeeAlso: [Units](https://www.bluetooth.com/specifications/assigned-numbers/units)
    public struct Hour: BluetoothUnit {
        
        public static var unitType: UnitIdentifier { return .hour }
        
        /// The minimum value.
        public static let min = Hour(0)
        
        /// The maximum value.
        public static let max = Hour(23)
        
        public let rawValue: UInt8
        
        public init?(rawValue: UInt8) {
            
            guard rawValue >= Hour.min.rawValue,
                rawValue <= Hour.max.rawValue
                else { return nil }
            
            self.rawValue = rawValue
        }
        
        private init(_ unsafe: UInt8) {
            
            self.rawValue = unsafe
        }
    }
}

extension GATTDateTime.Hour: Equatable {
    
    public static func == (lhs: GATTDateTime.Hour, rhs: GATTDateTime.Hour) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
    
}

extension GATTDateTime.Hour: CustomStringConvertible {
    
    public var description: String {
        
        return rawValue.description
    }
}

public extension GATTDateTime {
    
    /// Number of minutes since the start of the hour.
    ///
    /// - SeeAlso: [Units](https://www.bluetooth.com/specifications/assigned-numbers/units)
    public struct Minute: BluetoothUnit {
        
        public static var unitType: UnitIdentifier { return .minute }
        
        /// The minimum value.
        public static let min = Minute(0)
        
        /// The maximum value.
        public static let max = Minute(59)
        
        public let rawValue: UInt8
        
        public init?(rawValue: UInt8) {
            
            guard rawValue <= Minute.max.rawValue,
                rawValue >= Minute.min.rawValue
                else { return nil }
            
            self.rawValue = rawValue
        }
        
        private init(_ unsafe: UInt8) {
            
            self.rawValue = unsafe
        }
    }
}

extension GATTDateTime.Minute: Equatable {
    
    public static func == (lhs: GATTDateTime.Minute, rhs: GATTDateTime.Minute) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

extension GATTDateTime.Minute: CustomStringConvertible {
    
    public var description: String {
        
        return rawValue.description
    }
}

public extension GATTDateTime {
    
    /// Number of seconds since the start of the minute.
    ///
    /// - SeeAlso: [Units](https://www.bluetooth.com/specifications/assigned-numbers/units)
    public struct Second: BluetoothUnit {
        
        public static var unitType: UnitIdentifier { return .second }
        
        /// The minimum value.
        public static let min = Second(0)
        
        /// The maximum value.
        public static let max = Second(59)
        
        public let rawValue: UInt8
        
        public init?(rawValue: UInt8) {
            
            guard rawValue <= Second.max.rawValue,
                rawValue >= Second.min.rawValue
                else { return nil }
            
            self.rawValue = rawValue
        }
        
        private init(_ unsafe: UInt8) {
            
            self.rawValue = unsafe
        }
    }
}

extension GATTDateTime.Second: Equatable {
    
    public static func == (lhs: GATTDateTime.Second, rhs: GATTDateTime.Second) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
    
}

extension GATTDateTime.Second: CustomStringConvertible {
    
    public var description: String {
        
        return rawValue.description
    }
}
