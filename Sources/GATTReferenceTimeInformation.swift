//
//  GATTReferenceTimeInformation.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 7/6/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 Reference Time Information
 
 - SeeAlso: [Reference Time Information](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.reference_time_information.xml)
 */
public struct GATTReferenceTimeInformation: GATTCharacteristic {
    
    internal static let length = GATTTimeSource.length + GATTTimeAccuracy.length + 1 + 1
    
    public static var uuid: BluetoothUUID { return .referenceTimeInformation }
    
    public var timeSource: GATTTimeSource
    
    public var timeAccuracy: GATTTimeAccuracy
    
    public var daysSinceUpdate: Day
    
    public var hoursSinceUpdate: Hour
    
    public init(timeSource: GATTTimeSource,
                timeAccuracy: GATTTimeAccuracy,
                daysSinceUpdate: Day,
                hoursSinceUpdate: Hour) {
        
        self.timeSource = timeSource
        self.timeAccuracy = timeAccuracy
        self.daysSinceUpdate = daysSinceUpdate
        self.hoursSinceUpdate = hoursSinceUpdate
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        guard let timeSource = GATTTimeSource(data: data.subdata(in: (0 ..< GATTTimeSource.length)))
            else { return nil }
        
        guard let timeAccuracy = GATTTimeAccuracy(data: data.subdata(in: (GATTTimeAccuracy.length ..< 2)))
            else { return nil }
        
        let daysSinceUpdate = Day(rawValue: data[2])
        
        guard let hoursSinceUpdate = Hour(rawValue: data[3])
            else { return nil }
        
        self.init(timeSource: timeSource,
                  timeAccuracy: timeAccuracy,
                  daysSinceUpdate: daysSinceUpdate,
                  hoursSinceUpdate: hoursSinceUpdate)
    }
    
    public var data: Data {
        
        return timeSource.data +
            timeAccuracy.data +
            Data([daysSinceUpdate.rawValue]) +
            Data([hoursSinceUpdate.rawValue])
    }
}

extension GATTReferenceTimeInformation: Equatable {
    
    public static func == (lhs: GATTReferenceTimeInformation, rhs: GATTReferenceTimeInformation) -> Bool {
        
        return lhs.timeSource == rhs.timeSource &&
            lhs.timeAccuracy == rhs.timeAccuracy &&
            lhs.daysSinceUpdate == rhs.daysSinceUpdate &&
            lhs.hoursSinceUpdate == rhs.hoursSinceUpdate
    }
}

extension GATTReferenceTimeInformation {
    
    public struct Day: BluetoothUnit {
        
        public static var unitType: UnitIdentifier { return .day }
        
        public static let moreDays: Day = 255
        
        public let rawValue: UInt8
        
        public init(rawValue: UInt8) {
            
            self.rawValue = rawValue
        }
    }
    
}

extension GATTReferenceTimeInformation.Day: Equatable {
    
    public static func == (lhs: GATTReferenceTimeInformation.Day, rhs: GATTReferenceTimeInformation.Day) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

extension GATTReferenceTimeInformation.Day: CustomStringConvertible {
    
    public var description: String {
        
        return rawValue.description
    }
    
}

extension GATTReferenceTimeInformation.Day: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt8) {
        
        self.init(rawValue: value)
    }
    
}

extension GATTReferenceTimeInformation {
    
    public struct Hour: BluetoothUnit {
        
        public static var unitType: UnitIdentifier { return .hour }
        
        public static let min = Hour(0)
        
        public static let max = Hour(23)
        
        public static let moreHours = Hour(255)
        
        public let rawValue: UInt8
        
        public init?(rawValue: UInt8) {
            
            guard rawValue == Hour.moreHours.rawValue
                || (Hour.min.rawValue <= rawValue && Hour.max.rawValue >= rawValue)
                else { return nil }
            
            self.rawValue = rawValue
        }
        
        fileprivate init(_ unsafe: UInt8) {
            
            self.rawValue = unsafe
        }
    }
}

extension GATTReferenceTimeInformation.Hour: Equatable {
    
    public static func == (lhs: GATTReferenceTimeInformation.Hour, rhs: GATTReferenceTimeInformation.Hour) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

extension GATTReferenceTimeInformation.Hour: CustomStringConvertible {
    
    public var description: String {
        
        return rawValue.description
    }
    
}
