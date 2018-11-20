//
//  UnsafeDataConvertible.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 8/24/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// Internal Data protocol
internal protocol DataConvertible {
    
    /// Append data representation into buffer.
    static func += (data: inout Data, value: Self)
    
    /// Length of value when encoded into data.
    var dataLength: Int { get }
}

extension Data {
    /// Initialize data with contents of value. 
    init <T: DataConvertible> (_ value: T) {
        self.init(capacity: value.dataLength)
        self += value
    }
}

/// Internal Data casting protocol
internal protocol UnsafeDataConvertible { }

extension UnsafeDataConvertible {
    /// Append data representation into buffer.
    public static func += (lhs: inout Data, rhs: Self) {
        var value = rhs
        lhs.append(UnsafeBufferPointer(start: &value, count: 1))
    }
}

extension UInt8: UnsafeDataConvertible { }
extension UInt16: UnsafeDataConvertible { }
extension UInt32: UnsafeDataConvertible { }
extension UInt64: UnsafeDataConvertible { }
extension UInt128: UnsafeDataConvertible { }
