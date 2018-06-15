//
//  GATTAerobicThreshold.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 Aerobic Threshold
 
 First metabolic threshold.
 
 - SeeAlso: [Aerobic Threshold](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.aerobic_threshold.xml)
 */

public struct GATTAerobicThreshold: GATTCharacteristic {
    
    public typealias BeatsPerMinute = GATTBeatsPerMinute.Byte
    
    internal static let length = MemoryLayout<UInt8>.size
    
    public static var uuid: BluetoothUUID { return .aerobicThreshold }
    
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

extension GATTAerobicThreshold: Equatable {
    
    public static func == (lhs: GATTAerobicThreshold,
                           rhs: GATTAerobicThreshold) -> Bool {
        
        return lhs.beats == rhs.beats
    }
}

extension GATTAerobicThreshold: CustomStringConvertible {
    
    public var description: String {
        
        return beats.description
    }
}
