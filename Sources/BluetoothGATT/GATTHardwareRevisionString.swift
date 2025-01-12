//
//  GATTHardwareRevisionString.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/27/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation
import Bluetooth

/**
 Hardware Revision String
 
 [Hardware Revision String](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.hardware_revision_string.xml)
 
 The value of this characteristic is a UTF-8 string representing the hardware revision for the hardware within the device.
 */
@frozen
public struct GATTHardwareRevisionString: RawRepresentable, Equatable, Hashable, Sendable, GATTCharacteristic {
    
    public static var uuid: BluetoothUUID { BluetoothUUID.Characteristic.hardwareRevisionString }
    
    public let rawValue: String
    
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

extension GATTHardwareRevisionString: CustomStringConvertible {
    
    public var description: String {
        return rawValue
    }
}

extension GATTHardwareRevisionString: ExpressibleByStringLiteral {
    
    public init(stringLiteral value: String) {
        self.init(rawValue: value)
    }
}
