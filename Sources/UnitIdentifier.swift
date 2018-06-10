//
//  UnitIdentifier.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/6/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

public struct UnitIdentifier: RawRepresentable {
    
    public var rawValue: UInt16
    
    public init(rawValue: UInt16) {
        
        self.rawValue = rawValue
    }
}

// MARK: - Equatable

extension UnitIdentifier: Equatable {
    
    @inline(__always)
    public static func == (lhs: UnitIdentifier, rhs: UnitIdentifier) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

// MARK: - Hashable

extension UnitIdentifier: Hashable {
    
    public var hashValue: Int {
        
        return Int(rawValue)
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension UnitIdentifier: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt16) {
        
        self.init(rawValue: value)
    }
}

// MARK: - CustomStringConvertible

extension UnitIdentifier: CustomStringConvertible {
    
    public var description: String {
        
        let valueString = rawValue.toHexadecimal()
        
        if let name = self.name {
            
            return valueString + " " + "(" + name + ")"
            
        } else {
            
            return valueString
        }
    }
}

// MARK: - Definitions

public extension UnitIdentifier {
    
    /// The name of the unit.
    var name: String? {
        
        return units[rawValue]?.name
    }
    
    /// The Bluetooth type namespace of the unit.
    var type: String? {
        
        return units[rawValue]?.type
    }
}

internal let units: [UInt16: (name: String, type: String)] = [
    
    0x2700: ("unitless", "org.bluetooth.unit.unitless"),
    0x2701: ("length (metre)", "org.bluetooth.unit.length.metre"),
    0x2702: ("mass (kilogram)", "org.bluetooth.unit.mass.kilogram"),
    0x2703: ("time (second)", "org.bluetooth.unit.time.second"),
    
    // TODO: List all units
    
    0x27AD: ("percentage", "org.bluetooth.unit.percentage")
]
