//
//  GATTAnaerobicHeartRateLowerLimit.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/15/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation
import Bluetooth

/**
 Anaerobic Heart Rate Lower Limit
 
 Lower limit of the heart rate where the user enhances his anaerobic tolerance while exercising.
 
 - SeeAlso: [Anaerobic Heart Rate Lower Limit](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.anaerobic_heart_rate_lower_limit.xml)
 */
@frozen
public struct GATTAnaerobicHeartRateLowerLimit: GATTCharacteristic, Equatable, Hashable {
    
    public typealias BeatsPerMinute = GATTBeatsPerMinute.Byte
    
    internal static let length = MemoryLayout<UInt8>.size
    
    public static var uuid: BluetoothUUID { return .anaerobicHeartRateLowerLimit }
    
    public var beats: BeatsPerMinute
    
    public init(beats: BeatsPerMinute) {
        
        self.beats = beats
    }
    
    public init?<Data: DataContainer>(data: Data) {
        
        guard data.count == Self.length
            else { return nil }
        
        let beats = BeatsPerMinute(rawValue: data[0])
        
        self.init(beats: beats)
    }
    
    public var data: Data {
        
        return Data([beats.rawValue])
    }
    
}

extension GATTAnaerobicHeartRateLowerLimit: CustomStringConvertible {
    
    public var description: String {
        
        return beats.description
    }
}
