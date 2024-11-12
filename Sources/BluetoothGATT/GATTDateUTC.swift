//
//  GATTDateUTC.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 7/11/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation
import Bluetooth

@frozen
public struct GATTDateUTC: GATTCharacteristic, Equatable {
    
    internal static let length = MemoryLayout<UInt24>.size
    
    public static var uuid: BluetoothUUID { return .dateUtc }
    
    public let date: Day
    
    public init?(date: Day) {
        
        self.date = date
    }
    
    public init?<Data: DataContainer>(data: Data) {
        
        guard data.count == Self.length
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

extension GATTDateUTC: CustomStringConvertible {
    
    public var description: String {
        
        return date.rawValue.description
    }
}

extension GATTDateUTC {

    public struct Day: BluetoothUnit, Equatable {
        
        public static var unitType: UnitIdentifier { return .day }
        
        public static var unknown: Day { Day(0) }
        
        public static var min: Day { Day(1) }
        
        public static var max: Day { Day(16777214) }
        
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

extension GATTDateUTC.Day: CustomStringConvertible {
    
    public var description: String {
        
        return rawValue.description
    }
}
