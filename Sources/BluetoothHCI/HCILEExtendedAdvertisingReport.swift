//
//  HCILEExtendedAdvertisingReport.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/15/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// LE Extended Advertising Report Event
///
/// The event indicates that one or more Bluetooth devices have responded to an active scan
/// or have broadcast advertisements that were received during a passive scan.
/// The Controller may coalesce multiple advertising reports from the same or different advertisers
/// into a single LE Extended Advertising Report event, provided all the parameters from all the advertising reports
/// fit in a single HCI event.
@frozen
public struct HCILEExtendedAdvertisingReport: HCIEventParameter {
    
    public static let event = LowEnergyEvent.extendedAdvertisingReport // 0x0D
    
    public static let length = 1 + Report.length // must have at least one report
    
    public let reports: [Report]
    
    public init?(data: Data) {
        
        guard data.count >= type(of: self).length
            else { return nil }
        
        // Number of responses in event.
        let reportCount = Int(data[0]) // Num_Reports
        
        // 0x01 - 0x0A
        guard reportCount > 0,
            reportCount <= 10
            else { return nil }
        
        var reports = [Report]()
        reports.reserveCapacity(reportCount)
        
        var offset = 1
        for _ in 0 ..< reportCount {
            
            let reportBytes = data.suffixNoCopy(from: offset)
            
            guard let report = Report(data: reportBytes)
                else { return nil }
            
            offset += Report.length + report.responseData.count
            reports.append(report)
        }
        
        self.reports = reports
    }
    
    public struct Report {
        
        public static let length = 2 + 1 + 6 + 1 + 1 + 1 + 1 + 1 + 2 + 1 + 6 + 1
        
        public let eventType: EventType
        
        public let addressType: AddressType
        
        public let address: BluetoothAddress
        
        public let primaryPHY: PrimaryPHY
        
        public let secondaryPHY: SecondaryPHY
        
        public let advertisingSID: UInt8
        
        public let txPower: LowEnergyTxPower
        
        public let rssi: RSSI
        
        public let periodicAdvertisingInterval: PeriodicAdvertisingInterval
        
        public let directAddressType: AddressType
        
        public let directAddress: BluetoothAddress
        
        public let responseData: Data //Data
        
        internal init?(data: Data) {
            
            guard data.count >= Report.length
                else { return nil }
            
            guard let eventType = EventType(rawValue: UInt16(bytes: (data[0], data[1]))),
                let addressType = AddressType(rawValue: data[2])
                else { return nil }
            
            let address = BluetoothAddress(littleEndian: BluetoothAddress(bytes: (data[3], data[4],
                                                                data[5], data[6],
                                                                data[7], data[8])))
            
            guard let primaryPHY = PrimaryPHY(rawValue: data[9]),
                let secondaryPHY = SecondaryPHY(rawValue: data[10])
                else { return nil }
            
            let advertisingSID = data[11]
            
            let txPowerByte = Int8(bitPattern: data[12])
            
            guard let txPower = LowEnergyTxPower(rawValue: txPowerByte)
                else { return nil }
            
            let rssiByte = Int8(bitPattern: data[13])
            
            guard let rssi = RSSI(rawValue: rssiByte)
                else { return nil }
            
            let periodicAdvertisingInterval = PeriodicAdvertisingInterval(rawValue: UInt16(bytes: (data[14], data[15])))
            
            guard let directAddressType = AddressType(rawValue: data[16])
                else { return nil }
            
            let directAddress = BluetoothAddress(littleEndian: BluetoothAddress(bytes: (data[17], data[18],
                                                                      data[19], data[20],
                                                                      data[21], data[22])))
            
            let dataLength = Int(data[23])
            
            let responseData = Data(data[24 ..< (24 + dataLength)])
            assert(data.count == dataLength)
            
            self.eventType = eventType
            self.addressType = addressType
            self.address = address
            self.primaryPHY = primaryPHY
            self.secondaryPHY = secondaryPHY
            self.advertisingSID = advertisingSID
            self.txPower = txPower
            self.rssi = rssi
            self.periodicAdvertisingInterval = periodicAdvertisingInterval
            self.directAddressType = directAddressType
            self.directAddress = directAddress
            self.responseData = responseData
        }
    }
    
    /// nterval of the periodic advertising
    /// Range: 0x0006 to 0xFFFF
    /// Time = N * 1.25 ms
    /// Time Range: 7.5 ms to 81,918.75 s
    public struct PeriodicAdvertisingInterval: RawRepresentable, Equatable, Hashable, Comparable {
        
        /// 7.5 msec
        public static let min = PeriodicAdvertisingInterval(0x0006)
        
        /// 81,918.75 sec
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
        
        // Comparable
        public static func < (lhs: PeriodicAdvertisingInterval, rhs: PeriodicAdvertisingInterval) -> Bool {
            
            return lhs.rawValue < rhs.rawValue
        }
    }
    
    /// Secondary_PHY
    public enum SecondaryPHY: UInt8 {
        
        /// No packets on the secondary advertising channel
        case noPackets  = 0x00
        
        /// Advertiser PHY is LE 1M
        case le1M       = 0x01
        
        /// Advertiser PHY is LE 2M
        case let2M      = 0x02
        
        /// Advertiser PHY is LE Coded
        case coded      = 0x03
    }
    
    /// Primary_PHY
    public enum PrimaryPHY: UInt8 {
        
        /// Advertiser PHY is LE 1M
        case le1M       = 0x01
        
        /// Advertiser PHY is LE Coded
        case coded      = 0x03
    }
    
    /// Address_Type
    public enum AddressType: UInt8 {
        
        /// Public Device Address (default)
        case publicDeviceAddress        = 0x00
        
        /// Random Device Address
        case randomDeviceAddress        = 0x01
        
        /// Public Identity Address (Corresponds to Resolved Private Address )
        case publicIdentityAddress      = 0x02
        
        /// Random (static) Identity Address (Corresponds to Resolved Private Address)
        case randomIdentyAddress        = 0x03
        
        /// No address provided (anonymous advertisement)
        case noAddressProvided          = 0xFF
    }
    
    /// Event Type
    public enum EventType: UInt16, BitMaskOption {
        
        /// Connectable advertising
        case connectableAdvertising         = 0b0000000000000001
        
        /// Scannable advertising
        case scannableAdvertising           = 0b0000000000000010
        
        /// Directed advertising
        case directedAdvertising            = 0b0000000000000100
        
        /// Scan response
        case scanResponse                   = 0b0000000000001000
        
        /// Legacy advertising PDUs used
        case legacyAdvertisingPDU           = 0b0000000000010000
        
        /// Data status: Complete
        case dataStatusComplete             = 0b0000000000000000
        
        /// Data status: Incomplete, more data to come
        case dataStatusIncompleteMoreData   = 0b0000000000100000
        
        /// Data status: Incomplete, data truncated, no more to come
        case dataStatusIncompleteTruncated  = 0b0000000001000000
        
        /// Data status: Reserved for future use
        case dataStatusReserved             = 0b0000000001100000
        
        /// All enum cases
        public static let allCases: [EventType] = [
            .connectableAdvertising,
            .scannableAdvertising,
            .directedAdvertising,
            .scanResponse,
            .legacyAdvertisingPDU,
            .dataStatusComplete,
            .dataStatusIncompleteMoreData,
            .dataStatusIncompleteTruncated,
            .dataStatusReserved
        ]
    }
}
