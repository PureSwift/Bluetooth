//
//  HCILEPeriodicAdvertisingSyncTransferReceivedV2.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 7/9/26.
//  Copyright © 2026 PureSwift. All rights reserved.
//

/// LE Periodic Advertising Sync Transfer Received Event (v2)
///
/// The event is used by the Controller to report that it has received periodic
/// advertising synchronization information from the connected device identified by
/// the Connection_Handle and either successfully synchronized to the periodic
/// advertising train or timed out while attempting to synchronize.
///
/// Version 2 (Bluetooth 5.4) adds the `Num_Subevents`, `Subevent_Interval`,
/// `Response_Slot_Delay`, and `Response_Slot_Spacing` parameters describing the
/// Periodic Advertising with Responses (PAwR) train, or zero if the periodic
/// advertising train does not use responses.
@frozen
public struct HCILEPeriodicAdvertisingSyncTransferReceivedV2: HCIEventParameter {

    public static let event = LowEnergyEvent.periodicAdvertisingSyncTransferReceivedV2  // 0x26

    public static let length = 23

    public typealias AdvertiserPhy = HCILEPeriodicAdvertisingSyncEstablished.AdvertiserPhy

    public typealias PeriodicAdvertisingInterval = HCILEPeriodicAdvertisingSyncEstablished.PeriodicAdvertisingInterval

    public let status: HCIStatus

    /// Connection handle of the connection the synchronization information
    /// was received over.
    public let connectionHandle: UInt16  // Connection_Handle

    /// A value provided by the peer device.
    public let serviceData: UInt16  // Service_Data

    /// Sync_Handle to be used to identify the periodic advertiser
    /// Range: 0x0000-0x0EFF
    public let syncHandle: UInt16  // Sync_Handle

    /// Value of the Advertising SID subfield in the ADI field of the PDU
    public let advertisingSID: UInt8

    public let advertiserAddressType: LowEnergyAddressType

    public let advertiserAddress: BluetoothAddress

    public let advertiserPHY: AdvertiserPhy

    public let periodicAdvertisingInterval: PeriodicAdvertisingInterval

    public let advertiserClockAccuracy: LowEnergyClockAccuracy

    /// Number of subevents (0 if the periodic advertising train has no responses).
    public let numberOfSubevents: UInt8  // Num_Subevents

    /// Time between the subevents of PAwR.
    ///
    /// Time = N × 1.25 ms
    public let subeventInterval: UInt8  // Subevent_Interval

    /// Time between the advertising packet in a subevent and the first response slot.
    ///
    /// Time = N × 1.25 ms
    public let responseSlotDelay: UInt8  // Response_Slot_Delay

    /// Time between response slots.
    ///
    /// Time = N × 0.125 ms
    public let responseSlotSpacing: UInt8  // Response_Slot_Spacing

    public init?<Data: DataContainer>(data: Data) {

        guard data.count == Self.length
        else { return nil }

        guard let status = HCIStatus(rawValue: data[0])
        else { return nil }

        let connectionHandle = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))

        let serviceData = UInt16(littleEndian: UInt16(bytes: (data[3], data[4])))

        let syncHandle = UInt16(littleEndian: UInt16(bytes: (data[5], data[6])))

        let advertisingSID = data[7]

        guard let advertiserAddressType = LowEnergyAddressType(rawValue: data[8])
        else { return nil }

        let advertiserAddress = BluetoothAddress(littleEndian: BluetoothAddress(bytes: (data[9], data[10], data[11], data[12], data[13], data[14])))

        guard let advertiserPHY = AdvertiserPhy(rawValue: data[15])
        else { return nil }

        let periodicAdvertisingInterval = PeriodicAdvertisingInterval(rawValue: UInt16(littleEndian: UInt16(bytes: (data[16], data[17]))))

        guard let advertiserClockAccuracy = LowEnergyClockAccuracy(rawValue: data[18])
        else { return nil }

        self.status = status
        self.connectionHandle = connectionHandle
        self.serviceData = serviceData
        self.syncHandle = syncHandle
        self.advertisingSID = advertisingSID
        self.advertiserAddressType = advertiserAddressType
        self.advertiserAddress = advertiserAddress
        self.advertiserPHY = advertiserPHY
        self.periodicAdvertisingInterval = periodicAdvertisingInterval
        self.advertiserClockAccuracy = advertiserClockAccuracy
        self.numberOfSubevents = data[19]
        self.subeventInterval = data[20]
        self.responseSlotDelay = data[21]
        self.responseSlotSpacing = data[22]
    }
}
