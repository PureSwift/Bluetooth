//
//  GATTNumberOfDigitals.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Bluetooth

/// GATT Number of Digitals Descriptor
///
/// The Characteristic Number of Digitals descriptor is used for defining the number of digitals in a characteristic.
@frozen
public struct GATTNumberOfDigitals: GATTDescriptor, RawRepresentable, Equatable, Hashable, Sendable {
    
    public static var uuid: BluetoothUUID { .numberOfDigitals }
        
    public var rawValue: UInt8
    
    public init(rawValue: UInt8) {
        self.rawValue = rawValue
    }
}

// MARK: - DataConvertible

extension GATTNumberOfDigitals: DataConvertible {
    
    public static var length: Int { 1 }
    
    public init?<Data: DataContainer>(data: Data) {
        guard data.count == Self.length
            else { return nil }
        self.init(rawValue: data[0])
    }
    
    public func append<Data>(to data: inout Data) where Data : DataContainer {
        data += rawValue
    }
    
    public var dataLength: Int { Self.length }
}

// MARK: - CustomStringConvertible

extension GATTNumberOfDigitals: CustomStringConvertible {
    
    public var description: String {
        return rawValue.description
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension GATTNumberOfDigitals: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt8) {
        self.init(rawValue: value)
    }
}
