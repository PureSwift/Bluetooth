//
//  CharacteristicDescriptor.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 4/17/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// GATT Client Characteristic Configuration Descriptor
///
/// The Client Characteristic Configuration descriptor defines how the characteristic may be configured by a specific client.
///
/// This descriptor shall be persistent across connections for bonded devices. 
/// The Client Characteristic Configuration descriptor is unique for each client. 
/// A client may read and write this descriptor to determine and set the configuration for that client.
/// Authentication and authorization may be required by the server to write this descriptor. 
/// The default value for the Client Characteristic Configuration descriptor is `0x00`.
/// Upon connection of non-binded clients, this descriptor is set to the default value.
public struct GATTClientCharacteristicConfiguration {
    
    public static let uuid: BluetoothUUID = .clientCharacteristicConfiguration
    
    public static let length = 1
    
    public var configuration: BitMaskOptionSet<Configuration>
    
    public init(configuration: BitMaskOptionSet<Configuration> = []) {
        
        self.configuration = configuration
    }
    
    public init?(byteValue: [UInt8]) {
        
        guard byteValue.count == type(of: self).length
            else { return nil }
        
        self.configuration = BitMaskOptionSet<Configuration>(rawValue: byteValue[0])
    }
    
    public var byteValue: [UInt8] {
        
        return [configuration.rawValue]
    }
    
    public var descriptor: GATT.Descriptor {
        
        return GATT.Descriptor(uuid: type(of: self).uuid,
                               value: Data(byteValue),
                               permissions: [.read, .write])
    }
}

public extension GATTClientCharacteristicConfiguration {
    
    /// GATT Client Characteristic Configuration Options
    public enum Configuration: UInt8, BitMaskOption {
        
        #if swift(>=3.2)
        #elseif swift(>=3.0)
        public typealias RawValue = UInt8
        #endif
        
        /// Notifications enabled
        case notify = 0b01
        
        /// Indications enabled
        case indicate = 0b10
        
        public static let all: Set<Configuration> = [.notify, .indicate]
    }
}
