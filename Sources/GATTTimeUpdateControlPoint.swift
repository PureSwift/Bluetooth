//
//  GATTTimeUpdateControlPoint.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 7/10/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 Time Update Control Point
 
 - SeeAlso: [Time Update Control Point](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.time_update_control_point.xml)
 */
public enum GATTTimeUpdateControlPoint: UInt8, GATTCharacteristic {
    
    internal static let length = MemoryLayout<UInt8>.size
    
    public static var uuid: BluetoothUUID { return .timeUpdateControlPoint }
    
    /// Get Reference Update
    case getReferenceUpdate = 1
    
    /// Cancel Reference Update
    case cancelReferenceUpdate = 2
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        self.init(rawValue: data[0])
    }
    
    public var data: Data {
        
        return Data([rawValue])
    }
}

extension GATTTimeUpdateControlPoint: Equatable {
    
    public static func == (lhs: GATTTimeUpdateControlPoint, rhs: GATTTimeUpdateControlPoint) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

extension GATTTimeUpdateControlPoint: CustomStringConvertible {
    
    public var description: String {
        
        return rawValue.description
    }
    
}
