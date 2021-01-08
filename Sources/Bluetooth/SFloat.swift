//
//  SFloat.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/11/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

#if swift(>=5.3) && !os(macOS) && !(os(iOS) && targetEnvironment(macCatalyst))
@available(iOS 14.0, watchOS 7.0, tvOS 14.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
public extension SFloat {
    
    init(_ float: Float16) {
        self.init(bitPattern: float.bitPattern)
    }
}
@available(iOS 14.0, watchOS 7.0, tvOS 14.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
public extension Float16 {
    init(_ float: SFloat) {
        self.init(bitPattern: float.bitPattern)
    }
}
#endif

/// IEEE-11073 16-bit SFLOAT
@frozen
public struct SFloat: Equatable, Hashable, Codable {
    
    /// The bit pattern of the value’s encoding.
    public private(set) var bitPattern: UInt16
    
    /// Creates a new value with the given bit pattern.
    public init(bitPattern: UInt16) {
        self.bitPattern = bitPattern
    }
    
    /// Creates a value initialized to zero.
    public init() {
        self.bitPattern = 0
    }
    
    public init(_ value: Float) {
        #if swift(>=5.3) && !os(macOS) && !(os(iOS) && targetEnvironment(macCatalyst))
        if #available(iOS 14.0, watchOS 7.0, tvOS 14.0, *) {
            self.init(Float16(value))
        } else {
            self.init(BuiltinFloat16(value))
        }
        #else
        self.init(BuiltinFloat16(value))
        #endif
    }
}

public extension Float {
    
    init(_ value: SFloat) {
        #if swift(>=5.3) && !os(macOS) && !(os(iOS) && targetEnvironment(macCatalyst))
        if #available(iOS 14.0, watchOS 7.0, tvOS 14.0, *) {
            self.init(Float16(value))
        } else {
            self.init(value.builtin)
        }
        #else
        self.init(value.builtin)
        #endif
    }
}

/// Builtin Float16
@usableFromInline
internal struct BuiltinFloat16: Equatable, Hashable {
    
    /// The bit pattern of the value’s encoding.
    @usableFromInline
    let bitPattern: UInt16
    
    /// Creates a new value with the given bit pattern.
    @usableFromInline
    init(bitPattern: UInt16) {
        self.bitPattern = bitPattern
    }
    
    /// Creates a value initialized to zero.
    @usableFromInline
    init() {
        self.bitPattern = 0
    }
    
    @usableFromInline
    init(_ value: Float) {
        fatalError(#function)
    }
}

internal extension BuiltinFloat16 {
    
    init(_ value: SFloat) {
        self.init(bitPattern: value.bitPattern)
    }
}

internal extension SFloat {
    
    init(_ builtin: BuiltinFloat16) {
        self.init(bitPattern: builtin.bitPattern)
    }
    
    var builtin: BuiltinFloat16 {
        return BuiltinFloat16(bitPattern: self.bitPattern)
    }
}

extension BuiltinFloat16: CustomStringConvertible {
    
    @usableFromInline
    var description: String {
        return Float(self).description
    }
}

internal extension Float {
    
    @usableFromInline
    init(_ value: BuiltinFloat16) {
        fatalError(#function)
    }
}

// MARK: - CustomStringConvertible

extension SFloat: CustomStringConvertible {
    
    public var description: String {
        #if swift(>=5.3) && !os(macOS) && !(os(iOS) && targetEnvironment(macCatalyst))
        if #available(iOS 14.0, watchOS 7.0, tvOS 14.0, *) {
            return Float16(self).description
        } else {
            return BuiltinFloat16(self).description
        }
        #else
        return BuiltinFloat16(self).description
        #endif
    }
}

// MARK: - Byte Swap

extension SFloat: ByteSwap {
    
    /// A representation of this float with the byte order swapped.
    public var byteSwapped: SFloat {
        return SFloat(bitPattern: bitPattern.byteSwapped)
    }
}
