//
//  GATTObjectName.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 7/11/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation
import Bluetooth

/**
 Object Name
 
 Characters which require more than one octet when encoded in UTF-8 are transmitted with the leading byte first, followed by the continuation bytes ordered in accordance with UTF-8 encoding.
 In UTF-8, the leading byte is identified by possessing two or more high-order 1’s followed by a 0 while continuation bytes all have '10' in the high-order position.
 Strings which consist of more than one character are transmitted in the following order: the character which appears furthest to the left when the string is presented in its written form shall be sent first, followed by the remaining characters in order.
 
 - SeeAlso: [Object Name](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.object_name.xml)
 */
@frozen
public struct GATTObjectName: Equatable, Hashable, RawRepresentable, GATTCharacteristic {
    
    internal static let length = 120
    
    public static var uuid: BluetoothUUID { return .objectName }
    
    public let rawValue: String
    
    public init?(rawValue: String) {
        
        guard rawValue.utf8.count <= Self.length
            else { return nil }
        
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

extension GATTObjectName: CustomStringConvertible {
    
    public var description: String {
        
        return rawValue
    }
}
