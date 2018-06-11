//
//  SFloat.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/11/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// IEEE-11073 16-bit SFLOAT
public struct SFloat {
    
    internal private(set) var builtin: UInt16
    
    internal init(builtin: UInt16) {
        
        self.builtin = builtin
    }
    
    /// Creates a value initialized to zero.
    public init() {
        
        fatalError()
    }
    
    public init(_ value: Float) {
        
        fatalError()
    }
}

public extension Float {
    
    init(_ value: SFloat) {
        
        fatalError()
    }
}

// MARK: - Equatable

extension SFloat: Equatable {
    
    public static func == (lhs: SFloat, rhs: SFloat) -> Bool {
        
        return lhs.builtin == rhs.builtin
    }
}

// MARK: - Hashable

extension SFloat: Hashable {
    
    public var hashValue: Int {
        
        return Int(builtin.hashValue)
    }
}

// MARK: - CustomStringConvertible

extension SFloat: CustomStringConvertible {
    
    public var description: String {
        
        return Float(self).description
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension SFloat: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: Float) {
        
        self.init(value)
    }
}

// MARK: - Byte Swap

extension SFloat: ByteSwap {
    
    /// A representation of this float with the byte order swapped.
    public var byteSwapped: SFloat {
        
        return SFloat(builtin: builtin.byteSwapped)
    }
}
