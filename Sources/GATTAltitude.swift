//
//  GATTAltitude.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/15/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 Altitude
 
 The Altitude characteristic describes the altitude of the device.
 
 - SeeAlso: [Altitude](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.altitude.xml)
 */
public struct GATTAltitude: GATTProfileCharacteristic {
    
    internal static let length = MemoryLayout<UInt16>.size
    
    public static var uuid: BluetoothUUID { return .altitude }
    
    public var altitude: UInt16
    
    public init(altitude: UInt16) {
        
        self.altitude = altitude
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        self.init(altitude: UInt16(littleEndian: UInt16(bytes: (data[0], data[1]))))
    }
    
    public var data: Data {
        
        let bytes = altitude.littleEndian.bytes
        return Data([bytes.0, bytes.1])
    }
}

extension GATTAltitude: Equatable {
    
    public static func == (lhs: GATTAltitude,
                           rhs: GATTAltitude) -> Bool {
        
        return lhs.altitude == rhs.altitude
    }
}

extension GATTAltitude: CustomStringConvertible {
    
    public var description: String {
        
        return altitude.description
    }
}
