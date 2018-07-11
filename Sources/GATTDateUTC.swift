//
//  GATTDateUTC.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 7/11/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

public struct GATTDateUTC: GATTCharacteristic {
    
    internal static let length = MemoryLayout<UInt24>.size
    
    public static var uuid: BluetoothUUID { return .dateUtc }
    
    public let date: Day
    
    public init?(date: Day) {
        
        self.date = date
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        guard let date = Day(rawValue: UInt24(littleEndian: UInt24(bytes: (data[0], data[1], data[2]))))
            else { return nil }
        
        self.init(date: date)
    }
    
    public var data: Data {
        
        let bytes = date.rawValue.littleEndian.bytes
        
        return Data([bytes.0, bytes.1, bytes.2])
    }
}

extension GATTDateUTC: Equatable {
    
    public static func == (lhs: GATTDateUTC, rhs: GATTDateUTC) -> Bool {
        
        return lhs.date == rhs.date
    }
}

extension GATTDateUTC: CustomStringConvertible {
    
    public var description: String {
        
        return date.rawValue.description
    }
}

extension GATTDateUTC {

    public struct Day: BluetoothUnit {
        
        public static var unitType: UnitIdentifier { return .day }
        
        public static let unknown = Day(0)
        
        public static let min = Day(1)
        
        public static let max = Day(16777214)
        
        public let rawValue: UInt24
        
        public init?(rawValue: UInt24) {
            
            guard rawValue == Day.unknown.rawValue
                || (rawValue <= Day.max.rawValue && rawValue >= Day.min.rawValue)
                else { return nil }
            
            self.rawValue = rawValue
        }
        
        private init(_ unsafe: UInt24) {
            
            self.rawValue = unsafe
        }
    }
}

extension GATTDateUTC.Day: Equatable {
    
    public static func == (lhs: GATTDateUTC.Day, rhs: GATTDateUTC.Day) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

extension GATTDateUTC.Day: CustomStringConvertible {
    
    public var description: String {
        
        return rawValue.description
    }
}
