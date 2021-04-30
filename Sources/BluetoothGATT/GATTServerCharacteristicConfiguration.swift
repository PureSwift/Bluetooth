//
//  GATTServerCharacteristicConfiguration.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

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
public struct GATTServerCharacteristicConfiguration: GATTDescriptor {
    
    public static let uuid: BluetoothUUID = .serverCharacteristicConfiguration
    
    public static let length = 1
    
    public var serverConfiguration: BitMaskOptionSet<ServerConfiguration>
    
    public init(serverConfiguration: BitMaskOptionSet<ServerConfiguration> = []) {
        
        self.serverConfiguration = serverConfiguration
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let rawValue = data[0]
        
        self.serverConfiguration = BitMaskOptionSet<ServerConfiguration>(rawValue: rawValue)
    }
    
    public var data: Data {
        
        return Data([serverConfiguration.rawValue])
    }
    
    public var descriptor: GATTAttribute.Descriptor {
        
        return GATTAttribute.Descriptor(uuid: type(of: self).uuid,
                               value: data,
                               permissions: [.read, .write])
    }
}

extension GATTServerCharacteristicConfiguration {
    
    /// GATT Server Characteristics Configuration Options
    public enum ServerConfiguration: UInt8, BitMaskOption {
        
        /// Broadcasts enabled
        case broadcasts = 0b01
        
        public static let allCases: [ServerConfiguration] = [.broadcasts]
    }
}
