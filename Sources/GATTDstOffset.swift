//
//  GATTDstOffset.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/22/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 DST Offset
 
 [DST Offset](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.dst_offset.xml)
 */
public enum GATTDstOffset: UInt8, GATTCharacteristic {
    
    public static var uuid: BluetoothUUID { return .dstOffset }
    
    internal static let length = MemoryLayout<UInt8>.size
    
    /// Standard Time
    case standardTime = 0x00
    
    /// Half An Hour Daylight Time (+0.5h)
    case halfAnHourDaylightTime = 0x02
    
    /// Daylight Time (+1h)
    case daylightTime = 0x04
    
    /// Double Daylight Time (+2h)
    case doubleDayLightTime = 0x08
    
    /// DST is not known
    case unknown = 0xff
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        self.init(rawValue: data[0])
    }
    
    public var data: Data {
        
        return Data([rawValue])
    }
}

extension GATTDstOffset: CustomStringConvertible {
    
    public var description: String {
        
        return rawValue.description
    }
}
