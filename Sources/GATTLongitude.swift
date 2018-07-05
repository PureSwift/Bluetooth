//
//  GATTLongitude.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 7/3/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 Longitude
 
 The Longitude characteristic describes the WGS84 East coordinate of the device.
 
 - SeeAlso: [Longitude](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.longitude.xml)
 */
public struct GATTLongitude: RawRepresentable, GATTCharacteristic {
    
    internal static let length = MemoryLayout<Int32>.size
    
    public static var uuid: BluetoothUUID { return .longitude }
    
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

extension GATTLongitude: Equatable {
    
    public static func == (lhs: GATTLongitude, rhs: GATTLongitude) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

extension GATTLongitude: CustomStringConvertible {
    
    public var description: String {
        
        return rawValue.description
    }
}

extension GATTLongitude: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: Int32) {
        
        self.init(rawValue: value)
    }
}
