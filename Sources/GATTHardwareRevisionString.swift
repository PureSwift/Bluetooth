//
//  GATTHardwareRevisionString.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/27/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 Hardware Revision String
 
 [Hardware Revision String](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.hardware_revision_string.xml)
 
 The value of this characteristic is a UTF-8 string representing the hardware revision for the hardware within the device.
 */
public struct GATTHardwareRevisionString: RawRepresentable, GATTCharacteristic {
    
    public static var uuid: BluetoothUUID { return .hardwareRevisionString }
    
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

extension GATTHardwareRevisionString: Equatable {
    
    public static func == (lhs: GATTHardwareRevisionString, rhs: GATTHardwareRevisionString) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
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
    
    public init(extendedGraphemeClusterLiteral value: String) {
        
        self.init(rawValue: value)
    }
    
    public init(unicodeScalarLiteral value: String) {
        
        self.init(rawValue: value)
    }
}
