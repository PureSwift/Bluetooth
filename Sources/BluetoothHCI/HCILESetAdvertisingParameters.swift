//
//  HCILESetAdvertisingParameters.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {

    /// LE Set Advertising Parameters Command
    ///
    /// Used by the Host to set the advertising parameters.
    func setLowEnergyAdvertisingParameters(_ parameters: HCILESetAdvertisingParameters,
                                           timeout: HCICommandTimeout = .default) throws {
        
        try deviceRequest(parameters, timeout: timeout)
    }
}

// MARK: - Command

/// LE Set Advertising Parameters Command
///
/// Used by the Host to set the advertising parameters.
@frozen
public struct HCILESetAdvertisingParameters: HCICommandParameter {
    
    public static var command: HCILowEnergyCommand { return .setAdvertisingParameters } // 0x0006
    
    /// Interval for non-directed advertising.
    ///
    /// - Note: The `Advertising_Interval_Min` and `Advertising_Interval_Max` should not be the same value
    /// to enable the Controller to determine the best advertising interval given other activities.
    ///
    /// For directed advertising, when Advertising_Type is `0x01` (ADV_DIRECT_IND),
    /// the `Advertising_Interval_Min` and `Advertising_Interval_Max` parameters are not used and shall be ignored.
    ///
    /// The `Advertising_Interval_Min` and `Advertising_Interval_Max` shall not be set to less than
    /// `0x00A0` (100 ms) if the Advertising_Type is set to `0x02` (ADV_SCAN_IND) or `0x03` (ADV_NONCONN_IND).
    public var interval: (min: AdvertisingInterval, max: AdvertisingInterval)
    
    /// Ssed to determine the packet type that is used for advertising when advertising is enabled.
    public var advertisingType: AdvertisingType
    
    /// Determines if the advertising packets are identified with the Public Device Address of the device,
    /// or a Random Device Address as written by the `LE_Set_Random_Address` command.
    public var ownAddressType: LowEnergyAddressType
    
    /// Address type
    public var directAddresssType: LowEnergyAddressType // Direct_Address_Type
    
    /// Public Device Address or Random Device Address of the device to be connected.
    public var directAddress: BluetoothAddress
    
    public var channelMap: BitMaskOptionSet<ChannelMap>
    
    public var filterPolicy: FilterPolicy
    
    public init(interval: (min: AdvertisingInterval, max: AdvertisingInterval) = (.default, .max),
                advertisingType: AdvertisingType = AdvertisingType(),
                ownAddressType: LowEnergyAddressType = .public,
                directAddresssType: LowEnergyAddressType = .public,
                directAddress: BluetoothAddress = .zero,
                channelMap: BitMaskOptionSet<ChannelMap> = .all,
                filterPolicy: FilterPolicy = .any) {
        
        assert(interval.min <= interval.max, "The Advertising_Interval_Min shall be less than or equal to the Advertising_Interval_Max.")
        
        assert(channelMap.rawValue != 0, "00000000b is Reserved for future use")
        
        self.interval = interval
        self.advertisingType = advertisingType
        self.ownAddressType = ownAddressType
        self.directAddresssType = directAddresssType
        self.directAddress = directAddress
        self.channelMap = channelMap
        self.filterPolicy = filterPolicy
    }
}

public extension HCILESetAdvertisingParameters {
    
    static var length: Int { return 2 + 2 + 1 + 1 + 1 + 6 + 1 + 1 }
    
    var data: Data {
        
        return Data(self)
    }
}

// MARK: - Data Convertible

extension HCILESetAdvertisingParameters: DataConvertible {
    
    var dataLength: Int {
        
        return type(of: self).length
    }
    
    static func += <T: DataContainer> (data: inout T, value: HCILESetAdvertisingParameters) {
        
        data += value.interval.min.rawValue.littleEndian
        data += value.interval.max.rawValue.littleEndian
        data += value.advertisingType.rawValue
        data += value.ownAddressType.rawValue
        data += value.directAddresssType.rawValue
        data += value.directAddress.littleEndian
        data += value.channelMap.rawValue
        data += value.filterPolicy.rawValue
    }
}

// MARK: - Supporting Types

public extension HCILESetAdvertisingParameters {
    
    enum AdvertisingType: UInt8 {
        
        /// Connectable undirected advertising event
        case undirected         = 0x00
        
        /// Connectable directed advertising event
        case directed           = 0x01
        
        /// Scannable undirected advertising event
        case scannable          = 0x02
        
        /// Non-connectable undirected advertising event
        case nonConnectable     = 0x03
        
        public init() { self = .undirected }
    }
    
    /// Channel Map
    enum ChannelMap: UInt8, BitMaskOption {
        
        /// Enable channel 37 use
        case channel37              = 0b00000001
        
        /// Enable channel 38 use
        case channel38              = 0b00000010
        
        /// Enable channel 39 use
        case channel39              = 0b00000100
        
        public static let allCases: [ChannelMap] = [.channel37, .channel38, .channel39]
    }
    
    /// Filter Policy
    enum FilterPolicy: UInt8 {
        
        /// Allow Scan Request from Any,
        /// Allow Connect Request from Any (default).
        case any                    = 0x00
        
        /// Allow Scan Request from White List Only,
        /// Allow Connect Request from Any.
        case whiteListScan          = 0x01
        
        /// Allow Scan Request from Any,
        /// Allow Connect Request from White List Only.
        case whiteListConnect       = 0x02
        
        /// Allow Scan Request from White List Only,
        /// Allow Connect Request from White List Only.
        case whiteListScanConnect   = 0x03
        
        public init() { self = .any }
        
        public init(whiteListScan: Bool,
                    whiteListConnect: Bool) {
            
            switch (whiteListScan, whiteListConnect) {
                
            case (false, false): self = .any
            case (true, false): self = .whiteListScan
            case (false, true): self = .whiteListConnect
            case (true, true): self = .whiteListScanConnect
            }
        }
        
        public var whiteList: (scan: Bool, connect: Bool) {
            
            switch self {
            case .any:                      return (false, false)
            case .whiteListScan:            return (true, false)
            case .whiteListConnect:         return (false, true)
            case .whiteListScanConnect:     return (true, true)
            }
        }
    }
}
