//
//  HCILEPeriodicAdvertisingReportV2.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 7/9/26.
//  Copyright © 2026 PureSwift. All rights reserved.
//

import Bluetooth

/// LE Periodic Advertising Report Event (v2)
///
/// The event indicates that the Controller has received a Periodic Advertising packet.
///
/// Version 2 (Bluetooth 5.4) adds the `Periodic_Event_Counter` and `Subevent`
/// parameters, indicating the event and subevent of a Periodic Advertising with
/// Responses (PAwR) train that the packet was received in.
@frozen
public struct HCILEPeriodicAdvertisingReportV2<ReportData: DataContainer>: HCIEventParameter {

    public static var event: LowEnergyEvent { .periodicAdvertisingReportV2 }  // 0x25

    /// Minimum length
    public static var length: Int { 10 }

    public typealias DataStatus = HCILEPeriodicAdvertisingReport<ReportData>.DataStatus

    public let syncHandle: UInt16  // Sync_Handle

    public let txPower: LowEnergyTxPower

    public let rssi: RSSI

    /// Type of Constant Tone Extension in the periodic advertising packet.
    public let cteType: UInt8  // CTE_Type

    /// The value of the periodic event counter of the packet.
    public let periodicEventCounter: UInt16  // Periodic_Event_Counter

    /// The subevent number of the packet, or 0xFF if received in a periodic
    /// advertising train without responses.
    public let subevent: UInt8  // Subevent

    public let dataStatus: DataStatus

    public let data: ReportData

    public init?<Data: DataContainer>(data: Data) {

        guard data.count >= Self.length
        else { return nil }

        self.syncHandle = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))

        guard let txPower = LowEnergyTxPower(rawValue: Int8(bitPattern: data[2]))
        else { return nil }
        self.txPower = txPower

        guard let rssi = RSSI(rawValue: Int8(bitPattern: data[3]))
        else { return nil }
        self.rssi = rssi

        self.cteType = data[4]

        self.periodicEventCounter = UInt16(littleEndian: UInt16(bytes: (data[5], data[6])))

        self.subevent = data[7]

        guard let dataStatus = DataStatus(rawValue: data[8])
        else { return nil }
        self.dataStatus = dataStatus

        let dataLength = Int(data[9])

        guard data.count >= Self.length + dataLength
        else { return nil }

        if dataLength > 0 {
            self.data = ReportData(data[10..<10 + dataLength])
        } else {
            self.data = ReportData()
        }
    }
}
