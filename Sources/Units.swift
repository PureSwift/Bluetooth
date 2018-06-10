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
}

public struct PercentageUnit: Unit {
    
    static var unitType: UnitIdentifier { return .percentage }
    
    public var rawValue: UInt
    
    public init(rawValue: UInt) {
        
        self.rawValue = rawValue
    }
}

extension PercentageUnit: Equatable {
    
    public static func == (lhs: PercentageUnit, rhs: PercentageUnit) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}
    
extension PercentageUnit: Comparable {
    
    public static func < (lhs: PercentageUnit, rhs: PercentageUnit) -> Bool {
        
        return lhs.rawValue < rhs.rawValue
    }
}

extension PercentageUnit: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt) {
        
        self.init(rawValue: value)
    }
}

extension PercentageUnit: CustomStringConvertible {
    
    public var description: String {
        
        return rawValue.description
    }
}
