//
//  GATTSoftwareRevisionString.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/21/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation
import Bluetooth

/**
 Software Revision String
 
 [Software Revision String](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.software_revision_string.xml)
 
 The value of this characteristic is a UTF-8 string representing the software revision for the software within the device.
 */
@frozen
public struct GATTSoftwareRevisionString: RawRepresentable, GATTCharacteristic {
    
    public static var uuid: BluetoothUUID { BluetoothUUID.Characteristic.softwareRevisionString }
    
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

extension GATTSoftwareRevisionString: Equatable {
    
    public static func == (lhs: GATTSoftwareRevisionString, rhs: GATTSoftwareRevisionString) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

extension GATTSoftwareRevisionString: CustomStringConvertible {
    
    public var description: String {
        
        return rawValue
    }
}

extension GATTSoftwareRevisionString: ExpressibleByStringLiteral {
    
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
