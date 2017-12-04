//
//  UInt128.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 12/4/17.
//

import Foundation

/// A 128 bit number stored according to host endianness.
///
/// Unlike `NSUUID` which is always stored in big endian.
public struct UInt128: ByteValue {
    
    public typealias ByteValue = (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8)
    
    public var bytes: ByteValue
    
    public init(bytes: ByteValue) {
        
        self.bytes = bytes
    }
}

// MARK: - Equatable

extension UInt128: Equatable {
    
    public static func == (lhs: UInt128, rhs: UInt128) -> Bool {
        
        return lhs.bytes.0 == rhs.bytes.0 &&
                lhs.bytes.1 == rhs.bytes.1 &&
                lhs.bytes.2 == rhs.bytes.2 &&
                lhs.bytes.3 == rhs.bytes.3 &&
                lhs.bytes.4 == rhs.bytes.4 &&
                lhs.bytes.5 == rhs.bytes.5 &&
                lhs.bytes.6 == rhs.bytes.6 &&
                lhs.bytes.7 == rhs.bytes.7 &&
                lhs.bytes.8 == rhs.bytes.8 &&
                lhs.bytes.9 == rhs.bytes.9 &&
                lhs.bytes.10 == rhs.bytes.10 &&
                lhs.bytes.11 == rhs.bytes.11 &&
                lhs.bytes.12 == rhs.bytes.12 &&
                lhs.bytes.13 == rhs.bytes.13 &&
                lhs.bytes.14 == rhs.bytes.14 &&
                lhs.bytes.15 == rhs.bytes.15
    }
}

// MARK: - Hashable

extension UInt128: Hashable {
    
    public var hashValue: Int {
        
        return data.hashValue
    }
}

// MARK: - Data Convertible

public extension UInt128 {
    
    public static var length: Int { return 16 }
    
    public init?(data: Data) {
        
        guard data.count == UInt128.length else { return nil }
        
        self.init(bytes: (data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7], data[8], data[9], data[10], data[11], data[12], data[13], data[14], data[15]))
    }
    
    public var data: Data {
        
        return Data(bytes: [bytes.0, bytes.1, bytes.2, bytes.3, bytes.4, bytes.5, bytes.6, bytes.7, bytes.8, bytes.9, bytes.10, bytes.11, bytes.12, bytes.13, bytes.14, bytes.15])
    }
}

// MARK: - Byte Swap

public extension UInt128 {
    
    /// A representation of this integer with the byte order swapped.
    public var byteSwapped: UInt128 {
        
        return UInt128(bytes: (bytes.15,
                               bytes.14,
                               bytes.13,
                               bytes.12,
                               bytes.11,
                               bytes.10,
                               bytes.9,
                               bytes.8,
                               bytes.7,
                               bytes.6,
                               bytes.5,
                               bytes.4,
                               bytes.3,
                               bytes.2,
                               bytes.1,
                               bytes.0))
    }
    
    /// Creates an integer from its little-endian representation, changing the
    /// byte order if necessary.
    ///
    /// - Parameter value: A value to use as the little-endian representation of
    ///   the new integer.
    public init(littleEndian value: UInt128) {
        #if _endian(little)
            self = value
        #else
            self = value.byteSwapped
        #endif
    }
    
    /// Creates an integer from its big-endian representation, changing the byte
    /// order if necessary.
    ///
    /// - Parameter value: A value to use as the big-endian representation of the
    ///   new integer.
    public init(bigEndian value: UInt128) {
        #if _endian(big)
            self = value
        #else
            self = value.byteSwapped
        #endif
    }
    
    /// The little-endian representation of this integer.
    ///
    /// If necessary, the byte order of this value is reversed from the typical
    /// byte order of this integer. On a little-endian platform, for any
    /// integer `x`, `x == x.littleEndian`.
    public var littleEndian: UInt128 {
        #if _endian(little)
            return self
        #else
            return byteSwapped
        #endif
    }
    
    /// The big-endian representation of this integer.
    ///
    /// If necessary, the byte order of this value is reversed from the typical
    /// byte order of this integer. On a big-endian platform, for any
    /// integer `x`, `x == x.bigEndian`.
    public var bigEndian: UInt128 {
        #if _endian(big)
            return self
        #else
            return byteSwapped
        #endif
    }
}

// MARK: - NSUUID

public extension UInt128 {
    
    public init(uuid: Foundation.UUID) {
        
        /// UUID is always big endian
        let bigEndian = UInt128(bytes: uuid.uuid)
        
        self.init(bigEndian: bigEndian)
    }
}

public extension Foundation.UUID {
    
    public init(_ value: UInt128) {
        
        // UUID is always stored in big endian bytes
        let bytes = value.bigEndian.bytes
        
        self.init(bytes: (bytes.0,
                          bytes.1,
                          bytes.2,
                          bytes.3,
                          bytes.4,
                          bytes.5,
                          bytes.6,
                          bytes.7,
                          bytes.8,
                          bytes.9,
                          bytes.10,
                          bytes.11,
                          bytes.12,
                          bytes.13,
                          bytes.14,
                          bytes.15))
    }
}
