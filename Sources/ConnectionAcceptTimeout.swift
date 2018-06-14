//
//  ConnectionAcceptTimeout.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

/// Connection Accept Timeout measured in Number of BR/EDR Baseband slots.
///
/// - Note: Interval Length = N * 0.625 ms (1 Baseband slot)
///
/// Range for N: 0x0001 – 0xB540
///
/// Time Range: 0.625 ms - 29 s
public struct ConnectionAcceptTimeout: RawRepresentable, Equatable, Hashable, Comparable {
    
    public static let length = MemoryLayout<UInt16>.size
    
    /// 0.625 ms
    public static let min = ConnectionAcceptTimeout(0x0001)
    
    /// 29 seconds
    public static let max = ConnectionAcceptTimeout(0xB540)
    
    public let rawValue: UInt16
    
    public init?(rawValue: UInt16) {
        
        guard rawValue >= type(of: self).min.rawValue,
            rawValue <= type(of: self).max.rawValue
            else { return nil }
        
        self.rawValue = rawValue
        
        assert((type(of: self).min.rawValue ... type(of: self).max.rawValue).contains(rawValue))
    }
    
    /// Time = N * 0.625 ms
    ///
    /// Time Range: 0.625 ms - 29 s
    public var miliseconds: Double {
        
        return Double(rawValue) * 0.625
    }
    
    // Private, unsafe
    private init(_ rawValue: UInt16) {
        self.rawValue = rawValue
    }
    
    // Equatable
    public static func == (lhs: ConnectionAcceptTimeout, rhs: ConnectionAcceptTimeout) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
    
    // Comparable
    public static func < (lhs: ConnectionAcceptTimeout, rhs: ConnectionAcceptTimeout) -> Bool {
        
        return lhs.rawValue < rhs.rawValue
    }
    
    // Hashable
    public var hashValue: Int {
        
        return Int(rawValue)
    }
}
