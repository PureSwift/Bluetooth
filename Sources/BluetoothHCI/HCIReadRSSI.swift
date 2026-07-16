//
//  HCIReadRSSI.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 7/9/26.
//  Copyright © 2026 PureSwift. All rights reserved.
//

// MARK: - Method

#if !hasFeature(Embedded)
public extension BluetoothHostControllerInterface {

    /// Read RSSI Command
    ///
    /// This command reads the Received Signal Strength Indication (RSSI) value from a Controller.
    ///
    /// For a BR/EDR Controller, a Connection_Handle is used as the Handle command parameter and
    /// return parameter. The RSSI parameter returns the difference between the measured Received
    /// Signal Strength Indication (RSSI) and the limits of the Golden Receive Power Range for a
    /// Connection Handle to another BR/EDR Controller.
    ///
    /// For an AMP Controller, a Physical Link Handle is used for the Handle command parameter and
    /// return parameter. The RSSI parameter returns the absolute received signal strength value.
    ///
    /// For an LE transport, a Connection_Handle is used for the Handle command parameter and
    /// return parameter. The meaning of the RSSI metric is an absolute receiver signal strength
    /// value in dBm to +/- 6 dB accuracy.
    func readRSSI(handle: UInt16, timeout: HCICommandTimeout = .default) async throws -> RSSI {

        let parameters = HCIReadRSSI(handle: handle)

        let returnParameters = try await deviceRequest(parameters, HCIReadRSSIReturn.self, timeout: timeout)

        return returnParameters.rssi
    }
}
#endif

// MARK: - Command

/// Read RSSI Command
///
/// This command reads the Received Signal Strength Indication (RSSI) value from a Controller.
@frozen
public struct HCIReadRSSI: HCICommandParameter {

    public static let command = StatusParametersCommand.readRSSI

    /// Handle for the connection, physical link, or advertising set for which the RSSI is to be read.
    public var handle: UInt16

    public init(handle: UInt16) {

        self.handle = handle
    }

    public func append<Data: DataContainer>(to data: inout Data) {

        let handleBytes = handle.littleEndian.bytes

        data += [handleBytes.0, handleBytes.1]
    }
}

// MARK: - Return Parameter

/// Read RSSI Command
@frozen
public struct HCIReadRSSIReturn: HCICommandReturnParameter {

    public static let command = StatusParametersCommand.readRSSI

    public static let length: Int = 3

    public let handle: UInt16

    /// Received Signal Strength Indication.
    public let rssi: RSSI

    public init?<Data: DataContainer>(data: Data) {

        guard data.count == Self.length
        else { return nil }

        guard let rssi = RSSI(rawValue: Int8(bitPattern: data[2]))
        else { return nil }

        self.handle = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
        self.rssi = rssi
    }
}
