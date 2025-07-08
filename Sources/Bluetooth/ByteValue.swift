//
//  ByteValue.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 7/3/15.
//  Copyright © 2015 PureSwift. All rights reserved.
//

/// Stores a primitive value.
///
/// Useful for Swift wrappers for primitive byte types.
public protocol ByteValue: Equatable {

    associatedtype ByteValue

    /// Returns the the primitive byte type.
    var bytes: ByteValue { get }

    /// Initializes with the primitive the primitive byte type.
    init(bytes: ByteValue)

    /// The number of bits used for the underlying binary representation of values of this type.
    static var bitWidth: Int { get }
}

// MARK: - Data Convertible

public extension ByteValue {

    /// Size of value in bytes.
    @_alwaysEmitIntoClient
    static var length: Int { bitWidth / 8 }

    @inline(__always)
    func withUnsafeBytes<R>(_ body: (UnsafeBufferPointer<UInt8>) throws -> R) rethrows -> R {
        return try Swift.withExtendedLifetime(self) {
            try Swift.withUnsafeBytes(of: bytes) { rawBuffer in
                return try rawBuffer.withMemoryRebound(to: UInt8.self) { buffer in
                    return try body(buffer)
                }
            }
        }
    }
}

public extension ByteValue where Self: DataConvertible {

    /// Append data representation into buffer.
    @_alwaysEmitIntoClient
    func append<Data: DataContainer>(to data: inout Data) {
        withUnsafeBytes { buffer in
            data += buffer
        }
    }

    @_alwaysEmitIntoClient
    var dataLength: Int {
        Self.length
    }
}

// MARK: - Equatable

extension ByteValue where Self: Equatable {

    @_alwaysEmitIntoClient
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.withUnsafeBytes { (b1) in
            rhs.withUnsafeBytes { (b2) in
                b1.elementsEqual(b2)
            }
        }
    }
}

// MARK: - Comparable

extension ByteValue where Self: Comparable {
    
    public static func < (lhs: Self, rhs: Self) -> Bool {
        lhs.withUnsafeBytes { (b1) in
            rhs.withUnsafeBytes { (b2) in
                _memcmp(
                    b1.baseAddress.flatMap { UnsafeRawPointer($0) }!,
                    b2.baseAddress.flatMap { UnsafeRawPointer($0) }!,
                    Self.length
                ) < 0
            }
        }
    }

    public static func > (lhs: Self, rhs: Self) -> Bool {
        lhs.withUnsafeBytes { (b1) in
            rhs.withUnsafeBytes { (b2) in
                _memcmp(
                    b1.baseAddress.flatMap { UnsafeRawPointer($0) }!,
                    b2.baseAddress.flatMap { UnsafeRawPointer($0) }!,
                    Self.length
                ) > 0
            }
        }
    }
}

// MARK: - CustomStringConvertible

extension ByteValue where Self: CustomStringConvertible, Self: ByteSwap {
    
    public var description: String {
        bigEndian.withUnsafeBytes {
            "0x" + $0.toHexadecimal()
        }
    }
}
