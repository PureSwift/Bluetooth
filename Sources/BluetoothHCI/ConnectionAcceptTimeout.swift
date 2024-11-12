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
@frozen
public struct ConnectionAcceptTimeout: RawRepresentable, Equatable, Hashable {
    
    public static let length = MemoryLayout<UInt16>.size
    
    /// 0.625 ms
    public static var min: Self { ConnectionAcceptTimeout(0x0001) }
    
    /// 29 seconds
    public static var max: Self { ConnectionAcceptTimeout(0xB540) }
    
    public let rawValue: UInt16
    
    public init?(rawValue: UInt16) {
        
        guard rawValue >= Self.min.rawValue,
            rawValue <= Self.max.rawValue
            else { return nil }
        
        self.rawValue = rawValue
        
        assert((Self.min.rawValue ... Self.max.rawValue).contains(rawValue))
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
}

extension ConnectionAcceptTimeout: Comparable {
    
    public static func < (lhs: ConnectionAcceptTimeout, rhs: ConnectionAcceptTimeout) -> Bool {
        
        return lhs.rawValue < rhs.rawValue
    }
}
