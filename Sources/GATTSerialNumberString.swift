//
//  GATTSerialNumberString.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/27/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 Serial Number String
 
 [Serial Number String](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.serial_number_string.xml)
 
 The value of this characteristic is a variable-length UTF-8 string representing the serial number for a particular instance of the device.
 */
public struct GATTSerialNumberString: RawRepresentable, GATTCharacteristic {
    
    public static var uuid: BluetoothUUID { return .serialNumberString }
    
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

extension GATTSerialNumberString: Equatable {
    
    public static func == (lhs: GATTSerialNumberString, rhs: GATTSerialNumberString) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

extension GATTSerialNumberString: CustomStringConvertible {
    
    public var description: String {
        
        return rawValue
    }
}

extension GATTSerialNumberString: ExpressibleByStringLiteral {
    
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
