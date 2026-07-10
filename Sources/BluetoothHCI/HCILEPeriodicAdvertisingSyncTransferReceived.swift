//
//  HCILEPeriodicAdvertisingSyncTransferReceived.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 7/9/26.
//  Copyright © 2026 PureSwift. All rights reserved.
//

/// LE Periodic Advertising Sync Transfer Received Event
///
/// The event is used by the Controller to report that it has received periodic advertising
/// synchronization information from the connected device identified by the Connection_Handle
/// and either successfully synchronized to the periodic advertising train or timed out while
/// attempting to synchronize (Periodic Advertising Sync Transfer, PAST).
@frozen
public struct HCILEPeriodicAdvertisingSyncTransferReceived: HCIEventParameter {

    public static let event = LowEnergyEvent.periodicAdvertisingSyncTransferReceived  // 0x18

    public static let length = 19

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
    }
}
