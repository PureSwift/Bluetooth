//
//  HCILESetPeriodicSyncSubevent.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 7/9/26.
//  Copyright © 2026 PureSwift. All rights reserved.
//

// MARK: - Method

public extension BluetoothHostControllerInterface {

    /// LE Set Periodic Sync Subevent Command
    ///
    /// Used by the Host to instruct the Controller to synchronize with a subset of the
    /// subevents within a Periodic Advertising with Responses (PAwR) advertising train
    /// (Bluetooth 5.4).
    func lowEnergySetPeriodicSyncSubevent(
        syncHandle: UInt16,
        periodicAdvertisingProperties: HCILESetPeriodicSyncSubevent.PeriodicAdvertisingProperties,
        subevents: [UInt8],
        timeout: HCICommandTimeout = .default
    ) async throws -> UInt16 {

        let parameters = HCILESetPeriodicSyncSubevent(
            syncHandle: syncHandle,
            periodicAdvertisingProperties: periodicAdvertisingProperties,
            subevents: subevents)

        let returnParameter = try await deviceRequest(parameters, HCILESetPeriodicSyncSubeventReturn.self, timeout: timeout)

        return returnParameter.syncHandle
    }
}

// MARK: - Command

/// LE Set Periodic Sync Subevent Command
///
/// Used by the Host to instruct the Controller to synchronize with a subset of the
/// subevents within a PAwR advertising train identified by the Sync_Handle, listen
/// for packets sent by the peer device in these subevents, and send subevent
/// responses.
@frozen
public struct HCILESetPeriodicSyncSubevent: HCICommandParameter {

    public static let command = HCILowEnergyCommand.setPeriodicSyncSubevent  // 0x0084

    /// Identifies the PAwR advertising train.
    public var syncHandle: UInt16  // Sync_Handle

    /// Properties of the advertisement.
    public var periodicAdvertisingProperties: PeriodicAdvertisingProperties  // Periodic_Advertising_Properties

    /// The subevents to synchronize with.
    public var subevents: [UInt8]  // Subevent

    public init(
        syncHandle: UInt16,
        periodicAdvertisingProperties: PeriodicAdvertisingProperties = [],
        subevents: [UInt8]
    ) {

        self.syncHandle = syncHandle
        self.periodicAdvertisingProperties = periodicAdvertisingProperties
        self.subevents = subevents
    }

    public func append<Data: DataContainer>(to data: inout Data) {

        let syncHandleBytes = syncHandle.littleEndian.bytes
        let propertiesBytes = periodicAdvertisingProperties.rawValue.littleEndian.bytes

        data += [
            syncHandleBytes.0,
            syncHandleBytes.1,
            propertiesBytes.0,
            propertiesBytes.1,
            UInt8(subevents.count)
        ]

        data += subevents
    }

    /// Properties of the advertisement.
    public struct PeriodicAdvertisingProperties: OptionSet, Equatable, Hashable, Sendable {

        public let rawValue: UInt16

        public init(rawValue: UInt16) {
            self.rawValue = rawValue
        }

        /// Include TxPower in the advertising PDU.
        public static var includeTxPower: PeriodicAdvertisingProperties { PeriodicAdvertisingProperties(rawValue: 0b100000) }
    }
}

// MARK: - Return Parameter

/// LE Set Periodic Sync Subevent Command
@frozen
public struct HCILESetPeriodicSyncSubeventReturn: HCICommandReturnParameter {

    public static let command = HCILowEnergyCommand.setPeriodicSyncSubevent  // 0x0084

    public static let length: Int = 2

    /// Identifies the PAwR advertising train.
    public let syncHandle: UInt16

    public init?<Data: DataContainer>(data: Data) {
        guard data.count == Self.length
        else { return nil }

        self.syncHandle = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
    }
}
