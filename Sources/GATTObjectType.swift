//
//  GATTObjectType.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 7/11/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 Object Type
 
 Description: Unspecified Object Type, 16-bit UUID: << Unspecified Object Type >>
 
 - SeeAlso: [Object Type](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.object_type.xml)
 */
public struct GATTObjectType: RawRepresentable, GATTCharacteristic {
    
    internal static let length = MemoryLayout<UInt16>.size

    public static var uuid: BluetoothUUID { return .objectType }
    
    public let rawValue: BluetoothUUID
    
    public init?(rawValue: BluetoothUUID) {
        
        switch rawValue {
            
        case .bit16: self.rawValue = rawValue
            
        default: return nil
            
        }
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let value = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
        
        let type = BluetoothUUID.bit16(value)
        
        self.init(rawValue: type)
    }
    
    public var data: Data {
        
        return rawValue.littleEndian.data
    }
}

extension GATTObjectType: Equatable {
    
    public static func == (lhs: GATTObjectType, rhs: GATTObjectType) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

extension GATTObjectType: CustomStringConvertible {
    
    public var description: String {
        
        return rawValue.description
    }
}
