//
//  RSSI.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 4/11/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

/// RSSI
///
/// Size: 1 Octet (signed integer)
/// Range: -127 ≤ N ≤ +20
/// Units: dBm
public struct RSSI: RawRepresentable, Equatable, Comparable, Hashable {
    
    /// Units: dBm
    public let rawValue: Int8
    
    public init?(rawValue: Int8) {
        
        guard -127 <= rawValue,
            rawValue <= +20
            else { return nil }
        
        self.rawValue = rawValue
    }
    
    // Equatable
    public static func == (lhs: RSSI, rhs: RSSI) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
    
    // Comparable
    public static func < (lhs: RSSI, rhs: RSSI) -> Bool {
        
        return lhs.rawValue < rhs.rawValue
    }
    
    // Hashable
    public var hashValue: Int {
        
        return Int(rawValue)
    }
}
