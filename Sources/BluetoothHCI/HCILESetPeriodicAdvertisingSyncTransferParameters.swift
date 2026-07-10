//
//  HCILESetPeriodicAdvertisingSyncTransferParameters.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 7/9/26.
//  Copyright © 2026 PureSwift. All rights reserved.
//

// MARK: - Method

public extension BluetoothHostControllerInterface {

    /// LE Set Periodic Advertising Sync Transfer Parameters Command
    ///
    /// Used by the Host to specify how the Controller will process periodic advertising
    /// synchronization information received from the device identified by the Connection_Handle
    /// parameter (Periodic Advertising Sync Transfer, PAST).
    func lowEnergySetPeriodicAdvertisingSyncTransferParameters(
        connectionHandle: UInt16,
        mode: HCILESetPeriodicAdvertisingSyncTransferParameters.Mode,
        skip: UInt16,
        syncTimeout: HCILEPeriodicAdvertisingCreateSync.SyncTimeout,
        cteType: HCILESetPeriodicAdvertisingSyncTransferParameters.CTEType,
        timeout: HCICommandTimeout = .default
    ) async throws -> UInt16 {

        let parameters = HCILESetPeriodicAdvertisingSyncTransferParameters(
            connectionHandle: connectionHandle,
            mode: mode,
            skip: skip,
            syncTimeout: syncTimeout,
            cteType: cteType)

        let returnParameter = try await deviceRequest(parameters, HCILESetPeriodicAdvertisingSyncTransferParametersReturn.self, timeout: timeout)

        return returnParameter.connectionHandle
    }
}

// MARK: - Command

/// LE Set Periodic Advertising Sync Transfer Parameters Command
///
/// Used by the Host to specify how the Controller will process periodic advertising
/// synchronization information received from the device identified by the Connection_Handle
/// parameter (Periodic Advertising Sync Transfer, PAST).
@frozen
public struct HCILESetPeriodicAdvertisingSyncTransferParameters: HCICommandParameter {

    public static let command = HCILowEnergyCommand.setPeriodicAdvertisingSyncTransferParameters  // 0x005C

    /// Identifies the connection on which synchronization information will be received.
    public var connectionHandle: UInt16  // Connection_Handle

    /// Whether and how the Controller will synchronize automatically upon receipt of the
    /// synchronization information.
    public var mode: Mode  // Mode

    /// The number of periodic advertising packets that can be skipped after a successful receive.
    public var skip: UInt16  // Skip

    /// Synchronization timeout.
    public var syncTimeout: HCILEPeriodicAdvertisingCreateSync.SyncTimeout  // Sync_Timeout

    /// Whether to only synchronize to periodic advertising with certain types of Constant Tone
    /// Extension.
    public var cteType: CTEType  // CTE_Type

    public init(
        connectionHandle: UInt16,
        mode: Mode,
        skip: UInt16,
        syncTimeout: HCILEPeriodicAdvertisingCreateSync.SyncTimeout,
        cteType: CTEType
    ) {

        self.connectionHandle = connectionHandle
        self.mode = mode
        self.skip = skip
        self.syncTimeout = syncTimeout
        self.cteType = cteType
    }

    public func append<Data: DataContainer>(to data: inout Data) {

        let connectionHandleBytes = connectionHandle.littleEndian.bytes
        let skipBytes = skip.littleEndian.bytes
        let syncTimeoutBytes = syncTimeout.rawValue.littleEndian.bytes

        data += [
            connectionHandleBytes.0,
            connectionHandleBytes.1,
            mode.rawValue,
            skipBytes.0,
            skipBytes.1,
            syncTimeoutBytes.0,
            syncTimeoutBytes.1,
            cteType.rawValue
        ]
    }

    /// Whether and how the Controller will synchronize automatically upon receipt of periodic
    /// advertising synchronization information.
    public enum Mode: UInt8 {

        /// No attempt is made to synchronize to the periodic advertising train and no
        /// `HCI_LE_Periodic_Advertising_Sync_Transfer_Received` event is sent to the Host.
        case noSync = 0x00

        /// An `HCI_LE_Periodic_Advertising_Sync_Transfer_Received` event is sent to the Host
        /// with a status indicating the synchronization was successful or unsuccessful.
        /// The periodic advertising reports are disabled by default.
        case sync = 0x01

        /// An `HCI_LE_Periodic_Advertising_Sync_Transfer_Received` event is sent to the Host
        /// with a status indicating the synchronization was successful or unsuccessful.
        /// The periodic advertising reports are enabled by default.
        case syncWithReportsEnabled = 0x02

        /// Reserved for future use.
        case reserved0x03 = 0x03
    }

    /// Whether the Controller should only synchronize to periodic advertising with a certain
    /// type of Constant Tone Extension.
    public struct CTEType: OptionSet, Equatable, Hashable, Sendable {

        public let rawValue: UInt8

        public init(rawValue: UInt8) {
            self.rawValue = rawValue
        }

        /// Do not sync to packets with an AoA Constant Tone Extension.
        public static var noAOA: CTEType { CTEType(rawValue: 0b1) }

        /// Do not sync to packets with an AoD Constant Tone Extension with 1 μs slots.
        public static var noAOD1us: CTEType { CTEType(rawValue: 0b10) }

        /// Do not sync to packets with an AoD Constant Tone Extension with 2 μs slots.
        public static var noAOD2us: CTEType { CTEType(rawValue: 0b100) }

        /// Do not sync to packets without a Constant Tone Extension.
        public static var noExtension: CTEType { CTEType(rawValue: 0b1000) }
    }
}

// MARK: - Return Parameter

/// LE Set Periodic Advertising Sync Transfer Parameters Command
@frozen
public struct HCILESetPeriodicAdvertisingSyncTransferParametersReturn: HCICommandReturnParameter {

    public static let command = HCILowEnergyCommand.setPeriodicAdvertisingSyncTransferParameters  // 0x005C

    public static let length: Int = 2

    public let connectionHandle: UInt16

    public init?<Data: DataContainer>(data: Data) {
        guard data.count == Self.length
        else { return nil }

        self.connectionHandle = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
    }
}
