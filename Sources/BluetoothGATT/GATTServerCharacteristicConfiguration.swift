//
//  GATTServerCharacteristicConfiguration.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Bluetooth

// MARK: - Server Characteristic Configuration
/// GATT Server Characteristic Configuration Descriptor
///
/// The Server Characteristic Configuration descriptor defines how the characteristic descriptor is associated with may be configured for the server.
///
/// Only one Server Characteristic Configuration descriptor exists in a characteristic definition.
/// A client may write this configuration descriptor to control the configuration of the characteristic on the server for all clients.
/// There is a single instantiation of this descriptor for all clients.
/// Authentication and authorization may be required by the server to write this descriptor.
@frozen
public struct GATTServerCharacteristicConfiguration: GATTDescriptor, OptionSet, Hashable, Sendable {
    
    public static var uuid: BluetoothUUID { .serverCharacteristicConfiguration }
    
    public var rawValue: UInt8
    
    public init(rawValue: UInt8) {
        self.rawValue = rawValue
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension GATTServerCharacteristicConfiguration: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral rawValue: RawValue) {
        self.init(rawValue: rawValue)
    }
}



// MARK: - CustomStringConvertible

extension GATTServerCharacteristicConfiguration: CustomStringConvertible, CustomDebugStringConvertible {
    
    #if hasFeature(Embedded)
    public var description: String {
        "0x" + rawValue.toHexadecimal()
    }
    #else
    @inline(never)
    public var description: String {
        let descriptions: [(GATTServerCharacteristicConfiguration, StaticString)] = [
            (.broadcasts, ".broadcasts")
        ]
        return buildDescription(descriptions)
    }
    #endif

    /// A textual representation of the file permissions, suitable for debugging.
    public var debugDescription: String { self.description }
}

// MARK: - Options

public extension GATTServerCharacteristicConfiguration {
    
    /// Broadcasts enabled
    static var broadcasts: GATTServerCharacteristicConfiguration { 0b01 }
}
