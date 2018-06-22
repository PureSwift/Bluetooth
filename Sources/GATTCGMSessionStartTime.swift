//
//  GATTCGMSessionStartTime.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/22/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 CGM Session Start Time
 
 [CGM Session Start Time](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.cgm_session_start_time.xml)
 
 - Note:
 
    C1: Mandatory if device supports E2E-CRC (Bit 12 is set in CGM Feature) otherwise excluded.
 
    The fields in the above table are in the order of LSO to MSO. Where LSO = Least Significant Octet and MSO = Most Significant Octet
 */
public struct GATTCGMSessionStartTime: GATTCharacteristic {
    
    public static var uuid: BluetoothUUID { return .cgmSessionStartTime }
    
    internal static let length = GATTDateTime.length + GATTTimeZone.length + GATTDstOffset.length
    
    public var datetime: GATTDateTime
    
    public var timezone: GATTTimeZone
    
    public var dstOffset: GATTDstOffset
    
    public init(datetime: GATTDateTime, timezone: GATTTimeZone, dstOffset: GATTDstOffset) {
        
        self.datetime = datetime
        self.timezone = timezone
        self.dstOffset = dstOffset
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        var index = 0
        
        guard let datetime = GATTDateTime(data: Data(data[0 ..< GATTDateTime.length]))
            else { return nil }
        
        index += GATTDateTime.length
        
        guard let timezone = GATTTimeZone(rawValue: Int8(bitPattern: data[index]))
            else { return nil }
        
        guard let dstOffset = GATTDstOffset(rawValue: data[index + 1])
            else { return nil }
        
        self.init(datetime: datetime, timezone: timezone, dstOffset: dstOffset)
    }
    
    public var data: Data {
        
        return datetime.data + timezone.data + dstOffset.data
    }
}

extension GATTCGMSessionStartTime: Equatable {
    
    public static func == (lhs: GATTCGMSessionStartTime, rhs: GATTCGMSessionStartTime) -> Bool {
        
        return lhs.datetime == rhs.datetime &&
                lhs.timezone == rhs.timezone &&
                lhs.dstOffset == rhs.dstOffset
    }
}

extension GATTCGMSessionStartTime: CustomStringConvertible {

    public var description: String {
        
        return "\(datetime) \(timezone) \(dstOffset)"
    }
}
