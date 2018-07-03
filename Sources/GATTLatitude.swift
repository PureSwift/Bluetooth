//
//  GATTLatitude.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 7/3/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 Latitude
 
 The Latitude characteristic describes the WGS84 North coordinate of the device.
 
 - SeeAlso: [Latitude](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.latitude.xml)
 */
public struct GATTLatitude: RawRepresentable, GATTCharacteristic {
    
    internal static let length = MemoryLayout<Int32>.size
    
    public static var uuid: BluetoothUUID { return .latitude }
    
    public let rawValue: Int32
    
    public init(rawValue: Int32) {
        
        self.rawValue = rawValue
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        self.init(rawValue: Int32(bitPattern: UInt32(littleEndian: UInt32(bytes: (data[0], data[1], data[2], data[3])))))
    }
    
    public var data: Data {
        
        let bytes = UInt32(bitPattern: rawValue).littleEndian.bytes
        return Data([bytes.0, bytes.1, bytes.2, bytes.3])
    }
}

extension GATTLatitude: Equatable {
    
    public static func == (lhs: GATTLatitude, rhs: GATTLatitude) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

extension GATTLatitude: CustomStringConvertible {
    
    public var description: String {
        
        return rawValue.description
    }
}

extension GATTLatitude: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: Int32) {
        
        self.init(rawValue: value)
    }
}
