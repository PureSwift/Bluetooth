//
//  GATTUncertainty.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 7/4/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 Uncertainty
 
 The Uncertainty characteristic describes the uncertainty of the location information the device exposes.
 
 - SeeAlso: [Uncertainty](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.uncertainty.xml)
 */
public struct GATTUncertainty: GATTCharacteristic {
    
    internal static let length = MemoryLayout<UInt8>.size
    
    public static var uuid: BluetoothUUID { return .uncertainty }
    
    public var stationary: Stationary
    
    public var updateTime: UpdateTime
    
    public var precision: Precision
    
    public init(stationary: Stationary, updateTime: UpdateTime, precision: Precision) {
        
        self.stationary = stationary
        self.updateTime = updateTime
        self.precision = precision
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        guard let stationary = Stationary(rawValue: data[0] & 0b0000_0001),
            let updateTime = UpdateTime(rawValue: (data[0] & 0b0000_1110) >> 1),
            let precision = Precision(rawValue: (data[0] & 0b0111_0000) >> 4)
            else { return nil }
        
        self.init(stationary: stationary, updateTime: updateTime, precision: precision)
    }
    
    public var data: Data {
        
        let byte = stationary.rawValue | (updateTime.rawValue << 1) | (precision.rawValue << 4)
        
        return Data([byte])
    }
}

public extension GATTUncertainty {
    
    public enum Stationary: UInt8 {
        
        /// Stationary
        case stationary = 0x00
        
        /// Mobile
        case mobile = 0x01
    }
    
    public enum UpdateTime: UInt8 {
        
        /// Upto 3s
        case upTo3s = 0x00
        
        /// Upto 4s
        case upTo4s = 0x01
        
        /// Upto 5s
        case upTo6s = 0x02
        
        /// Upto 12s
        case upTo12s = 0x03
        
        /// Upto 28s
        case upTo28s = 0x04
        
        /// Upto 89s
        case upTo89s = 0x05
        
        /// Upto 426s
        case upTo426s = 0x06
        
        /// Upto 3541s
        case upTo3541s = 0x07
    }
    
    public enum Precision: UInt8 {
        
        /// Less than 0.1m
        case lessThan10cm = 0x00
        
        /// 0.1-1m
        case between10cmTo1m = 0x01
        
        /// 1-2m
        case between1mTo2m = 0x02
        
        /// 2-5m
        case between2mTo5m = 0x03
        
        /// 5-10m
        case between5mTo10m = 0x04
        
        /// 10-50m
        case between10mTo50m = 0x05
        
        /// Greater then 50m
        case greaterThen50m = 0x06
        
        /// Unknown
        case unknown = 0x07
    }
}

extension GATTUncertainty: Equatable {
    
    public static func == (lhs: GATTUncertainty, rhs: GATTUncertainty) -> Bool {
        
        return lhs.stationary == rhs.stationary
            && lhs.updateTime == rhs.updateTime
            && lhs.precision == rhs.precision
    }
}
