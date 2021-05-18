//
//  GATTClientCharacteristicConfiguration.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

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
@frozen
public struct GATTClientCharacteristicConfiguration: GATTDescriptor {
    
    public static let uuid: BluetoothUUID = .clientCharacteristicConfiguration
    
    public static let length = 2
    
    public var configuration: BitMaskOptionSet<Configuration>
    
    public init(configuration: BitMaskOptionSet<Configuration> = []) {
        
        self.configuration = configuration
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let rawValue = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
        
        self.configuration = BitMaskOptionSet<Configuration>(rawValue: rawValue)
    }
    
    public var data: Data {
        
        let bytes = configuration.rawValue.littleEndian.bytes
        
        return Data([bytes.0, bytes.1])
    }
    
    public var descriptor: GATTAttribute.Descriptor {
        
        return GATTAttribute.Descriptor(uuid: type(of: self).uuid,
                               value: data,
                               permissions: [.read, .write])
    }
}

// MARK: - Supporting Types

public extension GATTClientCharacteristicConfiguration {
    
    /// GATT Client Characteristic Configuration Options
    enum Configuration: UInt16, BitMaskOption {
        
        /// Notifications enabled
        case notify = 0b01
        
        /// Indications enabled
        case indicate = 0b10
        
        public static let allCases: [Configuration] = [.notify, .indicate]
    }
}
