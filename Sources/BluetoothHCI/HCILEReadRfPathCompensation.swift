//
//  HCILEReadRfPathCompensation.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/15/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

// MARK: - Method

#if !hasFeature(Embedded)
public extension BluetoothHostControllerInterface {

    /// LE Read RF Path Compensation Command
    ///
    /// The command is used to read the RF Path Compensation Values parameter used in the Tx Power Level and RSSI calculation.
    func lowEnergyReadRfPathCompensation(timeout: HCICommandTimeout = .default) async throws -> HCILEReadRfPathCompensation {

        return try await deviceRequest(HCILEReadRfPathCompensation.self, timeout: timeout)
    }
}
#endif

// MARK: - Return parameter

/// LE Read RF Path Compensation Command
///
/// The command is used to read the RF Path Compensation Values parameter used in the Tx Power Level and RSSI calculation.
@frozen
public struct HCILEReadRfPathCompensation: HCICommandReturnParameter {

    public static let command = HCILowEnergyCommand.readRFPathCompensation  //0x004C

    public static let length: Int = 4

    public let rfTxPathCompensationValue: LowEnergyRfTxPathCompensationValue
    public let rfRxPathCompensationValue: LowEnergyRfTxPathCompensationValue

    public init?<Data: DataContainer>(data: Data) {

        guard data.count == Self.length
        else { return nil }

        guard let rfTxPathCompensationValue = LowEnergyRfTxPathCompensationValue(rawValue: Int16(bitPattern: UInt16(bytes: (data[0], data[1]))))
        else { return nil }

        guard let rfRxPathCompensationValue = LowEnergyRfTxPathCompensationValue(rawValue: Int16(bitPattern: UInt16(bytes: (data[2], data[3]))))
        else { return nil }

        self.rfTxPathCompensationValue = rfTxPathCompensationValue
        self.rfRxPathCompensationValue = rfRxPathCompensationValue
    }
}
