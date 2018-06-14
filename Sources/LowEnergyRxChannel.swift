//
//  LowEnergyRxChannel.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

/// Bluetooth LE Rx Channel
public struct LowEnergyRxChannel: RawRepresentable, Equatable, Hashable, Comparable {
    
    /// 100 msec
    public static let min = LowEnergyRxChannel(0x00)
    
    /// 32 seconds
    public static let max = LowEnergyRxChannel(0x27)
    
    public let rawValue: UInt8
    
    public init?(rawValue: UInt8) {
        guard rawValue >= LowEnergyRxChannel.min.rawValue,
            rawValue <= LowEnergyRxChannel.max.rawValue
            else { return nil }
        
        assert((LowEnergyRxChannel.min.rawValue ... LowEnergyRxChannel.max.rawValue).contains(rawValue))
        
        self.rawValue = rawValue
    }
    
    // Private, unsafe
    private init(_ rawValue: UInt8) {
        self.rawValue = rawValue
    }
    
    // Equatable
    public static func == (lhs: LowEnergyRxChannel, rhs: LowEnergyRxChannel) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
    
    // Comparable
    public static func < (lhs: LowEnergyRxChannel, rhs: LowEnergyRxChannel) -> Bool {
        
        return lhs.rawValue < rhs.rawValue
    }
    
    // Hashable
    public var hashValue: Int {
        
        return Int(rawValue)
    }
}
