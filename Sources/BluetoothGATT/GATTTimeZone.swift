//
//  GATTTimeZone.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 7/5/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation
import Bluetooth

/**
 Time Zone
 
 Offset from UTC in number of 15 minutes increments. A value of -128 means that the time zone offset is not known.
 The offset defined in this characteristic is constant, regardless whether daylight savings is in effect.
 
 - SeeAlso: [Time Zone](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.time_zone.xml)
 */
@frozen
public struct GATTTimeZone: RawRepresentable, GATTCharacteristic, Equatable, Hashable {
    
    internal static let length = MemoryLayout<UInt8>.size
    
    internal static let min = GATTTimeZone(-48)
    
    internal static let max = GATTTimeZone(56)
    
    internal static let unknown = GATTTimeZone(-128)
    
    public static var uuid: BluetoothUUID { BluetoothUUID.Characteristic.timeZone }
    
    public let rawValue: Int8
    
    public init?(rawValue: Int8) {
        
        guard rawValue == GATTTimeZone.unknown.rawValue
            || (GATTTimeZone.min.rawValue <= rawValue && GATTTimeZone.max.rawValue >= rawValue)
            else { return nil }
        
        self.rawValue = rawValue
    }
    
    fileprivate init(_ unsafe: Int8) {
        
        self.rawValue = unsafe
    }
    
    public init?<Data: DataContainer>(data: Data) {
        
        guard data.count == Self.length
            else { return nil }
        
        let level = Int8(bitPattern: data[0])
        
        self.init(rawValue: level)
    }
    
    public var data: Data {
        
        let byteValue = UInt8(bitPattern: rawValue)
        
        return Data([byteValue])
    }
    
}
