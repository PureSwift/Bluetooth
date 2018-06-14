//
//  LowEnergyConnectionLength.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

/// Information parameter about the minimum length of connection needed for this LE connection.
///
/// Range: 0x0000 – 0xFFFF
/// Time = N * 0.625 msec.
public struct LowEnergyConnectionLength: RawRepresentable, Equatable {
    
    public typealias RawValue = CountableClosedRange<UInt16>
    
    /// Maximum interval range.
    public static let full = LowEnergyConnectionLength(rawValue: .min ... .max)
    
    public let rawValue: RawValue
    
    public init(rawValue: RawValue) {
        
        self.rawValue = rawValue
    }
    
    /// Time = N * 0.625 msec.
    public var miliseconds: ClosedRange<Double> {
        
        let miliseconds = Double(0.625)
        
        let min = Double(rawValue.lowerBound) * miliseconds
        
        let max = Double(rawValue.upperBound) * miliseconds
        
        return min ... max
    }
    
    // Equatable
    public static func == (lhs: LowEnergyConnectionLength, rhs: LowEnergyConnectionLength) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}
