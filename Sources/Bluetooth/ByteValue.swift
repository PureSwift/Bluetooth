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

public extension ByteValue {
    
    /// Size of value in bytes.
    static var length: Int { bitWidth / 8 }
    
    /// Invokes the given closure with a pointer to the given argument.
    func withUnsafePointer<T>(_ body: (UnsafePointer<UInt8>, Int) -> T) -> T {
        let length = Self.length
        assert(length == MemoryLayout<ByteValue>.size)
        return Swift.withUnsafePointer(to: bytes) {
            $0.withMemoryRebound(to: UInt8.self, capacity: length) {
                body($0, length)
            }
        }
    }
    
    /// Invokes the given closure with a buffer pointer covering the raw bytes of value.
    func withUnsafeBytes <Result> (_ block: (UnsafeRawBufferPointer) -> Result) -> Result {
        Swift.withUnsafeBytes(of: bytes) {
            block($0)
        }
    }
}
