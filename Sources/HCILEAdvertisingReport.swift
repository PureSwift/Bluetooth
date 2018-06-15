//
//  HCILEAdvertisingReport.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// LE Advertising Report Event
///
/// The LE Advertising Report event indicates that a Bluetooth device
/// or multiple Bluetooth devices have responded to an active scan
/// or received some information during a passive scan.
/// The Controller may queue these advertising reports and send
/// information from multiple devices in one LE Advertising Report event.
public struct HCILEAdvertisingReport: HCIEventParameter {
    
    public static let event = LowEnergyEvent.advertisingReport // 0x02
    
    public static let length = 1 + Report.length // must have at least one report
    
    public let reports: [Report]
    
    public init?(data: Data) {
        
        guard data.count >= type(of: self).length
            else { return nil }
        
        // Number of responses in event.
        let reportCount = Int(data[0]) // Num_Reports
        
        // 0x01 - 0x19
        guard reportCount >= 0x01,
            reportCount <= 0x19
            else { return nil }
        
        var reports = [Report]()
        reports.reserveCapacity(reportCount)
        
        var offset = 1
        for _ in 0 ..< reportCount {
            
            let reportBytes = Data(data.suffix(from: offset))
            
            guard let report = Report(data: reportBytes)
                else { return nil }
            
            offset += Report.length + report.responseData.count
            reports.append(report)
        }
        
        self.reports = reports
    }
    
    public struct Report {
        
        public static let length = 1 + 1 + 6 + 1 + /* 0 - 31 */ 0 + 1
        
        public let event: Event
        
        public let addressType: LowEnergyAddressType // Address_Type
        
        public let address: Address // Address
        
        /// Advertising or scan response data
        public let responseData: Data // Data
        
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
            guard let event = Event(rawValue: data[0]),
                let addressType = LowEnergyAddressType(rawValue: data[1])
                else { return nil }
            
            let address = Address(littleEndian:
                Address(bytes: (data[2],
                                data[3],
                                data[4],
                                data[5],
                                data[6],
                                data[7])))
            
            let length = Int(data[8])
            
            self.event = event
            self.addressType = addressType
            self.address = address
            
            let responseData = Data(data[9 ..< (9 + length)])
            assert(responseData.count == length)
            self.responseData = responseData
            
            // not enough bytes
            guard data.count == (Report.length + length)
                else { return nil }
            
            // last byte
            let rssiByte = Int8(bitPattern: data[9 + length])
            
            guard let rssi = RSSI(rawValue: rssiByte)
                else { return nil }
            
            self.rssi = rssi
        }
        
        public enum Event: UInt8 { // Event_Type
            
            /// Connectable undirected advertising event
            case undirected         = 0x00 // ADV_IND
            
            /// Connectable directed advertising event
            case directed           = 0x01 // ADV_DIRECT_IND
            
            /// Scannable undirected advertising event
            case scannable          = 0x02 // ADV_SCAN_IND
            
            /// Non-connectable undirected advertising event
            case nonConnectable     = 0x03 // ADV_NONCONN_IND
            
            /// Scan Response
            case scanResponse       = 0x04 // SCAN_RSP
        }
    }
}
