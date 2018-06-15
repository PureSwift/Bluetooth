//
//  HCILEPeriodicAdvertisingCreateSync.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// LE Periodic Advertising Create Sync Command
    ///
    /// The command is used to synchronize with periodic advertising from an advertiser
    /// and begin receiving periodic advertising packets.
    func setPeriodicAdvertisingCreateSyncParameters(_ parameters: HCILEPeriodicAdvertisingCreateSync,
                                                    timeout: HCICommandTimeout = .default)  throws {
        
        try deviceRequest(parameters, timeout: timeout)
    }
}

// MARK: - Command

/// LE Periodic Advertising Create Sync Command
///
/// The command is used to synchronize with periodic advertising from an advertiser
/// and begin receiving periodic advertising packets.
public struct HCILEPeriodicAdvertisingCreateSync: HCICommandParameter {
    
    public static let command = HCILowEnergyCommand.periodicAdvertisingCreateSync //0x0044
    
    public let filterPolicy: FilterPolicy
    
    public let advertisingSid: UInt8
    
    public let advertisingAddressType: AdvertisingAddressType
    
    public let address: Address
    
    /// The number of periodic advertising packets that can be skipped after
    /// a successful receive
    /// Range: 0x0000 to 0x01F3
    public let skip: UInt16
    
    public let syncTimeout: SyncTimeout
    
    /// This value must be used by the Host
    public let unused: UInt8
    
    public init(filterPolicy: FilterPolicy,
                advertisingSid: UInt8,
                advertisingAddressType: AdvertisingAddressType,
                address: Address,
                skip: UInt16,
                syncTimeout: SyncTimeout,
                unused: UInt8) {
        self.filterPolicy = filterPolicy
        self.advertisingSid = advertisingSid
        self.advertisingAddressType = advertisingAddressType
        self.address = address
        self.skip = skip
        self.syncTimeout = syncTimeout
        self.unused = unused
    }
    
    public var data: Data {
        
        let addressBytes = address.littleEndian.bytes
        let skipBytes = skip.littleEndian.bytes
        let syncTimeoutBytes = syncTimeout.rawValue.littleEndian.bytes
        
        return Data([
            filterPolicy.rawValue,
            advertisingSid,
            advertisingAddressType.rawValue,
            addressBytes.0,
            addressBytes.1,
            addressBytes.2,
            addressBytes.3,
            addressBytes.4,
            addressBytes.5,
            skipBytes.0,
            skipBytes.1,
            syncTimeoutBytes.0,
            syncTimeoutBytes.1,
            unused
            ])
    }
    
    public struct SyncTimeout: RawRepresentable, Equatable, Hashable, Comparable {
        
        /// 100 msec
        public static let min = SyncTimeout(0x000A)
        
        /// 163.84 seconds
        public static let max = SyncTimeout(0x4000)
        
        public let rawValue: UInt16
        
        public init?(rawValue: UInt16) {
            
            guard rawValue >= SyncTimeout.min.rawValue,
                rawValue <= SyncTimeout.max.rawValue
                else { return nil }
            
            assert((SyncTimeout.min.rawValue ... SyncTimeout.max.rawValue).contains(rawValue))
            
            self.rawValue = rawValue
        }
        
        /// Time = N * 10 msec
        public var miliseconds: Double {
            
            return Double(rawValue) * 10
        }
        
        // Private, unsafe
        private init(_ rawValue: UInt16) {
            self.rawValue = rawValue
        }
        
        // Equatable
        public static func == (lhs: SyncTimeout, rhs: SyncTimeout) -> Bool {
            
            return lhs.rawValue == rhs.rawValue
        }
        
        // Comparable
        public static func < (lhs: SyncTimeout, rhs: SyncTimeout) -> Bool {
            
            return lhs.rawValue < rhs.rawValue
        }
        
        // Hashable
        public var hashValue: Int {
            
            return Int(rawValue)
        }
    }
    
    public enum AdvertisingAddressType: UInt8 { //Advertising_Address_Type
        
        /// Public Device Address
        case publicDeviceAddress = 0x00
        
        /// Random Device Address
        case randomDeviceAddress = 0x01
    }
    
    public enum FilterPolicy: UInt8 { //Filter_Policy
        
        /// Use the Advertising_SID, Advertising_Address_Type,
        /// and Advertising_Address parameters to determine which advertiser to listen to.
        case useAdvertisingSIDAndAddressTypeAndAddress = 0x00
        
        /// Use the Periodic Advertiser List to determine which advertiser to listen to.
        case usePeriodicAdvertiserList = 0x01
    }
}
