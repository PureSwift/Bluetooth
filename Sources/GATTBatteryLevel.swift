//
//  GATTBatteryLevel.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// Battery Level
///
/// The current charge level of a battery. 100% represents fully charged while 0% represents fully discharged.
///
/// - SeeAlso: [Battery Level](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.battery_level.xml)
public struct GATTBatteryLevel: GATTCharacteristic {
    
    public typealias Percentage = GATTBatteryPercentage
    
    internal static let length = 1
    
    public static var uuid: BluetoothUUID { return .batteryLevel }
    
    public var level: Percentage
    
    public init(level: Percentage) {
        
        self.level = level
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        guard let level = Percentage(rawValue: data[0])
            else { return nil }
        
        self.init(level: level)
    }
    
    public var data: Data {
        
        return Data([level.rawValue])
    }
}

extension GATTBatteryLevel: Equatable {
    
    public static func == (lhs: GATTBatteryLevel, rhs: GATTBatteryLevel) -> Bool {
        
        return lhs.level == rhs.level
    }
}

extension GATTBatteryLevel: CustomStringConvertible {
    
    public var description: String {
        
        return level.description
    }
}

extension GATTBatteryLevel: Hashable {
    
    public var hashValue: Int {
        
        return Int(level.rawValue)
    }
}
