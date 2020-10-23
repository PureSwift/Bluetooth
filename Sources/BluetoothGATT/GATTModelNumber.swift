//
//  GATTModelNumber.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/21/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 Model Number String
 
 [Model Number String](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.model_number_string.xml)
 
 The value of this characteristic is a UTF-8 string representing the model number assigned by the device vendor.
 */
public struct GATTModelNumber: RawRepresentable, GATTCharacteristic {
    
    public static var uuid: BluetoothUUID { return .modelNumberString }
    
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

extension GATTModelNumber: Equatable {
    
    public static func == (lhs: GATTModelNumber, rhs: GATTModelNumber) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

extension GATTModelNumber: CustomStringConvertible {
    
    public var description: String {
        
        return rawValue
    }
}

extension GATTModelNumber: ExpressibleByStringLiteral {
    
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
