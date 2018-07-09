//
//  GATTExactTime256.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 7/5/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 Exact Time 256
 
 - SeeAlso: [Exact Time 256](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.exact_time_256.xml)
 */
public struct GATTExactTime256: GATTCharacteristic {
    
    internal static let length = GATTDayDateTime.length + MemoryLayout<UInt8>.size
    
    public static var uuid: BluetoothUUID { return .exactTime256 }
    
    public var dayDateTime: GATTDayDateTime
    
    public var fractions256: UInt8
    
    public init(dayDateTime: GATTDayDateTime, fractions256: UInt8) {
        
        self.dayDateTime = dayDateTime
        self.fractions256 = fractions256
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        guard let dayDateTime = GATTDayDateTime(data: data.subdata(in: (0 ..< GATTDayDateTime.length)))
            else { return nil }
        
        let fractions256 = data[GATTDayDateTime.length]
        
        self.init(dayDateTime: dayDateTime, fractions256: fractions256)
    }
    
    public var data: Data {
        
        return dayDateTime.data + Data([fractions256])
    }
}

extension GATTExactTime256: Equatable {
    
    public static func == (lhs: GATTExactTime256, rhs: GATTExactTime256) -> Bool {
        
        return lhs.dayDateTime == rhs.dayDateTime &&
            lhs.fractions256 == rhs.fractions256
    }
}
