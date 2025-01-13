//
//  GATTLocationName.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 7/4/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation
import Bluetooth

/**
 Location Name
 
 The Location Name characteristic describes the name of the location the device is installed in.
 
 - SeeAlso: [Location Name](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.location_name.xml)
 */
@frozen
public struct GATTLocationName: RawRepresentable, GATTCharacteristic {
    
    public static var uuid: BluetoothUUID { BluetoothUUID.Characteristic.locationName }
    
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
