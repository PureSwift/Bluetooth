//
//  LowEnergyTxChannel.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

/// Bluetooth LE Tx Power Channel
public struct LowEnergyTxChannel: RawRepresentable, Equatable, Hashable, Comparable {
    
    /// 100 msec
    public static let min = LowEnergyTxChannel(0x00)
    
    /// 32 seconds
    public static let max = LowEnergyTxChannel(0x27)
    
    public let rawValue: UInt8
    
    public init?(rawValue: UInt8) {
        guard rawValue >= LowEnergyTxChannel.min.rawValue,
            rawValue <= LowEnergyTxChannel.max.rawValue
            else { return nil }
        
        assert((LowEnergyTxChannel.min.rawValue ... LowEnergyTxChannel.max.rawValue).contains(rawValue))
        
        self.rawValue = rawValue
    }
    
    // Private, unsafe
    private init(_ rawValue: UInt8) {
        self.rawValue = rawValue
    }
    
    // Equatable
    public static func == (lhs: LowEnergyTxChannel, rhs: LowEnergyTxChannel) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
    
    // Comparable
    public static func < (lhs: LowEnergyTxChannel, rhs: LowEnergyTxChannel) -> Bool {
        
        return lhs.rawValue < rhs.rawValue
    }
    
    // Hashable
    public var hashValue: Int {
        
        return Int(rawValue)
    }
}
