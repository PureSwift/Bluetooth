//
//  GATTLocationName.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 7/4/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 Location Name
 
 The Location Name characteristic describes the name of the location the device is installed in.
 
 - SeeAlso: [Location Name](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.location_name.xml)
 */
public struct GATTLocationName: RawRepresentable, GATTCharacteristic {
    
    public static var uuid: BluetoothUUID { return .locationName }
    
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

extension GATTLocationName: Equatable {
    
    public static func == (lhs: GATTLocationName, rhs: GATTLocationName) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

extension GATTLocationName: CustomStringConvertible {
    
    public var description: String {
        
        return rawValue
    }
}

extension GATTLocationName: ExpressibleByStringLiteral {
    
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
