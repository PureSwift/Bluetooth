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
@frozen
public struct GATTTimeBroadcast: GATTCharacteristic, Equatable {
    
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
        
        guard let time = GATTExactTime256(data: data.subdataNoCopy(in: (0 ..< GATTExactTime256.length)))
            else { return nil }
        
        let rangeLocalTime = GATTExactTime256.length ..< GATTExactTime256.length + GATTLocalTimeInformation.length
        
        guard let localTime = GATTLocalTimeInformation(data: data.subdataNoCopy(in: rangeLocalTime))
            else { return nil }
        
        let rangeReferenceTime = GATTExactTime256.length + GATTLocalTimeInformation.length ..< data.count
        
        guard let referenceTime = GATTReferenceTimeInformation(data: data.subdataNoCopy(in: rangeReferenceTime))
            else { return nil }
        
        self.init(time: time, localTime: localTime, referenceTime: referenceTime)
    }
    
    public var data: Data {
        
        return time.data + localTime.data + referenceTime.data
    }
}
