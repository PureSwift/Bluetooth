//
//  GATTCurrentTime.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 7/10/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 Current Time
 
 - SeeAlso: [Current Time](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.current_time.xml)
 */
public struct GATTCurrentTime: GATTCharacteristic {
    
    internal static let length = GATTExactTime256.length + MemoryLayout<UInt8>.size
    
    public static var uuid: BluetoothUUID { return .currentTime }
    
    public var exactTime: GATTExactTime256
    
    public var adjustReason: BitMaskOptionSet<Flag>
    
    public init(exactTime: GATTExactTime256, adjustReason: BitMaskOptionSet<Flag>) {
        
        self.exactTime = exactTime
        self.adjustReason = adjustReason
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        guard let exactTime = GATTExactTime256(data: data.subdata(in: (0 ..< GATTExactTime256.length)))
            else { return nil }
        
        let adjustReason = BitMaskOptionSet<Flag>(rawValue: data[GATTExactTime256.length])
        
        self.init(exactTime: exactTime, adjustReason: adjustReason)
    }
    
    public var data: Data {
        
        return exactTime.data + Data([adjustReason.rawValue])
    }
}

extension GATTCurrentTime {
    
    public enum Flag: UInt8, BitMaskOption {
        
        #if swift(>=3.2)
        #elseif swift(>=3.0)
        public typealias RawValue = UInt8
        #endif
        
        /// Manual time update
        case manualTimeUpdate = 0b01
        
        /// External reference time update
        case externalReference = 0b10
        
        /// Change of time zone
        case timeZoneChange = 0b100
        
        /// Change of DST (daylight savings time)
        case dstChange = 0b1000
        
        public static var all: Set<Flag> = [
            .manualTimeUpdate,
            .externalReference,
            .timeZoneChange,
            .dstChange
        ]
    }
    
}

extension GATTCurrentTime: Equatable {
    
    public static func == (lhs: GATTCurrentTime, rhs: GATTCurrentTime) -> Bool {
        
        return lhs.exactTime == rhs.exactTime &&
            lhs.adjustReason == rhs.adjustReason
    }
}
