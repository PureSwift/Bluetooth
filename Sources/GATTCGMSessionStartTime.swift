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
    
    internal static let minLength = GATTDateTime.length + GATTTimeZone.length + GATTDstOffset.length
    
    internal static let maxLength = minLength + GATTE2ecrc.length
    
    public var datetime: GATTDateTime
    
    public var timezone: GATTTimeZone
    
    public var dstOffset: GATTDstOffset
    
    public var e2ecrc: GATTE2ecrc?
    
    public init(datetime: GATTDateTime, timezone: GATTTimeZone, dstOffset: GATTDstOffset, e2ecrc: GATTE2ecrc? = nil) {
        
        self.datetime = datetime
        self.timezone = timezone
        self.dstOffset = dstOffset
        self.e2ecrc = e2ecrc
    }
    
    public init?(data: Data) {
        
        guard data.count >= type(of: self).minLength
            else { return nil }
        
        var index = 0
        
        guard let datetime = GATTDateTime(data: Data(data[0 ..< GATTDateTime.length]))
            else { return nil }
        
        index += GATTDateTime.length
        
        guard let timezone = GATTTimeZone(rawValue: Int8(bitPattern: data[index]))
            else { return nil }
        
        guard let dstOffset = GATTDstOffset(rawValue: data[index + 1])
            else { return nil }
        
        let validLength = (data.count == type(of: self).maxLength)
        let e2ecrc: GATTE2ecrc? = validLength ? GATTE2ecrc(rawValue: UInt16(littleEndian: UInt16(bytes: (data[index + 2], data[index + 3])))) : nil
        
        self.init(datetime: datetime, timezone: timezone, dstOffset: dstOffset, e2ecrc: e2ecrc)
    }
    
    public var data: Data {
        
        let totalBytes = e2ecrc != nil ? type(of: self).maxLength : type(of: self).minLength
        
        var data = Data()
        data.reserveCapacity(totalBytes)
        
        data += datetime.data + timezone.data + dstOffset.data
        
        if let e2ecrcBytes = e2ecrc?.rawValue.littleEndian.bytes {
            
            data += [e2ecrcBytes.0, e2ecrcBytes.1]
        }
        
        return data
    }
}

extension GATTCGMSessionStartTime: Equatable {
    
    public static func == (lhs: GATTCGMSessionStartTime, rhs: GATTCGMSessionStartTime) -> Bool {
        
        return lhs.datetime == rhs.datetime &&
                lhs.timezone == rhs.timezone &&
                lhs.dstOffset == rhs.dstOffset &&
                lhs.e2ecrc == rhs.e2ecrc
    }
}
