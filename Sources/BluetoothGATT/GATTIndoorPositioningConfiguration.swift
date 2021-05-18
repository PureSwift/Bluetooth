//
//  GATTIndoorPositioningConfiguration.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 7/2/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 Indoor Positioning Configuration
 
 The Indoor Positioning Configuration describes the set of characteristic values included in the Indoor Positioning Service AD type.
 
 - SeeAlso: [Indoor Positioning Configuration](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.indoor_positioning_configuration.xml)
 */
@frozen
public struct GATTIndoorPositioningConfiguration: GATTCharacteristic {
    
    public static var uuid: BluetoothUUID { return .indoorPositioningConfiguration }
    
    internal static let length = MemoryLayout<UInt8>.size
    
    public var configurations: BitMaskOptionSet<Configuration>
    
    public init(configurations: BitMaskOptionSet<Configuration>) {
        
        self.configurations = configurations
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        self.init(configurations: BitMaskOptionSet<Configuration>(rawValue: data[0]))
    }
    
    public var data: Data {
        
        return Data([configurations.rawValue])
    }
}

extension GATTIndoorPositioningConfiguration {
    
    public enum Configuration: UInt8, BitMaskOption {
        
        /// Presence of coordinates in advertising packets
        case coordinates = 0b01
        
        /// Coordinate system used in advertising packets
        case coordinateSystemUsed = 0b10
        
        /// Presence of Tx Power field in advertising packets
        case txPowerField = 0b100
        
        /// Presence of Altitude field in advertising packets
        case altitudeField = 0b1000
        
        /// Presence of Floor Number in advertising packets
        case floorNumber = 0b10000
        
        //Location Name available in the GATT database
        case locationName = 0b100000
        
        public static let allCases: [Configuration] = [
            .coordinates,
            .coordinateSystemUsed,
            .txPowerField,
            .altitudeField,
            .floorNumber,
            .locationName
        ]
    }
    
}
