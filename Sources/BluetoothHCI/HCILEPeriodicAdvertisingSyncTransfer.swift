//
//  HCILEPeriodicAdvertisingSyncTransfer.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 7/9/26.
//  Copyright © 2026 PureSwift. All rights reserved.
//

// MARK: - Method

public extension BluetoothHostControllerInterface {

    /// LE Periodic Advertising Sync Transfer Command
    ///
    /// Used by the Host to instruct the Controller to send synchronization information about the
    /// periodic advertising train identified by the Sync_Handle parameter to a connected device
    /// (Periodic Advertising Sync Transfer, PAST).
    func lowEnergyPeriodicAdvertisingSyncTransfer(
        connectionHandle: UInt16,
        serviceData: UInt16,
        syncHandle: UInt16,
        timeout: HCICommandTimeout = .default
    ) async throws -> UInt16 {

        let parameters = HCILEPeriodicAdvertisingSyncTransfer(
            connectionHandle: connectionHandle,
            serviceData: serviceData,
            syncHandle: syncHandle)

        let returnParameter = try await deviceRequest(parameters, HCILEPeriodicAdvertisingSyncTransferReturn.self, timeout: timeout)

        return returnParameter.connectionHandle
    }
}

// MARK: - Command

/// LE Periodic Advertising Sync Transfer Command
///
/// Used by the Host to instruct the Controller to send synchronization information about the
/// periodic advertising train identified by the Sync_Handle parameter to a connected device.
@frozen
public struct HCILEPeriodicAdvertisingSyncTransfer: HCICommandParameter {

    public static let command = HCILowEnergyCommand.periodicAdvertisingSyncTransfer  // 0x005A

    /// Connection_Handle of the connection to which the synchronization information is sent.
    public var connectionHandle: UInt16  // Connection_Handle

    /// A value provided by the Host for use by the peer Host.
    public var serviceData: UInt16  // Service_Data

    /// Identifies the periodic advertising train.
    public var syncHandle: UInt16  // Sync_Handle

    public init(
        connectionHandle: UInt16,
        serviceData: UInt16,
        syncHandle: UInt16
    ) {

        self.connectionHandle = connectionHandle
        self.serviceData = serviceData
        self.syncHandle = syncHandle
    }

    public func append<Data: DataContainer>(to data: inout Data) {

        let connectionHandleBytes = connectionHandle.littleEndian.bytes
        let serviceDataBytes = serviceData.littleEndian.bytes
        let syncHandleBytes = syncHandle.littleEndian.bytes

        data += [
            connectionHandleBytes.0,
            connectionHandleBytes.1,
            serviceDataBytes.0,
            serviceDataBytes.1,
            syncHandleBytes.0,
            syncHandleBytes.1
        ]
    }
}

// MARK: - Return Parameter

/// LE Periodic Advertising Sync Transfer Command
@frozen
public struct HCILEPeriodicAdvertisingSyncTransferReturn: HCICommandReturnParameter {

    public static let command = HCILowEnergyCommand.periodicAdvertisingSyncTransfer  // 0x005A

    public static let length: Int = 2

    public let connectionHandle: UInt16

    public init?<Data: DataContainer>(data: Data) {
        guard data.count == Self.length
        else { return nil }

        self.connectionHandle = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
    }
}
