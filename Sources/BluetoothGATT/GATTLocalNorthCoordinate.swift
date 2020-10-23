//
//  GATTLocalNorthCoordinate.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 7/3/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 Local North Coordinate
 
 The Local North characteristic describes the North coordinate of the device using local coordinate system.
 
 - SeeAlso: [Local North Coordinate](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.local_north_coordinate.xml)
 */
public struct GATTLocalNorthCoordinate: RawRepresentable, GATTCharacteristic {
    
    internal static let length = MemoryLayout<Int16>.size
    
    public static var uuid: BluetoothUUID { return .localNorthCoordinate }
    
    public let rawValue: Int16
    
    public init(rawValue: Int16) {
        
        self.rawValue = rawValue
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        self.init(rawValue: Int16(bitPattern: UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))))
    }
    
    public var data: Data {
        
        let bytes = UInt16(bitPattern: rawValue).littleEndian.bytes
        return Data([bytes.0, bytes.1])
    }
}

extension GATTLocalNorthCoordinate: Equatable {
    
    public static func == (lhs: GATTLocalNorthCoordinate, rhs: GATTLocalNorthCoordinate) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

extension GATTLocalNorthCoordinate: CustomStringConvertible {
    
    public var description: String {
        
        return rawValue.description
    }
}

extension GATTLocalNorthCoordinate: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: Int16) {
        
        self.init(rawValue: value)
    }
}
