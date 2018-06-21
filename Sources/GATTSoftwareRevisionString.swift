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
public struct GATTSoftwareRevisionString: RawRepresentable, GATTCharacteristic {
    
    public static var uuid: BluetoothUUID { return .softwareRevisionString }
    
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
