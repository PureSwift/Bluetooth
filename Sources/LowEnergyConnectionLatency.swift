//
//  LowEnergyConnectionLatency.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

/// Slave latency for the connection in number of connection events.
///
/// Range: 0x0000 to 0x01F3
public struct LowEnergyConnectionLatency: RawRepresentable, Equatable, Hashable, Comparable {
    
    public static var zero: LowEnergyConnectionLatency { return LowEnergyConnectionLatency() }
    
    public let rawValue: UInt16
    
    public init() {
        
        self.rawValue = 0
    }
    
    public init?(rawValue: UInt16) {
        
        guard rawValue <= 0x01F3
            else { return nil }
        
        self.rawValue = rawValue
    }
    
    // Equatable
    public static func == (lhs: LowEnergyConnectionLatency, rhs: LowEnergyConnectionLatency) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
    
    // HashableUInt12
    public var hashValue: Int {
        
        return Int(rawValue)
    }
    
    // Comparable
    public static func < (lhs: LowEnergyConnectionLatency, rhs: LowEnergyConnectionLatency) -> Bool {
        
        return lhs.rawValue < rhs.rawValue
    }
}
