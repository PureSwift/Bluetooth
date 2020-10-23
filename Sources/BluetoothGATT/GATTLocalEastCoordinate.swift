//
//  GATTLocalEastCoordinate.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 7/3/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 Local East Coordinate
 
 The Local East characteristic describes the East coordinate of the device using local coordinate system.
 
 - SeeAlso: [Local East Coordinate](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.local_east_coordinate.xml)
 */
public struct GATTLocalEastCoordinate: RawRepresentable, GATTCharacteristic {
    
    internal static let length = MemoryLayout<Int16>.size
    
    public static var uuid: BluetoothUUID { return .localEastCoordinate }
    
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

extension GATTLocalEastCoordinate: Equatable {
    
    public static func == (lhs: GATTLocalEastCoordinate, rhs: GATTLocalEastCoordinate) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

extension GATTLocalEastCoordinate: CustomStringConvertible {
    
    public var description: String {
        
        return rawValue.description
    }
}

extension GATTLocalEastCoordinate: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: Int16) {
        
        self.init(rawValue: value)
    }
}
