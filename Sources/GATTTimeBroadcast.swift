//
//  GATTTimeBroadcast.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 7/6/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 Time Broadcast
 
 - SeeAlso: [Time Broadcast](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.time_broadcast.xml)
 */
public struct GATTTimeBroadcast: GATTCharacteristic {
    
    internal static let length =
        GATTExactTime256.length + GATTLocalTimeInformation.length + GATTReferenceTimeInformation.length
    
    public static var uuid: BluetoothUUID { return .timeBroadcast }
    
    public var time: GATTExactTime256
    
    public var localTime: GATTLocalTimeInformation
    
    public var referenceTime: GATTReferenceTimeInformation
    
    public init(time: GATTExactTime256,
                localTime: GATTLocalTimeInformation,
                referenceTime: GATTReferenceTimeInformation) {
        
        self.time = time
        self.localTime = localTime
        self.referenceTime = referenceTime
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        guard let time = GATTExactTime256(data: data.subdata(in: (0 ..< GATTExactTime256.length)))
            else { return nil }
        
        let rangeLocalTime = Range<Int>(GATTExactTime256.length ..< GATTExactTime256.length + GATTLocalTimeInformation.length)
        
        guard let localTime = GATTLocalTimeInformation(data: data.subdata(in: rangeLocalTime))
            else { return nil }
        
        let rangeReferenceTime = Range<Int>(GATTExactTime256.length + GATTLocalTimeInformation.length ..< data.count)
        
        guard let referenceTime = GATTReferenceTimeInformation(data: data.subdata(in: rangeReferenceTime))
            else { return nil }
        
        self.init(time: time, localTime: localTime, referenceTime: referenceTime)
    }
    
    public var data: Data {
        
        return time.data + localTime.data + referenceTime.data
    }
}

extension GATTTimeBroadcast: Equatable {
    
    public static func == (lhs: GATTTimeBroadcast, rhs: GATTTimeBroadcast) -> Bool {
        
        return lhs.time == rhs.time &&
            lhs.localTime == rhs.localTime &&
            lhs.referenceTime == rhs.referenceTime
    }
}
