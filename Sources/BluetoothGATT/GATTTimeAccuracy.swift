//
//  GATTTimeAccuracy.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 7/6/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 Time Accuracy
 
 Accuracy (drift) of time information in steps of 1/8 of a second (125ms) compared to a reference time source. Valid range from 0 to 253 (0s to 31.5s). A value of 254 means Accuracy is out of range (> 31.5s). A value of 255 means Accuracy is unknown.
 
 - SeeAlso: [Time Accuracy](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.time_accuracy.xml)
 */
public struct GATTTimeAccuracy: RawRepresentable, GATTCharacteristic {
    
    internal static let length = MemoryLayout<UInt8>.size
    
    public static var uuid: BluetoothUUID { return .timeAccuracy }
    
    public static let outOfRange: GATTTimeAccuracy = 254
    
    public static let unknown: GATTTimeAccuracy = 255
    
    public let rawValue: UInt8
    
    public init(rawValue: UInt8) {
        
        self.rawValue = rawValue
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        self.init(rawValue: data[0])
    }
    
    public var data: Data {
        
        return Data([rawValue])
    }
    
}

extension GATTTimeAccuracy: Equatable {
    
    public static func == (lhs: GATTTimeAccuracy, rhs: GATTTimeAccuracy) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

extension GATTTimeAccuracy: CustomStringConvertible {
    
    public var description: String {
        
        return rawValue.description
    }
}

extension GATTTimeAccuracy: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt8) {
        
        self.init(rawValue: value)
    }
}
