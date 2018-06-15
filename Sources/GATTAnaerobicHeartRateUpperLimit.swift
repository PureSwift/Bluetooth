//
//  GATTAnaerobicHeartRateUpperLimit.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/15/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 Anaerobic Heart Rate Upper Limit
 
 Upper limit of the heart rate where the user enhances his anaerobic tolerance while exercising.
 
 - SeeAlso: [Anaerobic Heart Rate Upper Limit](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.anaerobic_heart_rate_upper_limit.xml)
 */
public struct GATTAnaerobicHeartRateUpperLimit: GATTCharacteristic {
    
    public typealias BeatsPerMinute = GATTBeatsPerMinute.Byte
    
    internal static let length = MemoryLayout<UInt8>.size
    
    public static var uuid: BluetoothUUID { return .anaerobicHeartRateUpperLimit }
    
    public var beats: BeatsPerMinute
    
    public init(beats: BeatsPerMinute) {
        
        self.beats = beats
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let beats = BeatsPerMinute(rawValue: data[0])
        
        self.init(beats: beats)
    }
    
    public var data: Data {
        
        return Data([beats.rawValue])
    }
    
}

extension GATTAnaerobicHeartRateUpperLimit: Equatable {
    
    public static func == (lhs: GATTAnaerobicHeartRateUpperLimit,
                           rhs: GATTAnaerobicHeartRateUpperLimit) -> Bool {
        
        return lhs.beats == rhs.beats
    }
}

extension GATTAnaerobicHeartRateUpperLimit: CustomStringConvertible {
    
    public var description: String {
        
        return beats.description
    }
}
