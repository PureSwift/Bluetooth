//
//  GATTBatteryService.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/5/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 The Battery Service exposes the state of a battery within a device.
 
 The Battery Service exposes the Battery State and Battery Level of a single battery or set of batteries in a device.
 
 This service has no dependencies on other GATT-based services.
 */
public struct GATTBatteryService: GATTProfileService {
    
    public static let UUID: BluetoothUUID = .batteryService

    public struct BatteryLevel: GATTProfileCharacteristic {
        
        internal static let max: BatteryLevel = 100
        
        internal static let min: BatteryLevel = 0
        
        internal static let length = 1
        
        public static let UUID: BluetoothUUID = .batteryLevel
        
        public var level: UInt8
        
        public init?(level: UInt8) {
            
            guard BatteryLevel.min.level <= level, BatteryLevel.max.level >= level
                else { return nil }
            
            self.level = level
        }
        
        fileprivate init(unsafe value: UInt8) {
            
            self.level = value
        }
        
        public init?(data: Data) {
            
            guard data.count == type(of: self).length
                else { return nil }
            
            self.init(level: data[0])
        }
        
        public var data: Data {
            
            return Data([level])
        }
        
        public var characteristic: GATT.Characteristic {
            
            return GATT.Characteristic(uuid: type(of: self).UUID, value: data, permissions: [], properties: [.read], descriptors: [])
        }
        
    }
    
}

extension GATTBatteryService.BatteryLevel: Equatable {
    
    public static func == (lhs: GATTBatteryService.BatteryLevel,
                           rhs: GATTBatteryService.BatteryLevel) -> Bool {
        
        return lhs.level == rhs.level
    }
    
}

extension GATTBatteryService.BatteryLevel: ExpressibleByIntegerLiteral {

    public init(integerLiteral value: UInt8) {
        
        self.init(unsafe: value)
    }
    
}

extension GATTBatteryService.BatteryLevel: CustomStringConvertible {
    
    public var description: String {
        
        return level.description
    }
}
