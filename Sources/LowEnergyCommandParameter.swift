//
//  LowEnergyCommandParameter.swift
//  BluetoothLinux
//
//  Created by Alsey Coleman Miller on 1/14/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

public extension LowEnergyCommand {
    
    /// LE Set Advertising Data Command
    ///
    /// Used to set the data used in advertising packets that have a data field.
    ///
    /// - Note: Only the significant part of the Advertising Data is transmitted in the advertising packets.
    public struct SetAdvertisingDataParameter: HCICommandParameter {
        
        public static let command = LowEnergyCommand.SetAdvertisingData
        public static let length = 32
        
        /// The number of significant bytes.
        public var length: UInt8
        
        /// 31 octets of advertising data. 
        public var data: LowEnergyAdvertisingData
        
        public init(data: LowEnergyAdvertisingData, length: UInt8) {
            
            self.length = length
            self.data = data
        }
        
        public init() {
            
            self.length = 0
            self.data = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
        }
        
        public var byteValue: [UInt8] {
            
            return [length, data.0, data.1, data.2, data.3, data.4, data.5, data.6, data.7, data.8, data.9, data.10, data.11, data.12, data.13, data.14, data.15, data.16, data.17, data.18, data.19, data.20, data.21, data.22, data.23, data.24, data.25, data.26, data.27, data.28, data.29, data.30]
        }
    }
    
    /// LE Set Advertising Parameters Command
    ///
    /// Used by the Host to set the advertising parameters.
    public struct SetAdvertisingParametersParameter: HCICommandParameter {
        
        public static let command = LowEnergyCommand.SetAdvertisingParameters
        public static let length = 2 + 2 + 1 + 1 + 1 + 6 + 1 + 1
        
        /// Interval for non-directed advertising.
        public var interval: (minimum: UInt16, maximum: UInt16)
        
        public var advertisingType: AdvertisingChannelHeader
        
        public var addressType: (own: LowEnergyAddressType, direct: LowEnergyAddressType)
        
        /// Public Device Address or Random Device Address of the device to be connected.
        public var directAddress: Address
        
        public var channelMap: ChannelMap
        
        public var filterPolicy: FilterPolicy
        
        public init(interval: (minimum: UInt16, maximum: UInt16) = (0x0800, 0x0800),
            advertisingType: AdvertisingChannelHeader = AdvertisingChannelHeader(),
            addressType: (own: LowEnergyAddressType, direct: LowEnergyAddressType) = (.Public, .Public),
            directAddress: Address = Address(byteValue: (0,0,0,0,0,0)),
            channelMap: ChannelMap = ChannelMap(),
            filterPolicy: FilterPolicy = FilterPolicy()) {
            
            self.interval = interval
            self.advertisingType = advertisingType
            self.addressType = addressType
            self.directAddress = directAddress
            self.channelMap = channelMap
            self.filterPolicy = filterPolicy
        }
        
        public var byteValue: [UInt8] {
            
            let minimumIntervalBytes = interval.minimum.littleEndianBytes
            let maximumIntervalBytes = interval.maximum.littleEndianBytes
            
            return [minimumIntervalBytes.0, minimumIntervalBytes.1,
                maximumIntervalBytes.0, maximumIntervalBytes.1,
                advertisingType.rawValue,
                addressType.own.rawValue,
                addressType.direct.rawValue,
                directAddress.byteValue.0, directAddress.byteValue.1, directAddress.byteValue.2, directAddress.byteValue.3, directAddress.byteValue.4, directAddress.byteValue.5, channelMap.rawValue, filterPolicy.rawValue]
        }
        
        public enum ChannelMap: UInt8 {
            
            /// Default (all channels enabled)
            case All                    = 0b00000111
            case Channel37              = 0b00000001
            case Channel38              = 0b00000010
            case Channel39              = 0b00000100
            
            public init() { self = ChannelMap.All }
        }
        
        public enum FilterPolicy: UInt8 {
            
            /// Allow Scan Request from Any, Allow Connect Request from Any (default).
            case AnyScanConnect         = 0x00
            
            /// Allow Scan Request from White List Only, Allow Connect Request from Any.
            case WhiteListScan          = 0x01
            
            /// Allow Scan Request from Any, Allow Connect Request from White List Only.
            case WhiteListConnect       = 0x02
            
            /// Allow Scan Request from White List Only, Allow Connect Request from White List Only.
            case WhiteListScanConnect   = 0x03
            
            public init() { self = FilterPolicy.AnyScanConnect }
        }
    }
    
    /// LE Set Advertise Enable Command
    public struct SetAdvertiseEnableParameter: HCICommandParameter {
        
        public static let command = LowEnergyCommand.SetAdvertiseEnable
        public static let length = 1
        
        public var enabled: Bool
        
        public init(enabled: Bool = false) {
            
            self.enabled = enabled
        }
        
        public var byteValue: [UInt8] {
            
            let enabledByte: UInt8 = enabled ? 0x01 : 0x00
            
            return [enabledByte]
        }
    }
}

// MARK: - Supporting Types

/// Bluetooth Low Energy Address type
public enum LowEnergyAddressType: UInt8 {
    
    case Public = 0x00
    case Random = 0x01
    
    public init() { self = .Public }
}

/// 31 Byte LE Advertising Data
public typealias LowEnergyAdvertisingData = (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8)

public enum AdvertisingChannelHeader: UInt8 {
    
    /// Connectable undirected advertising event
    case Undirected         = 0x00
    
    /// Connectable directed advertising event
    case Directed           = 0x01
    
    /// Scannable undirected advertising event
    case Scannable          = 0x02
    
    /// Non-connectable undirected advertising event
    case NonConnectable     = 0x03
    
    public init() { self = .Undirected }
}
