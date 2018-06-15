//
//  CharacteristicDescriptor.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 4/17/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Characteristic Descriptor

public extension GATT {
    
    /// GATT Characteristic Descriptors
    public enum CharacteristicDescriptor {
        
        /// GATT Characteristic Descriptors
        public enum UUID {
            
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
    }
}

/// GATT Characteristic Descriptor
public protocol GATTDescriptor {
    
    /// Bluetooth UUID of the descriptor.
    static var uuid: BluetoothUUID { get }
    
    /// Decode from data.
    init?(data: Data)
    
    /// Encode to data. 
    var data: Data { get }
}

public extension GATT.CharacteristicDescriptor {
    
    public typealias ClientConfiguration = GATTClientCharacteristicConfiguration
    public typealias ExtendedProperties = GATTCharacteristicExtendedProperties
    public typealias ServerConfiguration = GATTServerCharacteristicConfiguration
    public typealias AggegateFormat = GATTAggregateFormatDescriptor
    public typealias Format = GATTFormatDescriptor
    public typealias UserDescription = GATTUserDescription
    public typealias ReportReference = GATTReportReference
    public typealias TimeTriggerSetting = GATTTimeTriggerSetting
    public typealias ExternalReportReference = GATTExternalReportReference
    public typealias NumberOfDigitals = GATTNumberOfDigitals
}
