//
//  LowEnergyMaxTxTime.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

/// Number of payload octets that the local Controller should include in a single Link Layer
/// packet on this connection.
///
/// - Note: Range 0x0148-0x4290
public struct LowEnergyMaxTxTime: RawRepresentable, Equatable, Hashable, Comparable {
    
    public static let min = LowEnergyMaxTxTime(0x0148)
    
    public static let max = LowEnergyMaxTxTime(0x4290)
    
    public let rawValue: UInt16
    
    public init?(rawValue: UInt16 = 0x001B) {
        
        guard rawValue >= LowEnergyMaxTxTime.min.rawValue,
            rawValue <= LowEnergyMaxTxTime.max.rawValue
            else { return nil }
        
        assert((LowEnergyMaxTxTime.min.rawValue ... LowEnergyMaxTxTime.max.rawValue).contains(rawValue))
        
        self.rawValue = rawValue
    }
    
    // Private, unsafe
    private init(_ rawValue: UInt16) {
        self.rawValue = rawValue
    }
    
    // Equatable
    public static func == (lhs: LowEnergyMaxTxTime, rhs: LowEnergyMaxTxTime) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
    
    // Comparable
    public static func < (lhs: LowEnergyMaxTxTime, rhs: LowEnergyMaxTxTime) -> Bool {
        
        return lhs.rawValue < rhs.rawValue
    }
    
    // Hashable
    public var hashValue: Int {
        
        return Int(rawValue)
    }
}
