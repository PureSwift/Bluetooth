//
//  GATTAlertLevel.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 Alert Level
 
 The level of an alert a device is to sound. If this level is changed while the alert is being sounded, the new level should take effect.
 
 The value of the characteristic shall be an unsigned 8 bit integer that has a fixed point exponent of 0. The Alert Level characteristic defines the level of alert, and is one of the following three values:
 
 • Value 0, meaning “No Alert”
 
 • Value 1, meaning “Mild Alert”
 
 • EValue 2, meaning “High Alert”
 
 • Example:
 
 The value 0x01 is interpreted as “Mild Alert”
 
 - SeeAlso: [Alert Level](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.alert_level.xml)
 */
public enum GATTAlertLevel: UInt8, GATTCharacteristic {
    
    public static var uuid: BluetoothUUID { return .alertLevel }
    
    internal static let length = MemoryLayout<UInt8>.size
    
    /// No alert.
    case none = 0x00
    
    /// Mild alert.
    case mild = 0x01
    
    /// High alert.
    case high = 0x02
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        self.init(rawValue: data[0])
    }
    
    public var data: Data {
        
        return Data([rawValue])
    }
}
