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
    
    static var uuid: BluetoothUUID { get }
    
    init?(byteValue: Data)
    
    var byteValue: Data { get }
}

public extension GATT.CharacteristicDescriptor {
    
    public typealias ClientConfiguration = GATTClientCharacteristicConfiguration
}

/// GATT Client Characteristic Configuration Descriptor
///
/// The Client Characteristic Configuration descriptor defines how the characteristic may be
/// configured by a specific client.
///
/// This descriptor shall be persistent across connections for bonded devices. 
/// The Client Characteristic Configuration descriptor is unique for each client. 
/// A client may read and write this descriptor to determine and set the configuration for that client.
/// Authentication and authorization may be required by the server to write this descriptor. 
/// The default value for the Client Characteristic Configuration descriptor is `0x00`.
/// Upon connection of non-binded clients, this descriptor is set to the default value.
public struct GATTClientCharacteristicConfiguration: GATTDescriptor {
    
    public static let uuid: BluetoothUUID = .clientCharacteristicConfiguration
    
    public static let length = 2
    
    public var configuration: BitMaskOptionSet<Configuration>
    
    public init(configuration: BitMaskOptionSet<Configuration> = []) {
        
        self.configuration = configuration
    }
    
    public init?(byteValue: Data) {
        
        guard byteValue.count == type(of: self).length
            else { return nil }
        
        let rawValue = UInt16(littleEndian: UInt16(bytes: (byteValue[0], byteValue[1])))
        
        self.configuration = BitMaskOptionSet<Configuration>(rawValue: rawValue)
    }
    
    public var byteValue: Data {
        
        let bytes = configuration.rawValue.littleEndian.bytes
        
        return Data([bytes.0, bytes.1])
    }
    
    public var descriptor: GATT.Descriptor {
        
        return GATT.Descriptor(uuid: type(of: self).uuid,
                               value: byteValue,
                               permissions: [.read, .write])
    }
}

public extension GATTClientCharacteristicConfiguration {
    
    /// GATT Client Characteristic Configuration Options
    public enum Configuration: UInt16, BitMaskOption {
        
        #if swift(>=3.2)
        #elseif swift(>=3.0)
        public typealias RawValue = UInt16
        #endif
        
        /// Notifications enabled
        case notify = 0b01
        
        /// Indications enabled
        case indicate = 0b10
        
        public static let all: Set<Configuration> = [.notify, .indicate]
    }
}
