//
//  HCILEDirectedAdvertisingReport.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/15/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// LE Directed Advertising Report Event
///
/// The event indicates that directed advertisements have been received where the advertiser
/// is using a resolvable private address for the TargetA field of the advertising PDU which
/// the Controller is unable to resolve and the Scanning_Filter_Policy is equal to 0x02 or 0x03.
public struct HCILEDirectedAdvertisingReport: HCIEventParameter {
    
    public static let event = LowEnergyEvent.directedAdvertisingReport // 0x0B
    
    public static let length = 1 + Report.length // must have at least one report
    
    public let reports: [Report]
    
    public init?(data: Data) {
        
        guard data.count >= type(of: self).length
            else { return nil }
        
        // Number of responses in event.
        let reportCount = Int(data[0]) // Num_Reports
        
        // 0x01 - 0x19
        guard reportCount > 0,
            reportCount <= 25
            else { return nil }
        
        var reports = [Report]()
        reports.reserveCapacity(reportCount)
        
        var offset = 1
        for _ in 0 ..< reportCount {
            
            let reportBytes = Data(data.suffix(from: offset))
            
            guard let report = Report(data: reportBytes)
                else { return nil }
            
            offset += Report.length
            reports.append(report)
        }
        
        self.reports = reports
    }
    
    public struct Report {
        
        public static let length = 1 + 1 + 6 + 1 + 6 + 1
        
        public let event: UInt8
        
        public let addressType: AddressType // Address_Type
        
        /// Public Device Address, Random Device Address, Public Identity Address or
        /// Random (static) Identity Address of the advertising device.
        public let address: Address // Address
        
        public let directAddressType: UInt8
        
        /// Random Device Address
        public let directAddress: Address // Direct_Address
        
        /// RSSI
        ///
        /// Size: 1 Octet (signed integer)
        /// Range: -127 ≤ N ≤ +20
        /// Units: dBm
        public let rssi: RSSI // RSSI
        
        public init?(data: Data) {
            
            guard data.count >= Report.length
                else { return nil }
            
            // parse enums
            let event = data[0]
            
            guard let addressType = AddressType(rawValue: data[1])
                else { return nil }
            
            let address = Address(littleEndian:
                Address(bytes: (data[2],
                                data[3],
                                data[4],
                                data[5],
                                data[6],
                                data[7])))
            
            let directAddressType = data[8]
            
            let directAddress = Address(littleEndian:
                Address(bytes: (data[9],
                                data[10],
                                data[11],
                                data[12],
                                data[13],
                                data[14])))
            
            let rssiByte = Int8(bitPattern: data[15])
            
            guard let rssi = RSSI(rawValue: rssiByte)
                else { return nil }
            
            self.event = event
            self.addressType = addressType
            self.address = address
            self.directAddressType = directAddressType
            self.directAddress = directAddress
            self.rssi = rssi
        }
    }
    
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
}
