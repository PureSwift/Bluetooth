//
//  GATTTimeWithDst.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 7/10/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 Time with DST
 
 - SeeAlso: [Time with DST](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.time_with_dst.xml)
 */
public struct GATTTimeWithDst: GATTCharacteristic {
    
    internal static let length = GATTDateTime.length + GATTDstOffset.length
    
    public static var uuid: BluetoothUUID { return .timeWithDst }
    
    public var datetime: GATTDateTime
    
    public var dstOffset: GATTDstOffset
    
    public init(datetime: GATTDateTime, dstOffset: GATTDstOffset) {
        
        self.datetime = datetime
        self.dstOffset = dstOffset
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        guard let datetime = GATTDateTime(data: data.subdata(in: (0 ..< GATTDateTime.length)))
            else { return nil }
        
        let range = Range<Int>(GATTDateTime.length ..< GATTDateTime.length + GATTDstOffset.length)
        
        guard let dstOffset = GATTDstOffset(data: data.subdata(in: range))
            else { return nil }
        
        self.init(datetime: datetime, dstOffset: dstOffset)
    }
    
    public var data: Data {
        
        return datetime.data + dstOffset.data
    }
}

extension GATTTimeWithDst: Equatable {
    
    public static func == (lhs: GATTTimeWithDst, rhs: GATTTimeWithDst) -> Bool {
        
        return lhs.datetime == rhs.datetime && lhs.dstOffset == rhs.dstOffset
    }
}
