//
//  LowEnergyConnectionIntervalRange.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

/// Value for connection event interval
///
/// Range: 0x0006 to 0x0C80
/// Time = N * 1.25 msec
/// Time Range: 7.5 msec to 4 seconds.
public struct LowEnergyConnectionIntervalRange: RawRepresentable, Equatable {
    
    public typealias RawValue = CountableClosedRange<UInt16>
    
    /// 7.5 msec
    public static let min: UInt16 = 0x0006
    
    /// 4000 msec
    public static let max: UInt16 = 0x0C80
    
    /// Maximum interval range.
    public static let full = LowEnergyConnectionIntervalRange(LowEnergyConnectionIntervalRange.min ... LowEnergyConnectionIntervalRange.max)
    
    public let rawValue: RawValue
    
    public init?(rawValue: RawValue) {
        
        guard rawValue.lowerBound >= LowEnergyConnectionIntervalRange.min,
            rawValue.upperBound <= LowEnergyConnectionIntervalRange.max
            else { return nil }
        
        assert(LowEnergyConnectionIntervalRange.full.rawValue.lowerBound == LowEnergyConnectionIntervalRange.min)
        assert(LowEnergyConnectionIntervalRange.full.rawValue.upperBound == LowEnergyConnectionIntervalRange.max)
        
        assert(rawValue.clamped(to: LowEnergyConnectionIntervalRange.full.rawValue) == rawValue)
        assert(rawValue.overlaps(LowEnergyConnectionIntervalRange.full.rawValue))
        
        self.rawValue = rawValue
    }
    
    // private API, unsafe
    private init(_ unchecked: RawValue) {
        
        self.rawValue = unchecked
    }
    
    /// Time = N * 1.25 msec
    public var miliseconds: ClosedRange<Double> {
        
        let miliseconds = Double(1.25)
        
        let min = Double(rawValue.lowerBound) * miliseconds
        
        let max = Double(rawValue.upperBound) * miliseconds
        
        return min ... max
    }
    
    // Equatable
    public static func == (lhs: LowEnergyConnectionIntervalRange, rhs: LowEnergyConnectionIntervalRange) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}
