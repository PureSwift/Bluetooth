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
public struct GATTModelNumber: GATTCharacteristic {
    
    public static var uuid: BluetoothUUID { return .modelNumberString }
    
    public let model: String
    
    public init(model: String) {
        
        self.model = model
    }
    
    public init?(data: Data) {
        
        guard let rawValue = String(data: data, encoding: .utf8)
            else { return nil }
        
        self.init(model: rawValue)
    }
    
    public var data: Data {
        
        return Data(model.utf8)
    }
}

extension GATTModelNumber: Equatable {
    
    public static func == (lhs: GATTModelNumber, rhs: GATTModelNumber) -> Bool {
        
        return lhs.model == rhs.model
    }
}

extension GATTModelNumber: CustomStringConvertible {
    
    public var description: String {
        
        return model
    }
}

extension GATTModelNumber: ExpressibleByStringLiteral {
    
    public init(stringLiteral value: String) {
        
        self.init(model: value)
    }
    
    public init(extendedGraphemeClusterLiteral value: String) {
        
        self.init(model: value)
    }
    
    public init(unicodeScalarLiteral value: String) {
        
        self.init(model: value)
    }
}
