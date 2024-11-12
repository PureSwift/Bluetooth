//
//  GATTManufacturerNameString.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/21/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Bluetooth

/**
 Manufacturer Name String
 
 The value of this characteristic is a UTF-8 string representing the name of the manufacturer of the device.
 
 [Manufacturer Name String](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.manufacturer_name_string.xml)
 */
@frozen
public struct GATTManufacturerNameString: GATTCharacteristic, Hashable, Sendable {
    
    public static var uuid: BluetoothUUID { .manufacturerNameString }
    
    public var rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
    
    public init?<Data: DataContainer>(data: Data) {
        guard let rawValue = String(utf8: data)
            else { return nil }
        self.init(rawValue: rawValue)
    }
    
    public func append<Data>(to data: inout Data) where Data : DataContainer {
        data += rawValue.utf8
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
}
