//
//  HCILEEnhancedConnectionCompleteV2.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 7/9/26.
//  Copyright © 2026 PureSwift. All rights reserved.
//

/// LE Enhanced Connection Complete Event (v2)
///
/// The event indicates to both of the Hosts forming the connection that a new
/// connection has been created.
///
/// Version 2 (Bluetooth 5.4) adds the `Advertising_Handle` and `Sync_Handle`
/// parameters, which identify the Periodic Advertising with Responses (PAwR)
/// advertising set and train the connection was created from, or 0xFF / 0xFFFF
/// if the connection was not created from PAwR.
@frozen
public struct HCILEEnhancedConnectionCompleteV2: HCIEventParameter {

    public static let event = LowEnergyEvent.enhancedConnectionCompleteV2  // 0x29

    public static let length: Int = 33

    public let status: HCIStatus

    public let connectionHandle: UInt16

    public let role: LowEnergyRole

    /// Peer Bluetooth address type.
    public let peerAddressType: LowEnergyAddressType  // Peer_Address_Type

    /// Public Device Address, or Random Device Address, Public Identity Address or
    /// Random (static) Identity Address of the connected device.
    public let peerAddress: BluetoothAddress

    /// Resolvable Private Address being used by the local device for this connection.
    public let localResolvablePrivateAddress: BluetoothAddress

    /// Resolvable Private Address being used by the peer device for this connection.
    public let peerResolvablePrivateAddress: BluetoothAddress

    /// Connection interval used on this connection.
    public let interval: LowEnergyConnectionInterval

    /// Peripheral latency for the connection in number of connection events.
    public let latency: LowEnergyConnectionLatency

    /// Connection supervision timeout.
    public let supervisionTimeout: LowEnergySupervisionTimeout

    public let masterClockAccuracy: LowEnergyClockAccuracy

    /// The advertising set the connection was created from.
    ///
    /// 0xFF if the connection was not created from a PAwR advertising train.
    public let advertisingHandle: UInt8  // Advertising_Handle

    /// The periodic advertising train the connection was created from.
    ///
    /// 0xFFFF if the connection was not created from a PAwR advertising train.
    public let syncHandle: UInt16  // Sync_Handle

    public init?<Data: DataContainer>(data: Data) {
        guard data.count == Self.length
        else { return nil }

        guard let status = HCIStatus(rawValue: data[0])
        else { return nil }

        let handle = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))

        guard let role = LowEnergyRole(rawValue: data[3])
        else { return nil }

        guard let peerAddressType = LowEnergyAddressType(rawValue: data[4])
        else { return nil }

        let peerAddress = BluetoothAddress(
            littleEndian: BluetoothAddress(
                bytes: (
                    data[5],
                    data[6], data[7],
                    data[8], data[9],
                    data[10]
                )))

        let localResolvablePrivateAddress = BluetoothAddress(
            littleEndian: BluetoothAddress(
                bytes: (
                    data[11],
                    data[12], data[13],
                    data[14], data[15],
                    data[16]
                )))

        let peerResolvablePrivateAddress = BluetoothAddress(
            littleEndian: BluetoothAddress(
                bytes: (
                    data[17],
                    data[18], data[19],
                    data[20], data[21],
                    data[22]
                )))

        let interval = LowEnergyConnectionInterval(rawValue: UInt16(littleEndian: UInt16(bytes: (data[23], data[24]))))

        guard let latency = LowEnergyConnectionLatency(rawValue: UInt16(littleEndian: UInt16(bytes: (data[25], data[26]))))
        else { return nil }

        guard let supervisionTimeout = LowEnergySupervisionTimeout(rawValue: UInt16(littleEndian: UInt16(bytes: (data[27], data[28]))))
        else { return nil }

        guard let masterClockAccuracy = LowEnergyClockAccuracy(rawValue: data[29])
        else { return nil }

        self.status = status
        self.connectionHandle = handle
        self.role = role
        self.peerAddressType = peerAddressType
        self.peerAddress = peerAddress
        self.localResolvablePrivateAddress = localResolvablePrivateAddress
        self.peerResolvablePrivateAddress = peerResolvablePrivateAddress
        self.interval = interval
        self.latency = latency
        self.supervisionTimeout = supervisionTimeout
        self.masterClockAccuracy = masterClockAccuracy
        self.advertisingHandle = data[30]
        self.syncHandle = UInt16(littleEndian: UInt16(bytes: (data[31], data[32])))
    }
}
