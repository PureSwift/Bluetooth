//
//  HCILEPeriodicAdvertisingSyncEstablishedV2.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 7/9/26.
//  Copyright © 2026 PureSwift. All rights reserved.
//

/// LE Periodic Advertising Sync Established Event (v2)
///
/// The event indicates that the Controller has received the first periodic advertising
/// packet from an advertiser after the LE_Periodic_Advertising_Create_Sync command has
/// been sent to the Controller.
///
/// Version 2 (Bluetooth 5.4) adds the `Num_Subevents`, `Subevent_Interval`,
/// `Response_Slot_Delay`, and `Response_Slot_Spacing` parameters describing the
/// Periodic Advertising with Responses (PAwR) train, or zero if the periodic
/// advertising train does not use responses.
@frozen
public struct HCILEPeriodicAdvertisingSyncEstablishedV2: HCIEventParameter {

    public static let event = LowEnergyEvent.periodicAdvertisingSyncEstablishedV2  // 0x24

    public static let length = 19

    public typealias AdvertiserPhy = HCILEPeriodicAdvertisingSyncEstablished.AdvertiserPhy

    public typealias PeriodicAdvertisingInterval = HCILEPeriodicAdvertisingSyncEstablished.PeriodicAdvertisingInterval

    public let status: HCIStatus

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

        let syncHandle = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))

        let advertisingSID = data[3]

        guard let advertiserAddressType = LowEnergyAddressType(rawValue: data[4])
        else { return nil }

        let advertiserAddress = BluetoothAddress(littleEndian: BluetoothAddress(bytes: (data[5], data[6], data[7], data[8], data[9], data[10])))

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
        self.numberOfSubevents = data[15]
        self.subeventInterval = data[16]
        self.responseSlotDelay = data[17]
        self.responseSlotSpacing = data[18]
    }
}
