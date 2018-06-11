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
}

public struct PercentageUnit: Unit {
    
    internal static let length = MemoryLayout<UInt8>.size
    
    public static var unitType: UnitIdentifier { return .percentage }

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

public struct MilimetreOfMercuryUnit: Unit {
    
    internal static let length = MemoryLayout<UInt16>.size
    
    public static var unitType: UnitIdentifier { return .millimetreOfMercury }
    
    public var value: UInt16
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let value = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
        
        self.init(rawValue: value)
    }
    
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
    
    internal static let length = MemoryLayout<UInt16>.size
    
    public static var unitType: UnitIdentifier { return .pascalPressure }
    
    public var value: UInt16
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let value = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
        
        self.init(rawValue: value)
    }
    
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
    
    internal static let length = MemoryLayout<UInt16>.size
    
    public static var unitType: UnitIdentifier { return .beatsPerMinute }
    
    public var value: UInt16
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let value = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
        
        self.init(rawValue: value)
    }
    
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

public struct YearUnit: Unit {
    
    internal static let length = MemoryLayout<UInt16>.size
    
    public static var unitType: UnitIdentifier { return .year }
    
    public var value: UInt16
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let value = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
        
        self.init(rawValue: value)
    }
    
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

extension YearUnit: Equatable {
    
    public static func == (lhs: YearUnit, rhs: YearUnit) -> Bool {
        
        return lhs.value == rhs.value
    }
    
}

extension YearUnit: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt16) {
        
        self.init(unsafe: value)
    }
    
}

extension YearUnit: CustomStringConvertible {
    
    public var description: String {
        
        return value.description
    }
    
}

public enum MonthUnit: UInt8, Unit {
    
    internal static let length = MemoryLayout<UInt16>.size
    
    public static var unitType: UnitIdentifier { return .month }
    
    case unknown = 0
    
    case january
    
    case february
    
    case march
    
    case april
    
    case may
    
    case june
    
    case july
    
    case august
    
    case september
    
    case october
    
    case november
    
    case december
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        self.init(rawValue: data[0])
    }
    
    public var data: Data {
        
        return Data([self.rawValue])
    }
    
}

extension MonthUnit: Equatable {
    
    public static func == (lhs: MonthUnit, rhs: MonthUnit) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
    
}

extension MonthUnit: CustomStringConvertible {
    
    public var description: String {
        
        return rawValue.description
    }
    
}

public struct DayUnit: Unit {
    
    internal static let length = MemoryLayout<UInt8>.size
    
    public static var unitType: UnitIdentifier { return .hour }
    
    public var value: UInt8
    
    public init?(rawValue value: UInt8) {
        
        self.value = value
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        self.init(rawValue: data[0])
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

extension DayUnit: Equatable {
    
    public static func == (lhs: DayUnit, rhs: DayUnit) -> Bool {
        
        return lhs.value == rhs.value
    }
    
}

extension DayUnit: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt8) {
        
        self.init(unsafe: value)
    }
    
}

extension DayUnit: CustomStringConvertible {
    
    public var description: String {
        
        return value.description
    }
    
}

public struct HourUnit: Unit {
    
    internal static let length = MemoryLayout<UInt8>.size
    
    public static var unitType: UnitIdentifier { return .hour }
    
    public var value: UInt8
    
    public init?(rawValue value: UInt8) {
        
        self.value = value
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        self.init(rawValue: data[0])
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

extension HourUnit: Equatable {
    
    public static func == (lhs: HourUnit, rhs: HourUnit) -> Bool {
        
        return lhs.value == rhs.value
    }
    
}

extension HourUnit: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt8) {
        
        self.init(unsafe: value)
    }
    
}

extension HourUnit: CustomStringConvertible {
    
    public var description: String {
        
        return value.description
    }
    
}

public struct MinuteUnit: Unit {
    
    internal static let length = MemoryLayout<UInt8>.size
    
    public static var unitType: UnitIdentifier { return .hour }
    
    public var value: UInt8
    
    public init?(rawValue value: UInt8) {
        
        self.value = value
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        self.init(rawValue: data[0])
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

extension MinuteUnit: Equatable {
    
    public static func == (lhs: MinuteUnit, rhs: MinuteUnit) -> Bool {
        
        return lhs.value == rhs.value
    }
    
}

extension MinuteUnit: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt8) {
        
        self.init(unsafe: value)
    }
    
}

extension MinuteUnit: CustomStringConvertible {
    
    public var description: String {
        
        return value.description
    }
    
}

public struct SecondUnit: Unit {
    
    internal static let length = MemoryLayout<UInt8>.size
    
    public static var unitType: UnitIdentifier { return .hour }
    
    public var value: UInt8
    
    public init?(rawValue value: UInt8) {
        
        self.value = value
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        self.init(rawValue: data[0])
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

extension SecondUnit: Equatable {
    
    public static func == (lhs: SecondUnit, rhs: SecondUnit) -> Bool {
        
        return lhs.value == rhs.value
    }
    
}

extension SecondUnit: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt8) {
        
        self.init(unsafe: value)
    }
    
}

extension SecondUnit: CustomStringConvertible {
    
    public var description: String {
        
        return value.description
    }
}
