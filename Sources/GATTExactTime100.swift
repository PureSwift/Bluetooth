//
//  GATTExactTime100.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 7/10/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 Exact Time 100
 
 [Exact Time 100](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.exact_time_100.xml)
 */
public struct GATTExactTime100: GATTCharacteristic {
    
    internal static let length = GATTDayDateTime.length + MemoryLayout<UInt8>.size
    
    public static var uuid: BluetoothUUID { return .exactTime100 }
    
    public var dayDateTime: GATTDayDateTime
    
    public var fraction100: Second
    
    public init(dayDateTime: GATTDayDateTime, fraction100: Second) {
        
        self.dayDateTime = dayDateTime
        self.fraction100 = fraction100
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        guard let dayDateTime = GATTDayDateTime(data: data.subdata(in: (0 ..< GATTDayDateTime.length)))
            else { return nil }
        
        guard let fraction100 = Second(rawValue: data[GATTDayDateTime.length])
            else { return nil }
        
        self.init(dayDateTime: dayDateTime, fraction100: fraction100)
    }
    
    public var data: Data {
        
        return dayDateTime.data + Data([fraction100.rawValue])
    }
}

extension GATTExactTime100 {
    
    public struct Second: BluetoothUnit {
        
        public static var unitType: UnitIdentifier { return .second }
        
        /// The minimum value.
        public static let min = Second(0)
        
        /// The maximum value.
        public static let max = Second(99)
        
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

extension GATTExactTime100: Equatable {
    
    public static func == (lhs: GATTExactTime100, rhs: GATTExactTime100) -> Bool {
        
        return lhs.dayDateTime == rhs.dayDateTime && lhs.fraction100 == rhs.fraction100
    }
}

extension GATTExactTime100.Second: Equatable {
    
    public static func == (lhs: GATTExactTime100.Second, rhs: GATTExactTime100.Second) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}
