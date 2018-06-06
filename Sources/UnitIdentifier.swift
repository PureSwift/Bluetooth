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
        
        return rawValue.description
    }
}
