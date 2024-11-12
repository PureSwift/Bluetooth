//
//  GATTTimeUpdateControlPoint.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 7/10/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation
import Bluetooth

/**
 Time Update Control Point
 
 - SeeAlso: [Time Update Control Point](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.time_update_control_point.xml)
 */
@frozen
public enum GATTTimeUpdateControlPoint: UInt8, GATTCharacteristic {
    
    internal static let length = MemoryLayout<UInt8>.size
    
    public static var uuid: BluetoothUUID { return .timeUpdateControlPoint }
    
    /// Get Reference Update
    case getReferenceUpdate = 1
    
    /// Cancel Reference Update
    case cancelReferenceUpdate = 2
    
    public init?<Data: DataContainer>(data: Data) {
        
        guard data.count == Self.length
            else { return nil }
        
        self.init(rawValue: data[0])
    }
    
    public var data: Data {
        
        return Data([rawValue])
    }
}
