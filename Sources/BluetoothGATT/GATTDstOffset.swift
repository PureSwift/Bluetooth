//
//  GATTDstOffset.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 7/6/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation
import Bluetooth

/**
 DST Offset
 
 - SeeAlso: [DST Offset](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.dst_offset.xml)
 */
@frozen
public enum GATTDstOffset: UInt8, GATTCharacteristic {
    
    internal static let length = MemoryLayout<UInt8>.size
    
    public static var uuid: BluetoothUUID { return .dstOffset }
    
    /// Standard Time
    case standardTime = 0
    
    /// Half An Hour Daylight Time (+0.5h)
    case halfAndHourDaylightTime = 2
    
    /// Daylight Time (+1h)
    case daylightTime = 4
    
    /// Double Daylight Time (+2h)
    case doubleDaylightTime = 8
    
    /// DST is not known
    case unknown = 255
    
    public init?<Data: DataContainer>(data: Data) {
        
        guard data.count == Self.length
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
