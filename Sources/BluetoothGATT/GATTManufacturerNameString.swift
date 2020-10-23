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
    
    public let rawValue: String
    
    public init(rawValue: String) {
        
        self.rawValue = rawValue
    }
    
    public init?(data: Data) {
        
        guard let rawValue = String(data: data, encoding: .utf8)
            else { return nil }
        
        self.init(rawValue: rawValue)
    }
    
    public var data: Data {
        
        return Data(rawValue.utf8)
    }
}

extension GATTManufacturerNameString: Equatable {
    
    public static func == (lhs: GATTManufacturerNameString, rhs: GATTManufacturerNameString) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

extension GATTManufacturerNameString: CustomStringConvertible {
    
    public var description: String {
        
        return rawValue
    }
}

extension GATTManufacturerNameString: ExpressibleByStringLiteral {
    
    public init(stringLiteral value: String) {
        
        self.init(rawValue: value)
    }
    
    public init(extendedGraphemeClusterLiteral value: String) {
        
        self.init(rawValue: value)
    }
    
    public init(unicodeScalarLiteral value: String) {
        
        self.init(rawValue: value)
    }
}
