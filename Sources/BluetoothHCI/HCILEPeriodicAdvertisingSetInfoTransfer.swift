//
//  HCILEPeriodicAdvertisingSetInfoTransfer.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 7/9/26.
//  Copyright © 2026 PureSwift. All rights reserved.
//

// MARK: - Method

public extension BluetoothHostControllerInterface {

    /// LE Periodic Advertising Set Info Transfer Command
    ///
    /// Used by the Host to instruct the Controller to send synchronization information about the
    /// periodic advertising in an advertising set to a connected device (Periodic Advertising Sync
    /// Transfer, PAST).
    func lowEnergyPeriodicAdvertisingSetInfoTransfer(
        connectionHandle: UInt16,
        serviceData: UInt16,
        advertisingHandle: UInt8,
        timeout: HCICommandTimeout = .default
    ) async throws -> UInt16 {

        let parameters = HCILEPeriodicAdvertisingSetInfoTransfer(
            connectionHandle: connectionHandle,
            serviceData: serviceData,
            advertisingHandle: advertisingHandle)

        let returnParameter = try await deviceRequest(parameters, HCILEPeriodicAdvertisingSetInfoTransferReturn.self, timeout: timeout)

        return returnParameter.connectionHandle
    }
}

// MARK: - Command

/// LE Periodic Advertising Set Info Transfer Command
///
/// Used by the Host to instruct the Controller to send synchronization information about the
/// periodic advertising in an advertising set to a connected device.
@frozen
public struct HCILEPeriodicAdvertisingSetInfoTransfer: HCICommandParameter {

    public static let command = HCILowEnergyCommand.periodicAdvertisingSetInfoTransfer  // 0x005B

    /// Connection_Handle of the connection to which the synchronization information is sent.
    public var connectionHandle: UInt16  // Connection_Handle

    /// A value provided by the Host for use by the peer Host.
    public var serviceData: UInt16  // Service_Data

    /// Used to identify the advertising set.
    public var advertisingHandle: UInt8  // Advertising_Handle

    public init(
        connectionHandle: UInt16,
        serviceData: UInt16,
        advertisingHandle: UInt8
    ) {

        self.connectionHandle = connectionHandle
        self.serviceData = serviceData
        self.advertisingHandle = advertisingHandle
    }

    public func append<Data: DataContainer>(to data: inout Data) {

        let connectionHandleBytes = connectionHandle.littleEndian.bytes
        let serviceDataBytes = serviceData.littleEndian.bytes

        data += [
            connectionHandleBytes.0,
            connectionHandleBytes.1,
            serviceDataBytes.0,
            serviceDataBytes.1,
            advertisingHandle
        ]
    }
}

// MARK: - Return Parameter

/// LE Periodic Advertising Set Info Transfer Command
@frozen
public struct HCILEPeriodicAdvertisingSetInfoTransferReturn: HCICommandReturnParameter {

    public static let command = HCILowEnergyCommand.periodicAdvertisingSetInfoTransfer  // 0x005B

    public static let length: Int = 2

    public let connectionHandle: UInt16

    public init?<Data: DataContainer>(data: Data) {
        guard data.count == Self.length
        else { return nil }

        self.connectionHandle = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
    }
}
