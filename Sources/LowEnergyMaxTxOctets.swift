//
//  LowEnergyMaxTxOctets.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

/// Number of microseconds that the local Controller should use to transmit
/// a single Link Layer packet on this connection.
///
/// - Note: Range 0x001B-0x00FB
public struct LowEnergyMaxTxOctets: RawRepresentable, Equatable, Hashable, Comparable {
    
    public static let min = LowEnergyMaxTxOctets(0x001B)
    
    public static let max = LowEnergyMaxTxOctets(0x00FB)
    
    public let rawValue: UInt16
    
    public init?(rawValue: UInt16 = 0x0148) {
        
        guard rawValue >= LowEnergyMaxTxOctets.min.rawValue,
            rawValue <= LowEnergyMaxTxOctets.max.rawValue
            else { return nil }
        
        assert((LowEnergyMaxTxOctets.min.rawValue ... LowEnergyMaxTxOctets.max.rawValue).contains(rawValue))
        
        self.rawValue = rawValue
    }
    
    // Private, unsafe
    private init(_ rawValue: UInt16) {
        self.rawValue = rawValue
    }
    
    // Equatable
    public static func == (lhs: LowEnergyMaxTxOctets, rhs: LowEnergyMaxTxOctets) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
    
    // Comparable
    public static func < (lhs: LowEnergyMaxTxOctets, rhs: LowEnergyMaxTxOctets) -> Bool {
        
        return lhs.rawValue < rhs.rawValue
    }
    
    // Hashable
    public var hashValue: Int {
        
        return Int(rawValue)
    }
}
