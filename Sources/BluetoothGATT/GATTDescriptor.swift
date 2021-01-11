//
//  CharacteristicDescriptor.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 4/17/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// GATT Characteristic Descriptor
public protocol GATTDescriptor {
    
    /// Bluetooth UUID of the descriptor.
    static var uuid: BluetoothUUID { get }
    
    /// Decode from data.
    init?(data: Data)
    
    /// Encode to data.
    var data: Data { get }
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
