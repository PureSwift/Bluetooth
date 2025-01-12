//
//  GATTObjectID.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 7/11/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation
import Bluetooth

/**
 Object ID
 
 - SeeAlso: [Object ID](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.object_id.xml)
 */
@frozen
public struct GATTObjectID: Equatable, RawRepresentable, GATTCharacteristic {
    
    internal static let length = MemoryLayout<UInt48>.size
    
    public static var uuid: BluetoothUUID { BluetoothUUID.Characteristic.objectId }
    
    internal static var min: UInt48 { UInt48(256) }
    
    internal static var max: UInt48 { UInt48(281474976710655) }
    
    public let rawValue: UInt48
    
    public init?(rawValue: UInt48) {
        
        guard rawValue <= GATTObjectID.max,
            rawValue >= GATTObjectID.min
            else { return nil }
        
        self.rawValue = rawValue
    }
    
    public init?<Data: DataContainer>(data: Data) {
        
        guard data.count == Self.length
            else { return nil }
        
        let rawValue = UInt48(littleEndian: UInt48(bytes: (data[0], data[1], data[2], data[3], data[4], data[5])))
        
        self.init(rawValue: rawValue)
    }
    
    public var data: Data {
        
        let bytes = rawValue.littleEndian.bytes
        
        return Data([bytes.0, bytes.1, bytes.2, bytes.3, bytes.4, bytes.5])
    }
}

extension GATTObjectID: CustomStringConvertible {
    
    public var description: String {
        return rawValue.description
    }
}
