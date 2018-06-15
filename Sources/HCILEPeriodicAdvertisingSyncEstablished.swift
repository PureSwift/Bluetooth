//
//  HCILEPeriodicAdvertisingSyncEstablished.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/15/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// LE Periodic Advertising Sync Established Event
///
/// The event indicates that the Controller has received the first periodic advertising packet from an advertiser
/// after the LE_Periodic_Advertising_Create_Sync Command has been sent to the Controller.
///
/// The Sync_Handle shall be assigned by the Controller.
///
/// This event indicates to the Host which issued an LE_Periodic_Advertising_Create_Sync command and received a
/// Command Status event if the periodic advertising reception failed or was successful.
public struct HCILEPeriodicAdvertisingSyncEstablished: HCIEventParameter {
    
    public static let event = LowEnergyEvent.periodicAdvertisingSyncEstablished // 0x0E
    
    public static let length = 15
    
    public let status: HCIStatus
    
    /// Sync_Handle to be used to identify the periodic advertiser
    /// Range: 0x0000-0x0EFF
    public let syncHandle: UInt16 // Sync_Handle
    
    /// Value of the Advertising SID subfield in the ADI field of the PDU
    public let advertisingSID: UInt8
    
    public let advertiserAddressType: LowEnergyAddressType
    
    public let advertiserAddress: Address
    
    public let advertiserPHY: AdvertiserPhy
    
    public let periodicAdvertisingInterval: PeriodicAdvertisingInterval
    
    public let advertiserClockAccuracy: LowEnergyClockAccuracy
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        guard let status = HCIStatus(rawValue: data[0])
            else { return nil }
        
        let syncHandle = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))
        
        let advertisingSID = data[3]
        
        guard let advertiserAddressType = LowEnergyAddressType(rawValue: data[4])
            else { return nil }
        
        let advertiserAddress = Address(littleEndian: Address(bytes: (data[5], data[6], data[7], data[8], data[9], data[10])))
        
        guard let advertiserPHY = AdvertiserPhy(rawValue: data[11])
            else { return nil }
        
        let periodicAdvertisingInterval = PeriodicAdvertisingInterval(rawValue: UInt16(littleEndian: UInt16(bytes: (data[12], data[13]))))
        
        guard let advertiserClockAccuracy = LowEnergyClockAccuracy(rawValue: data[14])
            else { return nil }
        
        self.status = status
        self.syncHandle = syncHandle
        self.advertisingSID = advertisingSID
        self.advertiserAddressType = advertiserAddressType
        self.advertiserAddress = advertiserAddress
        self.advertiserPHY = advertiserPHY
        self.periodicAdvertisingInterval = periodicAdvertisingInterval
        self.advertiserClockAccuracy = advertiserClockAccuracy
    }
    
    public enum AdvertiserPhy: UInt8 { // Advertiser_PHY
        
        /// Advertiser PHY is LE 1M
        case le1m       = 0x01
        
        /// Advertiser PHY is LE 2M
        case le2m       = 0x02
        
        /// Advertiser PHY is LE Coded
        case coded      = 0x03
    }
    
    public struct PeriodicAdvertisingInterval: RawRepresentable, Equatable, Hashable, Comparable {
        
        /// 7.5 msec
        public static let min = PeriodicAdvertisingInterval(0x0006)
        
        /// 4000 msec
        public static let max = PeriodicAdvertisingInterval(0xFFFF)
        
        public let rawValue: UInt16
        
        public init(rawValue: UInt16) {
            
            self.rawValue = rawValue
        }
        
        /// Time = N * 1.25 msec
        public var miliseconds: Double {
            
            return Double(rawValue) * 1.25
        }
        
        // Private, unsafe
        private init(_ rawValue: UInt16) {
            self.rawValue = rawValue
        }
        
        // Equatable
        public static func == (lhs: PeriodicAdvertisingInterval, rhs: PeriodicAdvertisingInterval) -> Bool {
            
            return lhs.rawValue == rhs.rawValue
        }
        
        // Comparable
        public static func < (lhs: PeriodicAdvertisingInterval, rhs: PeriodicAdvertisingInterval) -> Bool {
            
            return lhs.rawValue < rhs.rawValue
        }
        
        // Hashable
        public var hashValue: Int {
            
            return Int(rawValue)
        }
    }
}
