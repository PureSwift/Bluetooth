//
//  UnsafeDataConvertible.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 8/24/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// Internal Data casting protocol
internal protocol UnsafeDataConvertible {
    static func += (lhs: inout Data, rhs: Self)
}

extension UnsafeDataConvertible {
    public static func += (lhs: inout Data, rhs: Self) {
        var value = self
        lhs.append(UnsafeBufferPointer(start: &value, count: 1))
    }
}

extension UInt8  : UnsafeDataConvertible { }
extension UInt16 : UnsafeDataConvertible { }
extension UInt32 : UnsafeDataConvertible { }
extension UInt64 : UnsafeDataConvertible { }
extension UInt128 : UnsafeDataConvertible { }

extension Int    : UnsafeDataConvertible { }
extension Float  : UnsafeDataConvertible { }
extension Double : UnsafeDataConvertible { }

extension String: UnsafeDataConvertible {
    public static func += (lhs: inout Data, rhs: String) {
        lhs.append(contentsOf: rhs.utf8)
    }
}
