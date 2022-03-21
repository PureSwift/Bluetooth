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
    init <T: DataConvertible> (_ value: T) {
        let length = value.dataLength
        self.init(capacity: length)
        self += value
        assert(self.count == length)
    }
}

extension BluetoothUUID: DataConvertible {
    
    /// Number of bytes to represent Bluetooth UUID.
    internal enum Length: Int {
        
        case bit16 = 2
        case bit32 = 4
        case bit128 = 16
    }
    
    internal var length: Length {
        
        switch self {
        case .bit16: return .bit16
        case .bit32: return .bit32
        case .bit128: return .bit128
        }
    }
    
    @usableFromInline
    var dataLength: Int {
        return length.rawValue
    }
    
    @usableFromInline
    static func += <T: DataContainer> (data: inout T, value: BluetoothUUID) {
        switch value {
        case let .bit16(value): data += value
        case let .bit32(value): data += value
        case let .bit128(value): data += value
        }
    }
}

// MARK: - UnsafeDataConvertible

/// Internal Data casting protocol
internal protocol UnsafeDataConvertible: DataConvertible { }

extension UnsafeDataConvertible {
    
    @usableFromInline
    var dataLength: Int {
        return MemoryLayout<Self>.size
    }
    
    /// Append data representation into buffer.
    static func += <T: DataContainer> (data: inout T, value: Self) {
        withUnsafePointer(to: value) {
            $0.withMemoryRebound(to: UInt8.self, capacity: MemoryLayout<Self>.size) {
                data.append($0, count: MemoryLayout<Self>.size)
            }
        }
    }
}

extension UInt16: UnsafeDataConvertible { }
extension UInt32: UnsafeDataConvertible { }
extension UInt64: UnsafeDataConvertible { }
extension UInt128: UnsafeDataConvertible { }
extension BluetoothAddress: UnsafeDataConvertible { }

// MARK: - DataContainer

/// Data container type.
@usableFromInline
internal protocol DataContainer: RandomAccessCollection where Self.Index == Int {
    
    subscript(index: Int) -> UInt8 { get }
        
    mutating func append(_ newElement: UInt8)
    
    mutating func append(_ pointer: UnsafePointer<UInt8>, count: Int)
    
    mutating func append <C: Collection> (contentsOf bytes: C) where C.Element == UInt8
    
    static func += (lhs: inout Self, rhs: UInt8)
    static func += <C: Collection> (lhs: inout Self, rhs: C) where C.Element == UInt8
}

extension DataContainer {
    
    mutating func append <T: DataConvertible> (_ value: T) {
        self += value
    }
}

extension Data: DataContainer {
    
    @usableFromInline
    static func += (lhs: inout Data, rhs: UInt8) {
        lhs.append(rhs)
    }
}

extension LowEnergyAdvertisingData: DataContainer { }
