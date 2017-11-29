//
//  LowEnergyEventParameter.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 3/2/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

public extension LowEnergyEvent {
    
    /// LE Connection Complete
    public struct ConnectionCompleteParameter: HCIEventParameter {
        
        public static let event = LowEnergyEvent.connectionComplete
        public static let length = 18
        
        public var status: UInt8 = 0
        public var handle: UInt16 = 0
        public var role: UInt8 = 0
        public var peerAddressType: LowEnergyAddressType = LowEnergyAddressType()
        public var peerAddress: Address = Address()
        public var interval: UInt16 = 0
        public var latency: UInt16 = 0
        public var supervisionTimeout: UInt16 = 0
        public var masterClockAccuracy: UInt8 = 0
        
        public init?(byteValue: [UInt8]) {
            
            fatalError("Not implemented")
        }
    }
    
    /// LE Advertising Report Event
    /// 
    /// The LE Advertising Report event indicates that a Bluetooth device 
    /// or multiple Bluetooth devices have responded to an active scan 
    /// or received some information during a passive scan. 
    /// The Controller may queue these advertising reports and send 
    /// information from multiple devices in one LE Advertising Report event.
    public struct AdvertisingReportEventParameter: HCIEventParameter {
        
        public static let event = LowEnergyEvent.advertisingReport
        public static let length = 1 + Report.length // must have at least one report
        
        public let reports: [Report]
        
        public init?(byteValue: [UInt8]) {
            
            guard byteValue.count >= AdvertisingReportEventParameter.length
                else { return nil }
            
            // Number of responses in event.
            let reportCount = Int(byteValue[0]) // Num_Reports
            
            // 0x01 - 0x19
            guard reportCount > 0,
                reportCount <= 19
                else { return nil }
            
            var reports = [Report]()
            reports.reserveCapacity(reportCount)
            
            var offset = 1
            for _ in 0 ..< reportCount {
                
                let reportBytes = [UInt8](byteValue.suffix(from: offset))
                
                guard let report = Report(byteValue: reportBytes)
                    else { return nil }
                
                offset += Report.length + report.data.count
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
            public let data: [UInt8] // Data
            
            /// RSSI
            ///
            /// Size: 1 Octet (signed integer) 
            /// Range: -127 ≤ N ≤ +20
            /// Units: dBm
            public let rssi: RSSI? // RSSI
            
            public init?(byteValue: [UInt8]) {
                
                guard byteValue.count >= Report.length
                    else { return nil }
                
                // parse enums
                guard let event = Event(rawValue: byteValue[0]),
                    let addressType = LowEnergyAddressType(rawValue: byteValue[1])
                    else { return nil }
                
                let address = Address(littleEndian:
                    Address(bytes: (byteValue[2],
                                    byteValue[3],
                                    byteValue[4],
                                    byteValue[5],
                                    byteValue[6],
                                    byteValue[7])))
                
                let length = Int(byteValue[8])
                
                self.event = event
                self.addressType = addressType
                self.address = address
                
                let data = [UInt8](byteValue[9 ..< (9 + length)])
                assert(data.count == length)
                self.data = data
                
                // not enough bytes
                guard byteValue.count == (Report.length + length)
                    else { return nil }
                
                // last byte
                let rssiByte = Int8(bitPattern: byteValue[9 + length])
                self.rssi = RSSI(rawValue: rssiByte)
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
            
            /// RSSI
            ///
            /// Size: 1 Octet (signed integer)
            /// Range: -127 ≤ N ≤ +20
            /// Units: dBm
            public struct RSSI: RawRepresentable, Equatable, Comparable, Hashable {
                
                public let rawValue: Int8
                
                public init?(rawValue: Int8) {
                    
                    guard -127 <= rawValue,
                        rawValue <= +20
                        else { return nil }
                    
                    self.rawValue = rawValue
                }
                
                // Equatable
                public static func == (lhs: RSSI, rhs: RSSI) -> Bool {
                    
                    return lhs.rawValue == rhs.rawValue
                }
                
                // Comparable
                public static func < (lhs: RSSI, rhs: RSSI) -> Bool {
                    
                    return lhs.rawValue < rhs.rawValue
                }
                
                // Hashable
                public var hashValue: Int {
                    
                    return Int(rawValue)
                }
            }
        }
    }
}
