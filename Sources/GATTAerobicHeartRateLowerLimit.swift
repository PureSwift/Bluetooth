//
//  GATTAerobicHeartRateLowerLimit.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 Aerobic Heart Rate Lower Limit
 
 Lower limit of the heart rate where the user enhances his endurance while exercising
 
 - SeeAlso: [Aerobic Heart Rate Lower Limit](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.aerobic_heart_rate_lower_limit.xml)
 */
public struct GATTAerobicHeartRateLowerLimit: GATTCharacteristic {
    
    public typealias BeatsPerMinute = GATTBeatsPerMinute.Byte
    
    internal static let length = MemoryLayout<UInt8>.size
    
    public static var uuid: BluetoothUUID { return .aerobicHeartRateLowerLimit }
    
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

extension GATTAerobicHeartRateLowerLimit: Equatable {
    
    public static func == (lhs: GATTAerobicHeartRateLowerLimit,
                           rhs: GATTAerobicHeartRateLowerLimit) -> Bool {
        
        return lhs.beats == rhs.beats
    }
}

extension GATTAerobicHeartRateLowerLimit: CustomStringConvertible {
    
    public var description: String {
        
        return beats.description
    }
}
