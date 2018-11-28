//
//  DataConvertible.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 8/24/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// Can be converted into data.
internal protocol DataConvertible {
    
    /// Append data representation into buffer.
    static func += <T: DataContainer> (data: inout T, value: Self)
    
    /// Length of value when encoded into data.
    var dataLength: Int { get }
}

extension Data {
    
    /// Initialize data with contents of value.
    @inline(__always)
    init <T: DataConvertible> (_ value: T) {
        self.init(capacity: value.dataLength)
        self += value
    }
}

// MARK: - UnsafeDataConvertible

/// Internal Data casting protocol
internal protocol UnsafeDataConvertible: DataConvertible { }

extension UnsafeDataConvertible {
    
    var dataLength: Int {
        return MemoryLayout<Self>.size
    }
    
    /// Append data representation into buffer.
    static func += <T: DataContainer> (data: inout T, value: Self) {
        #if swift(>=4.2)
        withUnsafePointer(to: value) {
            $0.withMemoryRebound(to: UInt8.self, capacity: MemoryLayout<Self>.size) {
                data.append($0, count: MemoryLayout<Self>.size)
            }
        }
        #else
        var value = value
        withUnsafePointer(to: &value) {
            $0.withMemoryRebound(to: UInt8.self, capacity: MemoryLayout<Self>.size) {
                data.append($0, count: MemoryLayout<Self>.size)
            }
        }
        #endif
    }
}

extension UInt16: UnsafeDataConvertible { }
extension UInt32: UnsafeDataConvertible { }
extension UInt64: UnsafeDataConvertible { }
extension UInt128: UnsafeDataConvertible { }

// MARK: - DataContainer

/// Data container type.
internal protocol DataContainer: RandomAccessCollection where Self.Index == Int {
    
    subscript(index: Int) -> UInt8 { get }
    
    subscript(range: Range<Int>) -> Slice<Self> { get }
    
    mutating func append(_ newElement: UInt8)
    
    static func += (lhs: inout Self, rhs: UInt8)
    
    mutating func append(_ pointer: UnsafePointer<UInt8>, count: Int)
    
    mutating func append <C: Collection> (contentsOf bytes: C) where C.Element == UInt8
    
    static func += <C: Collection> (lhs: inout Self, rhs: C) where C.Element == UInt8
}

extension DataContainer {
    
    static func += (lhs: inout Self, rhs: UInt8) {
        lhs.append(rhs)
    }
    
    mutating func append <T: DataConvertible> (_ value: T) {
        self += value
    }
}

extension Data: DataContainer { }

extension LowEnergyAdvertisingData: DataContainer { }
