//
//  ByteSwap.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 4/4/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

/// A Bluetooth value that is stored in the CPU native endianess format.
public protocol ByteSwap {
    
    /// A representation of this integer with the byte order swapped.
    var byteSwapped: Self { get }
}

public extension ByteSwap {
    
    /// Creates an instance from its little-endian representation, changing the
    /// byte order if necessary.
    ///
    /// - Parameter value: A value to use as the little-endian representation of
    ///   the new instance.
    public init(littleEndian value: Self) {
        #if _endian(little)
        self = value
        #else
        self = value.byteSwapped
        #endif
    }
    
    /// Creates an instance from its big-endian representation, changing the byte
    /// order if necessary.
    ///
    /// - Parameter value: A value to use as the big-endian representation of the
    ///   new instance.
    public init(bigEndian value: Self) {
        #if _endian(big)
        self = value
        #else
        self = value.byteSwapped
        #endif
    }
    
    /// The little-endian representation of this value.
    ///
    /// If necessary, the byte order of this value is reversed from the typical
    /// byte order of this address. On a little-endian platform, for any
    /// address `x`, `x == x.littleEndian`.
    public var littleEndian: Self {
        #if _endian(little)
        return self
        #else
        return byteSwapped
        #endif
    }
    
    /// The big-endian representation of this value.
    ///
    /// If necessary, the byte order of this value is reversed from the typical
    /// byte order of this address. On a big-endian platform, for any
    /// address `x`, `x == x.bigEndian`.
    public var bigEndian: Self {
        #if _endian(big)
        return self
        #else
        return byteSwapped
        #endif
    }
}
