//
//  GATTUserDescription.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Bluetooth

// MARK: - Characteristic User Description

/// GATT Characteristic User Description Descriptor
///
/// The Characteristic User Description descriptor provides a textual user description for a characteristic value.
///
/// If the Writable Auxiliary bit of the Characteristics Properties is set then this descriptor is written.
/// Only one User Description descriptor exists in a characteristic definition.
@frozen
public struct GATTUserDescription: GATTDescriptor, RawRepresentable, Hashable, Sendable {
    
    public static var uuid: BluetoothUUID { BluetoothUUID.Descriptor.characteristicUserDescription }
    
    public var rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

// MARK: - ExpressibleByStringLiteral

extension GATTUserDescription: ExpressibleByStringLiteral {
    
    public init(stringLiteral value: String) {
        self.init(rawValue: value)
    }
}

// MARK: - DataConvertible

extension GATTUserDescription: DataConvertible {
    
    public init?<Data: DataContainer>(data: Data) {
        
        guard let rawValue = String(utf8: data)
            else { return nil }
        
        self.init(rawValue: rawValue)
    }
    
    public func append<Data>(to data: inout Data) where Data : DataContainer {
        data += rawValue.utf8
    }
    
    public var dataLength: Int {
        rawValue.utf8.count
    }
}
