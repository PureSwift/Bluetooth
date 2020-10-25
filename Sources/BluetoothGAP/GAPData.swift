//
//  GenericAccessProfile.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 4/26/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation
@_exported import Bluetooth

// MARK: - Generic Access Profile Data

/**
Generic Access Profile

- SeeAlso:
[Generic Access Profile](https://www.bluetooth.com/specifications/assigned-numbers/generic-access-profile)
*/
public protocol GAPData {
    
    /// Generic Access Profile data type.
    static var dataType: GAPDataType { get }
    
    /// Initialize from LE advertisement data.
    init?(data: Slice<LowEnergyAdvertisingData>)
    
    /// Initialize from bytes.
    init?(data: Data)
    
    /// Append data representation into buffer.
    func append(to data: inout Data)
    
    /// Append data representation into buffer.
    func append(to data: inout LowEnergyAdvertisingData)
    
    /// Length of value when encoded into data.
    var dataLength: Int { get }
}

public extension GAPData {
    
    init?(data slice: Slice<LowEnergyAdvertisingData>) {
        let range = slice.startIndex ..< slice.endIndex
        guard let value = slice.base.withUnsafeData({
            Self.init(data: $0.subdataNoCopy(in: range))
        }) else { return nil }
        self = value
    }
    
    func append(to data: inout LowEnergyAdvertisingData) {
        data += Data(self) // will be serialized on stack if small
    }
}

public extension Data {
    
    /// Initialize from GAP Data type.
    init<T: GAPData>(_ value: T) {
        self.init(capacity: value.dataLength)
        value.append(to: &self)
        assert(self.count == value.dataLength)
    }
}
