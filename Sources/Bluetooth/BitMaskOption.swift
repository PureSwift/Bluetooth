//
//  BitMaskOption.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 7/22/15.
//  Copyright © 2015 PureSwift. All rights reserved.
//

/// Enum that represents a bit mask flag / option.
///
/// Basically `Swift.OptionSet` for enums.
public protocol BitMaskOption: RawRepresentable, Hashable, CaseIterable where RawValue: FixedWidthInteger { }

public extension Sequence where Element: BitMaskOption {
    
    /// Convert Swift enums for bit mask options into their raw values OR'd.
    var rawValue: Element.RawValue {
        
        @inline(__always)
        get { return reduce(0, { $0 | $1.rawValue }) }
    }
}

public extension BitMaskOption {
    
    /// Whether the enum case is present in the raw value.
    @inline(__always)
    func isContained(in rawValue: RawValue) -> Bool {
        return (self.rawValue & rawValue) != 0
    }
    
    @inline(__always)
    static func from(rawValue: RawValue) -> [Self] {
        return Self.allCases.filter { $0.isContained(in: rawValue) }
    }
}

// MARK: - BitMaskOptionSet

/// Integer-backed array type for `BitMaskOption`.
///
/// The elements are packed in the integer with bitwise math and stored on the stack.
@frozen
public struct BitMaskOptionSet <Element: BitMaskOption>: RawRepresentable {
    
    public typealias RawValue = Element.RawValue
    
    public private(set) var rawValue: RawValue
    
    @inline(__always)
    public init(rawValue: RawValue) {
        self.rawValue = rawValue
    }
    
    @inline(__always)
    public init() {
        self.rawValue = 0
    }
    
    public static var all: BitMaskOptionSet<Element> {
        return BitMaskOptionSet<Element>(rawValue: Element.allCases.rawValue)
    }
    
    @inline(__always)
    public mutating func insert(_ element: Element) {
        rawValue = rawValue | element.rawValue
    }
    
    @discardableResult
    public mutating func remove(_ element: Element) -> Bool {
        
        guard contains(element) else { return false }
        rawValue = rawValue & ~element.rawValue
        return true
    }
    
    @inline(__always)
    public mutating func removeAll() {
        self.rawValue = 0
    }
    
    @inline(__always)
    public func contains(_ element: Element) -> Bool {
        
        return element.isContained(in: rawValue)
    }
    
    public func contains <S: Sequence> (_ other: S) -> Bool where S.Iterator.Element == Element {
        
        for element in other {
            
            guard element.isContained(in: rawValue)
                else { return false }
        }
        
        return true
    }
    
    public var count: Int {
        return Element.allCases.reduce(0, { $0 + ($1.isContained(in: rawValue) ? 1 : 0) })
    }
    
    public var isEmpty: Bool {
        return rawValue == 0
    }
}

// MARK: - Sequence Conversion

public extension BitMaskOptionSet {
    
    init<S: Sequence>(_ sequence: S) where S.Iterator.Element == Element {
        self.rawValue = sequence.rawValue
    }
}

// MARK: - Equatable

extension BitMaskOptionSet: Equatable {
    
    public static func == (lhs: BitMaskOptionSet, rhs: BitMaskOptionSet) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
}

// MARK: - CustomStringConvertible

extension BitMaskOptionSet: CustomStringConvertible {
    
    public var description: String {
        
        return Element.from(rawValue: rawValue)
            .sorted(by: { $0.rawValue < $1.rawValue })
            .description
    }
}

// MARK: - Hashable

extension BitMaskOptionSet: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        rawValue.hash(into: &hasher)
    }
}

// MARK: - ExpressibleByArrayLiteral

extension BitMaskOptionSet: ExpressibleByArrayLiteral {
    
    public init(arrayLiteral elements: Element...) {
        self.init(elements)
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension BitMaskOptionSet: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt64) {
        self.init(rawValue: numericCast(value))
    }
}

// MARK: - Sequence

extension BitMaskOptionSet: Sequence {
    
    public func makeIterator() -> IndexingIterator<[Element]> {
        return Element.from(rawValue: rawValue).makeIterator()
    }
}
