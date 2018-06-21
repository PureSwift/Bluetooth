//
//  GATTFirmwareRevisionString.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/21/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/*+
 Firmware Revision String
 
 [Firmware Revision String](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.firmware_revision_string.xml)
 
 The value of this characteristic is a UTF-8 string representing the firmware revision for the firmware within the device.
 */
public struct GATTFirmwareRevisionString: RawRepresentable, GATTCharacteristic {
    
    public static var uuid: BluetoothUUID { return .firmwareRevisionString }
    
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

extension GATTFirmwareRevisionString: Equatable {
    
    public static func == (lhs: GATTFirmwareRevisionString, rhs: GATTFirmwareRevisionString) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

extension GATTFirmwareRevisionString: CustomStringConvertible {
    
    public var description: String {
        
        return rawValue
    }
}

extension GATTFirmwareRevisionString: ExpressibleByStringLiteral {
    
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
