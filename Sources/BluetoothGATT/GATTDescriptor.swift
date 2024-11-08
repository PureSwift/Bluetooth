//
//  CharacteristicDescriptor.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 4/17/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Bluetooth

/// GATT Characteristic Descriptor
public protocol GATTDescriptor: DataConvertible {
    
    /// Bluetooth UUID of the descriptor.
    static var uuid: BluetoothUUID { get }
    
    /// Decode from data.
    init?<Data: DataContainer>(data: Data)
    
    /// Encode to data.
    func append<Data: DataContainer>(to data: inout Data)
}

public extension GATTAttribute.Descriptor {
    
    init<Descriptor: GATTDescriptor>(
        _ descriptor: Descriptor,
        permissions: ATTAttributePermissions = [.read]
    ) {
        self.init(
            uuid: Descriptor.uuid,
            value: Data(descriptor),
            permissions: permissions
        )
    }
}

// MARK: - Characteristic Descriptor

/// GATT Characteristic Descriptors
@frozen
public enum GATTCharacteristicDescriptor {
    
    /// Characteristic Extended Properties
    public static var extendedProperties: BluetoothUUID { return .characteristicExtendedProperties }
    
    /// Characteristic User Description Descriptor
    public static var userDescription: BluetoothUUID { return .characteristicUserDescription }
    
    /// Client Characteristic Configuration Descriptor
    public static var clientConfiguration: BluetoothUUID { return .clientCharacteristicConfiguration }
    
    /// Server Characteristic Configuration Descriptor
    public static var serverConfiguration: BluetoothUUID { return .serverCharacteristicConfiguration }
    
    /// Characteristic Format Descriptor
    public static var format: BluetoothUUID { return .characteristicFormat }
    
    /// Characteristic Aggregate Format Descriptor
    public static var aggregateFormat: BluetoothUUID { return .characteristicAggregateFormat }
}

public extension GATTCharacteristicDescriptor {
    
    typealias ClientConfiguration = GATTClientCharacteristicConfiguration
    typealias ExtendedProperties = GATTCharacteristicExtendedProperties
    typealias ServerConfiguration = GATTServerCharacteristicConfiguration
    typealias AggegateFormat = GATTAggregateFormatDescriptor
    typealias Format = GATTFormatDescriptor
    typealias UserDescription = GATTUserDescription
    typealias ReportReference = GATTReportReference
    typealias TimeTriggerSetting = GATTTimeTriggerSetting
    typealias ExternalReportReference = GATTExternalReportReference
    typealias NumberOfDigitals = GATTNumberOfDigitals
}
