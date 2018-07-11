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
public struct GATTAltitude: RawRepresentable, GATTCharacteristic {
    
    internal static let length = MemoryLayout<UInt16>.size
    
    public static var uuid: BluetoothUUID { return .altitude }
    
    public let rawValue: UInt16
    
    public init(rawValue: UInt16) {
        
        self.rawValue = rawValue
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        self.init(rawValue: UInt16(littleEndian: UInt16(bytes: (data[0], data[1]))))
    }
    
    public var data: Data {
        
        let bytes = rawValue.littleEndian.bytes
        return Data([bytes.0, bytes.1])
    }
}

extension GATTAltitude: Equatable {
    
    public static func == (lhs: GATTAltitude, rhs: GATTAltitude) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

extension GATTAltitude: CustomStringConvertible {
    
    public var description: String {
        
        return rawValue.description
    }
}

extension GATTAltitude: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt16) {
        
        self.init(rawValue: value)
    }
}
