//
//  HCIReadTransmitPowerLevel.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 7/9/26.
//  Copyright © 2026 PureSwift. All rights reserved.
//

// MARK: - Method

public extension BluetoothHostControllerInterface {

    /// Read Transmit Power Level Command
    ///
    /// This command reads the values for the Transmit_Power_Level parameter for the specified
    /// Connection_Handle. The Transmit_Power_Level parameter is the transmit power level for
    /// the specified Connection_Handle. The current and maximum transmit power levels for the
    /// Connection_Handle are returned.
    func readTransmitPowerLevel(
        handle: UInt16,
        type: HCIReadTransmitPowerLevel.LevelType,
        timeout: HCICommandTimeout = .default
    ) async throws -> Int8 {

        let parameters = HCIReadTransmitPowerLevel(handle: handle, type: type)

        let returnParameters = try await deviceRequest(parameters, HCIReadTransmitPowerLevelReturn.self, timeout: timeout)

        return returnParameters.transmitPowerLevel
    }
}

// MARK: - Command

/// Read Transmit Power Level Command
///
/// This command reads the values for the Transmit_Power_Level parameter for the specified
/// Connection_Handle.
@frozen
public struct HCIReadTransmitPowerLevel: HCICommandParameter {

    public static let command = HostControllerBasebandCommand.readTransmitPowerLevel  // 0x0C2D

    /// Connection_Handle for which the transmit power level is to be read.
    public var handle: UInt16

    /// Whether the current or maximum transmit power level is to be read.
    public var type: LevelType

    public init(handle: UInt16, type: LevelType) {

        self.handle = handle
        self.type = type
    }

    public func append<Data: DataContainer>(to data: inout Data) {

        let handleBytes = handle.littleEndian.bytes

        data += [handleBytes.0, handleBytes.1, type.rawValue]
    }

    /// Whether the current or maximum transmit power level is to be read.
    public enum LevelType: UInt8 {

        /// Read Current Transmit Power Level
        case current = 0x00

        /// Read Maximum Transmit Power Level
        case maximum = 0x01
    }
}

// MARK: - Return Parameter

/// Read Transmit Power Level Command
@frozen
public struct HCIReadTransmitPowerLevelReturn: HCICommandReturnParameter {

    public static let command = HostControllerBasebandCommand.readTransmitPowerLevel  // 0x0C2D

    public static let length: Int = 3

    public let handle: UInt16

    /// Transmit_Power_Level
    ///
    /// Range: -30 ≤ N ≤ 20
    /// Units: dBm
    public let transmitPowerLevel: Int8

    public init?<Data: DataContainer>(data: Data) {

        guard data.count == Self.length
        else { return nil }

        self.handle = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
        self.transmitPowerLevel = Int8(bitPattern: data[2])
    }
}
