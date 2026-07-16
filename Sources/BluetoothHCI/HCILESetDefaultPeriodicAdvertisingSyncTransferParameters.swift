//
//  HCILESetDefaultPeriodicAdvertisingSyncTransferParameters.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 7/9/26.
//  Copyright © 2026 PureSwift. All rights reserved.
//

// MARK: - Method

#if !hasFeature(Embedded)
public extension BluetoothHostControllerInterface {

    /// LE Set Default Periodic Advertising Sync Transfer Parameters Command
    ///
    /// Used by the Host to specify the initial value for the mode, skip, sync timeout, and
    /// Constant Tone Extension type to be used for all subsequent connections over the LE
    /// transport (Periodic Advertising Sync Transfer, PAST).
    func lowEnergySetDefaultPeriodicAdvertisingSyncTransferParameters(
        mode: HCILESetPeriodicAdvertisingSyncTransferParameters.Mode,
        skip: UInt16,
        syncTimeout: HCILEPeriodicAdvertisingCreateSync.SyncTimeout,
        cteType: HCILESetPeriodicAdvertisingSyncTransferParameters.CTEType,
        timeout: HCICommandTimeout = .default
    ) async throws {

        let parameters = HCILESetDefaultPeriodicAdvertisingSyncTransferParameters(
            mode: mode,
            skip: skip,
            syncTimeout: syncTimeout,
            cteType: cteType)

        try await deviceRequest(parameters, timeout: timeout)
    }
}
#endif

// MARK: - Command

/// LE Set Default Periodic Advertising Sync Transfer Parameters Command
///
/// Used by the Host to specify the initial value for the mode, skip, sync timeout, and
/// Constant Tone Extension type to be used for all subsequent connections over the LE transport.
@frozen
public struct HCILESetDefaultPeriodicAdvertisingSyncTransferParameters: HCICommandParameter {

    public typealias Mode = HCILESetPeriodicAdvertisingSyncTransferParameters.Mode

    public typealias CTEType = HCILESetPeriodicAdvertisingSyncTransferParameters.CTEType

    public static let command = HCILowEnergyCommand.setDefaultPeriodicAdvertisingSyncTransferParameters  // 0x005D

    /// Whether and how the Controller will synchronize automatically upon receipt of periodic
    /// advertising synchronization information.
    public var mode: Mode  // Mode

    /// The number of periodic advertising packets that can be skipped after a successful receive.
    public var skip: UInt16  // Skip

    /// Synchronization timeout.
    public var syncTimeout: HCILEPeriodicAdvertisingCreateSync.SyncTimeout  // Sync_Timeout

    /// Whether to only synchronize to periodic advertising with certain types of Constant Tone
    /// Extension.
    public var cteType: CTEType  // CTE_Type

    public init(
        mode: Mode,
        skip: UInt16,
        syncTimeout: HCILEPeriodicAdvertisingCreateSync.SyncTimeout,
        cteType: CTEType
    ) {

        self.mode = mode
        self.skip = skip
        self.syncTimeout = syncTimeout
        self.cteType = cteType
    }

    public func append<Data: DataContainer>(to data: inout Data) {

        let skipBytes = skip.littleEndian.bytes
        let syncTimeoutBytes = syncTimeout.rawValue.littleEndian.bytes

        data += [
            mode.rawValue,
            skipBytes.0,
            skipBytes.1,
            syncTimeoutBytes.0,
            syncTimeoutBytes.1,
            cteType.rawValue
        ]
    }
}
