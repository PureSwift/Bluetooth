//
//  LowEnergyEventParameter.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 3/2/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

import Foundation

public extension LowEnergyEvent {
    
    /// LE Extended Advertising Report Event
    ///
    /// The event indicates that one or more Bluetooth devices have responded to an active scan
    /// or have broadcast advertisements that were received during a passive scan.
    /// The Controller may coalesce multiple advertising reports from the same or different advertisers
    /// into a single LE Extended Advertising Report event, provided all the parameters from all the advertising reports
    /// fit in a single HCI event.
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
                
                let reportBytes = Data(data.suffix(from: offset))
                
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
            
            public let address: Address
            
            public let primaryPHY: PrimaryPHY
            
            public let secondaryPHY: SecondaryPHY
            
            public let advertisingSID: UInt8
            
            public let txPower: LowEnergyTxPower
            
            public let rssi: RSSI
            
            public let periodicAdvertisingInterval: PeriodicAdvertisingInterval
            
            public let directAddressType: AddressType
            
            public let directAddress: Address
            
            public let responseData: Data //Data
            
            public init?(data: Data) {
                
                guard data.count >= Report.length
                    else { return nil }
                
                guard let eventType = EventType(rawValue: UInt16(bytes: (data[0], data[1]))),
                    let addressType = AddressType(rawValue: data[2])
                    else { return nil }
                
                let address = Address(littleEndian: Address(bytes: (data[3], data[4],
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
                
                let directAddress = Address(littleEndian: Address(bytes: (data[17], data[18],
                                    data[19], data[20],
                                    data[21], data[22])))
                
                let dataLength = Int(data[23])
                
                let data = Data(data[24 ..< (24 + dataLength)])
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
                self.responseData = data
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
            
            #if swift(>=3.2)
            #elseif swift(>=3.0)
            public typealias RawValue = UInt16
            #endif
            
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
            public static let all: Set<EventType> = [
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
    
    /// LE Periodic Advertising Sync Established Event
    ///
    /// The event indicates that the Controller has received the first periodic advertising packet from an advertiser
    /// after the LE_Periodic_Advertising_Create_Sync Command has been sent to the Controller.
    ///
    /// The Sync_Handle shall be assigned by the Controller.
    ///
    /// This event indicates to the Host which issued an LE_Periodic_Advertising_Create_Sync command and received a
    /// Command Status event if the periodic advertising reception failed or was successful.
    public struct PeriodicAdvertisingSyncEstablishedEventParameter: HCIEventParameter {
        
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
    
    /// LE Periodic Advertising Report Event
    ///
    /// The event indicates that the Controller has received a Periodic Advertising packet.
    public struct PeriodicAdvertisingReportEventParameter: HCIEventParameter {
        
        public static let event = LowEnergyEvent.periodicAdvertisingReport // 0x0F
        
        /// Minimum length
        public static let length = 7
        
        public let syncHandle: UInt16 // Sync_Handle
        
        public let txPower: LowEnergyTxPower
        
        public let rssi: RSSI
        
        /// This parameter is intended to be used in a future feature.
        public let unused: UInt8 // This value must be used by the Controller.
        
        public let dataStatus: DataStatus
        
        public let data: Data
        
        public init?(data: Data) {
            
            guard data.count >= type(of: self).length
                else { return nil }
            
            let syncHandle = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
            
            guard let txPower = LowEnergyTxPower(rawValue: Int8(bitPattern: data[2]))
                else { return nil }

            guard let rssi = RSSI(rawValue: Int8(bitPattern: data[3]))
                else { return nil }
            
            let unused = data[4]
            
            guard let dataStatus = DataStatus(rawValue: data[5])
                else { return nil }
            
            let dataLength = Int(data[6])
            
            if dataLength > 0 {
                
                let bytes = data[7 ... (7 + dataLength)]
                
                self.data = Data(bytes)
                
            } else {
                
                self.data = Data()
            }
            
            self.syncHandle = syncHandle
            self.txPower = txPower
            self.rssi = rssi
            self.unused = unused
            self.dataStatus = dataStatus
            
            assert(data.count == dataLength, "Invalid data length")
            assert(unused == 0xFF, "Invalid value for unused byte")
        }
        
        public enum DataStatus: UInt8 {
            
            /// Data complete
            case complete       = 0x00
            
            /// Data incomplete, more data to come
            case incomplete     = 0x01
            
            /// Data incomplete, data truncated, no more to come
            case truncated      = 0x02
        }
    }
    
    /// LE Periodic Advertising Sync Lost Event
    ///
    /// The event indicates that the Controller has not received a Periodic Advertising packet identified
    /// by Sync_Handle within the timeout period.
    public struct PeriodicAdvertisingSyncLostEventParameter: HCIEventParameter {
        
        public static let event = LowEnergyEvent.periodicAdvertisingSyncLost // 0x10
        
        public static let length = 2
        
        public let syncHandle: UInt16 // Sync_Handle
        
        public init?(data: Data) {
            
            guard data.count == type(of: self).length
                else { return nil }
            
            let syncHandle = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
            
            self.syncHandle = syncHandle
        }
    }
    
    /// LE Advertising Set Terminated Event
    ///
    /// The event indicates that the Controller has terminated advertising in the advertising sets specified by the Advertising_Handle parameter.
    public struct AdvertisingSetTerminatedEventParameter: HCIEventParameter {
        
        public static let event = LowEnergyEvent.advertisingSetTerminated // 0x12
        
        public static let length: Int = 5
        
        public let status: HCIStatus
        
        public let advertisingHandle: UInt8
        
        public let connectionHandle: UInt16 // Connection_Handle
        
        public let numCompletedExtendedAdvertisingEvents: UInt8
        
        public init?(data: Data) {
            
            guard data.count == type(of: self).length
                else { return nil }
            
            guard let status = HCIStatus(rawValue: data[0])
                else { return nil }
            
            let advertisingHandle =  data[1]
            
            let connectionHandle = UInt16(littleEndian: UInt16(bytes: (data[2], data[3])))
            
            let numCompletedExtendedAdvertisingEvents = data[4]
            
            self.status = status
            self.advertisingHandle = advertisingHandle
            self.connectionHandle = connectionHandle
            self.numCompletedExtendedAdvertisingEvents = numCompletedExtendedAdvertisingEvents
        }
    }
    
    /// LE Scan Request Received Event
    ///
    /// The vent indicates that a SCAN_REQ PDU or an AUX_SCAN_REQ PDU has been received by the advertiser.
    /// The request contains a device address from a scanner that is allowed by the advertising filter policy.
    /// The advertising set is identified by Advertising_Handle.
    public struct ScanRequestReceivedEventParameter: HCIEventParameter {
        
        public static let event = LowEnergyEvent.scanRequestReceived // 0x13
        
        public static let length: Int = 8
        
        public let advertisingHandle: UInt8
        
        public let scannerAddressType: LowEnergyAddressType
        
        public let scannerAddress: Address
        
        public init?(data: Data) {
            
            guard data.count == type(of: self).length
                else { return nil }
            
            let advertisingHandle =  data[0]
            
            guard let scannerAddressType = LowEnergyAddressType(rawValue: data[1])
                else { return nil }
            
            let scannerAddress = Address(littleEndian: Address(bytes: (data[2], data[3], data[4], data[5], data[6], data[7])))
            
            self.advertisingHandle = advertisingHandle
            self.scannerAddressType = scannerAddressType
            self.scannerAddress = scannerAddress
        }
    }
    
    /// LE Channel Selection Algorithm Event
    ///
    /// The LE Channel Selection Algorithm Event indicates which channel selection algorithm is used on a data channel connection.
    public struct ChannelSelectionAlgorithmEventParameter: HCIEventParameter {
        
        public static let event = LowEnergyEvent.channelSelectionAlgorithm // 0x14
        
        public static let length: Int = 3
    
        public let connectionHandle: UInt16 // Connection_Handle
        
        public let channelSelectionAlgorithm: ChannelSelectionAlgorithm
        
        public init?(data: Data) {
            guard data.count == type(of: self).length
                else { return nil }
            
            let connectionHandle = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
            
            guard let channelSelectionAlgorithm = ChannelSelectionAlgorithm.init(rawValue: data[2])
                else { return nil }
            
            self.connectionHandle = connectionHandle
            self.channelSelectionAlgorithm = channelSelectionAlgorithm
        }
        
        public enum ChannelSelectionAlgorithm: UInt8 { // Channel_Selection_Algorithm
            
            /// LE Channel Selection Algorithm #1 is used
            case algorithm1         = 0x00
            
            /// LE Channel Selection Algorithm #2 is used
            case algorithm2         = 0x01
        }
    }
}
