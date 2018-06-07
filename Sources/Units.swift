//
//  Units.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/6/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

protocol Unit: RawRepresentable {
    
    static var unitType: UnitIdentifier { get }
    
    var data: Data { get }
    
}

public struct PercentageUnit: Unit {
    
    static var unitType: UnitIdentifier { return .percentage }
    
    public var percentage: UInt8
    
    public init?(rawValue percentage: UInt8) {
        
        self.percentage = percentage
    }
    
    fileprivate init(unsafe value: UInt8) {
        
        self.percentage = value
    }
    
    public var rawValue: UInt8 {
        
        return percentage
    }
    
    public var data: Data {
        
        return Data([percentage])
    }
    
}

extension PercentageUnit: Comparable {
    
    public static func == (lhs: PercentageUnit, rhs: PercentageUnit) -> Bool {
        
        return lhs.percentage == rhs.percentage
    }
    
    public static func < (lhs: PercentageUnit, rhs: PercentageUnit) -> Bool {
        
        return lhs.percentage < rhs.percentage
    }
    
    public static func <= (lhs: PercentageUnit, rhs: PercentageUnit) -> Bool {
        
        return lhs.percentage <= rhs.percentage
    }
    
    public static func >= (lhs: PercentageUnit, rhs: PercentageUnit) -> Bool {
        
        return lhs.percentage >= rhs.percentage
    }
    
}

extension PercentageUnit: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt8) {
        
        self.init(unsafe: value)
    }
    
}

extension PercentageUnit: CustomStringConvertible {
    
    public var description: String {
        
        return percentage.description
    }
    
}
