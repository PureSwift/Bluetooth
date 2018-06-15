//
//  GATTBarometricPressureTrend.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/15/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 Barometric Pressure Trend
 
 - SeeAlso: [Barometric Pressure Trend](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.barometric_pressure_trend.xml)
 */
public enum GATTBarometricPressureTrend: UInt8, GATTCharacteristic, BluetoothUnit {
    
    internal static let length = MemoryLayout<UInt8>.size
    
    public static var uuid: BluetoothUUID { return .barometricPressureTrend }
    
    public static var unitType: UnitIdentifier { return .unitless }
    
    // Unknown
    case unknown = 0x00
    
    // Continuously falling
    case continuouslyFalling = 0x01
    
    // Continuously rising
    case continuouslyRising = 0x02
    
    // Falling, then steady
    case fallingThenSteady = 0x03
    
    // Rising, then steady
    case risingThenSteady = 0x04
    
    // Falling before a lesser rise
    case fallingBeforeLesserRise = 0x05
    
    // Falling before a greater rise
    case fallingBeforeGreaterRise = 0x06
    
    // Rising before a greater fall
    case risingBeforeGreaterFall = 0x07
    
    // Rising before a lesser fall
    case risingBeforeLesserFall = 0x08
    
    // Steady
    case steady = 0x09
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        self.init(rawValue: data[0])
    }
    
    public var data: Data {
        
        return Data([rawValue])
    }
    
}

extension GATTBarometricPressureTrend: Equatable {
    
    public static func == (lhs: GATTBarometricPressureTrend, rhs: GATTBarometricPressureTrend) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}
