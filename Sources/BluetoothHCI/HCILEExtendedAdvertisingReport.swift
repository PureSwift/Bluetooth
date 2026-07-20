//
//  HCILEExtendedAdvertisingReport.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/15/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Bluetooth

/// LE Extended Advertising Report Event
///
/// The event indicates that one or more Bluetooth devices have responded to an active scan
/// or have broadcast advertisements that were received during a passive scan.
/// The Controller may coalesce multiple advertising reports from the same or different advertisers
/// into a single LE Extended Advertising Report event, provided all the parameters from all the advertising reports
/// fit in a single HCI event.
@frozen
public struct HCILEExtendedAdvertisingReport<ReportData: DataContainer>: HCIEventParameter {

    public static var event: LowEnergyEvent { .extendedAdvertisingReport }  // 0x0D

    public static var length: Int { 1 + Report.length }  // must have at least one report

    public let reports: [Report]

    public init?<Data: DataContainer>(data: Data) {

        guard data.count >= Self.length
        else { return nil }

        // Number of responses in event.
        let reportCount = Int(data[0])  // Num_Reports

        // 0x01 - 0x0A
        guard reportCount > 0,
            reportCount <= 10
        else { return nil }

        var reports = [Report]()
        reports.reserveCapacity(reportCount)

        var offset = 1
        for _ in 0..<reportCount {

            let reportBytes = ReportData(data.suffix(from: offset))

            guard let report = Report(data: reportBytes)
            else { return nil }

            offset += Report.length + report.responseData.count
            reports.append(report)
        }

        self.reports = reports
    }

    public struct Report {

        public static var length: Int { 2 + 1 + 6 + 1 + 1 + 1 + 1 + 1 + 2 + 1 + 6 + 1 }

        public let eventType: EventType

        public let addressType: AddressType

        public let address: BluetoothAddress

        public let primaryPHY: PrimaryPHY

        public let secondaryPHY: SecondaryPHY

        public let advertisingSID: UInt8?

        public let txPower: LowEnergyTxPower?

        public let rssi: RSSI?

        public let periodicAdvertisingInterval: PeriodicAdvertisingInterval

        public let directAddressType: AddressType

        public let directAddress: BluetoothAddress

        public let responseData: ReportData  //Data

        internal init?<Data: DataContainer>(data: Data) {

            guard data.count >= Report.length
            else { return nil }

            let eventType = EventType(rawValue: UInt16(littleEndian: UInt16(bytes: (data[0], data[1]))))

            guard let addressType = AddressType(rawValue: data[2])
            else { return nil }

            let address = BluetoothAddress(
                littleEndian: BluetoothAddress(
                    bytes: (
                        data[3], data[4],
                        data[5], data[6],
                        data[7], data[8]
                    )))

            let primaryPHY = PrimaryPHY(rawValue: data[9]) ?? .le1M

            guard let secondaryPHY = SecondaryPHY(rawValue: data[10])
            else { return nil }

            let advertisingSID = data[11] == 0xFF ? nil : data[11]

            let txPowerByte = Int8(bitPattern: data[12])

            let txPower = LowEnergyTxPower(rawValue: txPowerByte)

            let rssiByte = Int8(bitPattern: data[13])

            let rssi = RSSI(rawValue: rssiByte)

            let periodicAdvertisingInterval = PeriodicAdvertisingInterval(rawValue: UInt16(bytes: (data[14], data[15])))

            guard let directAddressType = AddressType(rawValue: data[16])
            else { return nil }

            let directAddress = BluetoothAddress(
                littleEndian: BluetoothAddress(
                    bytes: (
                        data[17], data[18],
                        data[19], data[20],
                        data[21], data[22]
                    )))

            let dataLength = Int(data[23])

            let responseData = ReportData(data[24..<(24 + dataLength)])
            assert(responseData.count == dataLength)

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
        public static var min: PeriodicAdvertisingInterval { PeriodicAdvertisingInterval(0x0006) }

        /// 81,918.75 sec
        public static var max: PeriodicAdvertisingInterval { PeriodicAdvertisingInterval(0xFFFF) }

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
        case noPackets = 0x00

        /// Advertiser PHY is LE 1M
        case le1M = 0x01

        /// Advertiser PHY is LE 2M
        case let2M = 0x02

        /// Advertiser PHY is LE Coded
        ///
        /// When the Controller supports Advertising Coding Selection (Bluetooth 5.4),
        /// this value indicates LE Coded with S=8 coding.
        case coded = 0x03

        /// Advertiser PHY is LE Coded with S=2 coding.
        ///
        /// Only used when the Controller supports Advertising Coding Selection (Bluetooth 5.4).
        case codedS2 = 0x04
    }

    /// Primary_PHY
    public enum PrimaryPHY: UInt8 {

        /// Advertiser PHY is LE 1M
        case le1M = 0x01

        /// Advertiser PHY is LE Coded
        ///
        /// When the Controller supports Advertising Coding Selection (Bluetooth 5.4),
        /// this value indicates LE Coded with S=8 coding.
        case coded = 0x03

        /// Advertiser PHY is LE Coded with S=2 coding.
        ///
        /// Only used when the Controller supports Advertising Coding Selection (Bluetooth 5.4).
        case codedS2 = 0x04
    }

    /// Address_Type
    public enum AddressType: UInt8 {

        /// Public Device Address (default)
        case publicDeviceAddress = 0x00

        /// Random Device Address
        case randomDeviceAddress = 0x01

        /// Public Identity Address (Corresponds to Resolved Private Address )
        case publicIdentityAddress = 0x02

        /// Random (static) Identity Address (Corresponds to Resolved Private Address)
        case randomIdentyAddress = 0x03

        /// No address provided (anonymous advertisement)
        case noAddressProvided = 0xFF
    }

    /// Event Type
    public struct EventType: OptionSet, Hashable, Sendable, CaseIterable {

        public let rawValue: UInt16

        public init(rawValue: UInt16) {
            self.rawValue = rawValue
        }

        // Nested inside a generic type, so these are computed rather than stored.

        /// Connectable advertising
        public static var connectableAdvertising: EventType { EventType(rawValue: 0b00000000_00000001) }

        /// Scannable advertising
        public static var scannableAdvertising: EventType { EventType(rawValue: 0b00000000_00000010) }

        /// Directed advertising
        public static var directedAdvertising: EventType { EventType(rawValue: 0b00000000_00000100) }

        /// Scan response
        public static var scanResponse: EventType { EventType(rawValue: 0b00000000_00001000) }

        /// Legacy advertising PDUs used
        public static var legacyAdvertisingPDU: EventType { EventType(rawValue: 0b00000000_00010000) }

        /// Data status: Complete
        public static var dataStatusComplete: EventType { EventType(rawValue: 0b00000000_00000000) }

        /// Data status: Incomplete, more data to come
        public static var dataStatusIncompleteMoreData: EventType { EventType(rawValue: 0b00000000_00100000) }

        /// Data status: Incomplete, data truncated, no more to come
        public static var dataStatusIncompleteTruncated: EventType { EventType(rawValue: 0b00000000_01000000) }

        /// Data status: Reserved for future use
        public static var dataStatusReserved: EventType { EventType(rawValue: 0b00000000_01100000) }

        public static var allCases: [EventType] { [
            .connectableAdvertising,
            .scannableAdvertising,
            .directedAdvertising,
            .scanResponse,
            .legacyAdvertisingPDU,
            .dataStatusComplete,
            .dataStatusIncompleteMoreData,
            .dataStatusIncompleteTruncated,
            .dataStatusReserved
        ] }
    }
}
