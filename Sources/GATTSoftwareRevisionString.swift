//
//  GATTSoftwareRevisionString.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/21/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 Software Revision String
 
 [Software Revision String](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.software_revision_string.xml)
 
 The value of this characteristic is a UTF-8 string representing the software revision for the software within the device.
 */
public struct GATTSoftwareRevisionString: GATTCharacteristic {
    
    public static var uuid: BluetoothUUID { return .softwareRevisionString }
    
    public let software: String
    
    public init(software: String) {
        
        self.software = software
    }
    
    public init?(data: Data) {
        
        guard let rawValue = String(data: data, encoding: .utf8)
            else { return nil }
        
        self.init(software: rawValue)
    }
    
    public var data: Data {
        
        return Data(software.utf8)
    }
}

extension GATTSoftwareRevisionString: Equatable {
    
    public static func == (lhs: GATTSoftwareRevisionString, rhs: GATTSoftwareRevisionString) -> Bool {
        
        return lhs.software == rhs.software
    }
}

extension GATTSoftwareRevisionString: CustomStringConvertible {
    
    public var description: String {
        
        return software
    }
}

extension GATTSoftwareRevisionString: ExpressibleByStringLiteral {
    
    public init(stringLiteral value: String) {
        
        self.init(software: value)
    }
    
    public init(extendedGraphemeClusterLiteral value: String) {
        
        self.init(software: value)
    }
    
    public init(unicodeScalarLiteral value: String) {
        
        self.init(software: value)
    }
}
