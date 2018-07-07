//
//  GATTLocalTimeInformation.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 7/6/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 Local Time Information
 
 - SeeAlso: [Local Time Information](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.local_time_information.xml)
 */
public struct GATTLocalTimeInformation: GATTCharacteristic {
    
    internal static let length = GATTTimeZone.length + GATTDstOffset.length
    
    public static var uuid: BluetoothUUID { return .localTimeInformation }
    
    public var timeZone: GATTTimeZone
    
    public var dstOffset: GATTDstOffset
    
    public init(timeZone: GATTTimeZone, dstOffset: GATTDstOffset) {
        
        self.timeZone = timeZone
        self.dstOffset = dstOffset
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        guard let timeZone = GATTTimeZone(data: data.subdata(in: (0 ..< GATTTimeZone.length)))
            else { return nil }
        
        guard let dstOffset = GATTDstOffset(data: data.subdata(in: (GATTTimeZone.length ..< 2)))
            else { return nil }
        
        self.init(timeZone: timeZone, dstOffset: dstOffset)
    }
    
    public var data: Data {
        
        return timeZone.data + dstOffset.data
    }
}

extension GATTLocalTimeInformation: Equatable {
    
    public static func == (lhs: GATTLocalTimeInformation, rhs: GATTLocalTimeInformation) -> Bool {
        
        return lhs.timeZone == rhs.timeZone && lhs.dstOffset == rhs.dstOffset
    }
}
