//
//  Units.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/6/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

public protocol Unit: RawRepresentable {
    
    static var unitType: UnitIdentifier { get }
    
    var data: Data { get }
    
}

public struct PercentageUnit: Unit {
    
    public static var unitType: UnitIdentifier { return .percentage }
    
    public var value: UInt8
    
    public init?(rawValue value: UInt8) {
        
        self.value = value
    }
    
    fileprivate init(unsafe value: UInt8) {
        
        self.value = value
    }
    
    public var rawValue: UInt8 {
        
        return value
    }
    
    public var data: Data {
        
        return Data([value])
    }
    
}

extension PercentageUnit: Comparable {
    
    public static func == (lhs: PercentageUnit, rhs: PercentageUnit) -> Bool {
        
        return lhs.value == rhs.value
    }
    
    public static func < (lhs: PercentageUnit, rhs: PercentageUnit) -> Bool {
        
        return lhs.value < rhs.value
    }
    
    public static func <= (lhs: PercentageUnit, rhs: PercentageUnit) -> Bool {
        
        return lhs.value <= rhs.value
    }
    
    public static func >= (lhs: PercentageUnit, rhs: PercentageUnit) -> Bool {
        
        return lhs.value >= rhs.value
    }
    
}

extension PercentageUnit: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt8) {
        
        self.init(unsafe: value)
    }
    
}

extension PercentageUnit: CustomStringConvertible {
    
    public var description: String {
        
        return value.description
    }
    
}

public struct MilimetreOfMercuryUnit: Unit {
    
    public static var unitType: UnitIdentifier { return .millimetreOfMercury }
    
    public var value: UInt16
    
    public init?(rawValue value: UInt16) {
        
        self.value = value
    }
    
    fileprivate init(unsafe value: UInt16) {
        
        self.value = value
    }
    
    public var rawValue: UInt16 {
        
        return value
    }
    
    public var data: Data {
        
        let bytes = value.littleEndian.bytes
        
        return Data([bytes.0, bytes.1])
    }
    
}

extension MilimetreOfMercuryUnit: Equatable {
    
    public static func == (lhs: MilimetreOfMercuryUnit, rhs: MilimetreOfMercuryUnit) -> Bool {
        
        return lhs.value == rhs.value
    }
    
}

extension MilimetreOfMercuryUnit: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt16) {
        
        self.init(unsafe: value)
    }
    
}

extension MilimetreOfMercuryUnit: CustomStringConvertible {
    
    public var description: String {
        
        return value.description
    }
    
}

public struct PascalUnit: Unit {
    
    public static var unitType: UnitIdentifier { return .pascalPressure }
    
    public var value: UInt16
    
    public init?(rawValue value: UInt16) {
        
        self.value = value
    }
    
    fileprivate init(unsafe value: UInt16) {
        
        self.value = value
    }
    
    public var rawValue: UInt16 {
        
        return value
    }
    
    public var data: Data {
        
        let bytes = value.littleEndian.bytes
        
        return Data([bytes.0, bytes.1])
    }
    
}

extension PascalUnit: Equatable {
    
    public static func == (lhs: PascalUnit, rhs: PascalUnit) -> Bool {
        
        return lhs.value == rhs.value
    }
    
}

extension PascalUnit: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt16) {
        
        self.init(unsafe: value)
    }
    
}

extension PascalUnit: CustomStringConvertible {
    
    public var description: String {
        
        return value.description
    }
    
}

public struct BeatsPerMinuteUnit: Unit {
    
    public static var unitType: UnitIdentifier { return .beatsPerMinute }
    
    public var value: UInt16
    
    public init?(rawValue value: UInt16) {
        
        self.value = value
    }
    
    fileprivate init(unsafe value: UInt16) {
        
        self.value = value
    }
    
    public var rawValue: UInt16 {
        
        return value
    }
    
    public var data: Data {
        
        let bytes = value.littleEndian.bytes
        
        return Data([bytes.0, bytes.1])
    }
    
}

extension BeatsPerMinuteUnit: Equatable {
    
    public static func == (lhs: BeatsPerMinuteUnit, rhs: BeatsPerMinuteUnit) -> Bool {
        
        return lhs.value == rhs.value
    }
    
}

extension BeatsPerMinuteUnit: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt16) {
        
        self.init(unsafe: value)
    }
    
}

extension BeatsPerMinuteUnit: CustomStringConvertible {
    
    public var description: String {
        
        return value.description
    }
    
}
