//
//  LowEnergyTxPower.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

/// Bluetooth LE Tx Power
///
/// Units: dBm
/// 127 Host has no preference
public struct LowEnergyTxPower: RawRepresentable, Equatable, Hashable, Comparable {
    
    public static let min = LowEnergyTxPower(-127)
    
    public static let max = LowEnergyTxPower(126)
    
    public let rawValue: Int8
    
    public init?(rawValue: Int8) {
        
        guard rawValue >= LowEnergyTxPower.min.rawValue,
            rawValue <= LowEnergyTxPower.max.rawValue
            else { return nil }
        
        assert((LowEnergyTxPower.min.rawValue ... LowEnergyTxPower.max.rawValue).contains(rawValue))
        
        self.rawValue = rawValue
    }
    
    // Private, unsafe
    private init(_ rawValue: Int8) {
        self.rawValue = rawValue
    }
    
    // Equatable
    public static func == (lhs: LowEnergyTxPower, rhs: LowEnergyTxPower) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
    
    // Comparable
    public static func < (lhs: LowEnergyTxPower, rhs: LowEnergyTxPower) -> Bool {
        
        return lhs.rawValue < rhs.rawValue
    }
    
    // Hashable
    public var hashValue: Int {
        
        return Int(rawValue)
    }
}
