//
//  GATTDayOfWeek.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 7/5/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 Day of Week
 
 - SeeAlso: [Day of Week](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.day_of_week.xml)
 */
public struct GATTDayOfWeek: GATTCharacteristic {
    
    public static var uuid: BluetoothUUID { return .dayOfWeek }
    
    internal static let length = MemoryLayout<UInt8>.size
    
    public var day: Day
    
    public init(day: Day) {
        
        self.day = day
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        guard let day = Day(rawValue: data[0])
            else { return nil }
        
        self.init(day: day)
    }
    
    public var data: Data {
        
        return Data([day.rawValue])
    }
}

extension GATTDayOfWeek: Equatable {
    
    public static func == (lhs: GATTDayOfWeek, rhs: GATTDayOfWeek) -> Bool {
        
        return lhs.day == rhs.day
    }
}

extension GATTDayOfWeek: CustomStringConvertible {
    
    public var description: String {
        
        return day.description
    }
    
}

extension GATTDayOfWeek {
    
    public enum Day: UInt8, BluetoothUnit {
        
        public static var unitType: UnitIdentifier { return .day }
        
        case unknown = 0
        
        case monday = 1
        
        case tuesday = 2
        
        case wednesday = 3
        
        case thursday = 4
        
        case friday = 5
        
        case saturday = 6
        
        case sunday = 7
    }
    
}

extension GATTDayOfWeek.Day: Equatable {
    
    public static func == (lhs: GATTDayOfWeek.Day, rhs: GATTDayOfWeek.Day) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

extension GATTDayOfWeek.Day: CustomStringConvertible {
    
    public var description: String {
        
        return rawValue.description
    }
    
}
