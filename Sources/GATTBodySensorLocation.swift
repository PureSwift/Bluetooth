//
//  GATTBodySensorLocation.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/18/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 Body Sensor Location
 
 [Body Sensor Location](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.body_sensor_location.xml)
 */
public enum GATTBodySensorLocation: UInt8, GATTCharacteristic {
    
    public static var uuid: BluetoothUUID { return .bodySensorLocation }
    
    internal static let length = MemoryLayout<UInt8>.size
    
    /// Other
    case other = 0x00
    
    /// Chest
    case chest = 0x01
    
    /// Wrist
    case wrist = 0x02
    
    /// Finger
    case finger = 0x03
    
    /// Hand
    case hand = 0x04
    
    /// Ear Lobe
    case earLobe = 0x05
    
    /// Foot
    case foot = 0x06
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        self.init(rawValue: data[0])
    }
    
    public var data: Data {
        
        return Data([rawValue])
    }
}

// MARK: - CustomStringConvertible

extension GATTBodySensorLocation: CustomStringConvertible {
    
    public var name: String {
        
        switch self {
            
        case .other: return "Other"
        case .chest: return "Chest"
        case .wrist: return "Wrist"
        case .finger: return "Finger"
        case .hand: return "Hand"
        case .earLobe: return "Ear Lobe"
        case .foot: return "Foot"
        }
    }
    
    public var description: String {
        
        return name
    }
}
