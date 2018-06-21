//
//  GATTManufacturerNameString.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/21/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 Manufacturer Name String
 
 The value of this characteristic is a UTF-8 string representing the name of the manufacturer of the device.
 
 [Manufacturer Name String](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.manufacturer_name_string.xml)
 */
public struct GATTManufacturerNameString: GATTCharacteristic {
    
    public static var uuid: BluetoothUUID { return .manufacturerNameString }
    
    public let manufacturer: String
    
    public init(manufacturer: String) {
        
        self.manufacturer = manufacturer
    }
    
    public init?(data: Data) {
        
        guard let rawValue = String(data: data, encoding: .utf8)
            else { return nil }
        
        self.init(manufacturer: rawValue)
    }
    
    public var data: Data {
        
        return Data(manufacturer.utf8)
    }
}

extension GATTManufacturerNameString: Equatable {
    
    public static func == (lhs: GATTManufacturerNameString, rhs: GATTManufacturerNameString) -> Bool {
        
        return lhs.manufacturer == rhs.manufacturer
    }
}

extension GATTManufacturerNameString: CustomStringConvertible {
    
    public var description: String {
        
        return manufacturer
    }
}

extension GATTManufacturerNameString: ExpressibleByStringLiteral {
    
    public init(stringLiteral value: String) {
        
        self.init(manufacturer: value)
    }
    
    public init(extendedGraphemeClusterLiteral value: String) {
        
        self.init(manufacturer: value)
    }
    
    public init(unicodeScalarLiteral value: String) {
        
        self.init(manufacturer: value)
    }
}
