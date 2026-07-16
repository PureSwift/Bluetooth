//
//  HCILESetExtendedAdvertisingParametersV2.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 7/9/26.
//  Copyright © 2026 PureSwift. All rights reserved.
//

// MARK: - Method

#if !hasFeature(Embedded)
public extension BluetoothHostControllerInterface {

    /// LE Set Extended Advertising Parameters Command (v2)
    ///
    /// The command is used by the Host to set the advertising parameters,
    /// including the Advertising Coding Selection PHY options (Bluetooth 5.4).
    func setExtendedAdvertisingParametersV2(
        _ parameters: HCILESetExtendedAdvertisingParametersV2,
        timeout: HCICommandTimeout = .default
    ) async throws -> LowEnergyTxPower {

        let returnParameter = try await deviceRequest(parameters, HCILESetExtendedAdvertisingParametersV2Return.self, timeout: timeout)

        return returnParameter.selectedTxPower
    }
}
#endif

// MARK: - Command

/// LE Set Extended Advertising Parameters Command (v2)
///
/// The command is used by the Host to set the advertising parameters.
///
/// Version 2 (Bluetooth 5.4) adds the `Primary_Advertising_PHY_Options` and
/// `Secondary_Advertising_PHY_Options` parameters, which allow the Host to express
/// a preference or requirement for the coding scheme (S=2 or S=8) when advertising
/// on the LE Coded PHY (Advertising Coding Selection).
@frozen
public struct HCILESetExtendedAdvertisingParametersV2: HCICommandParameter {

    public static let command = HCILowEnergyCommand.setExtendedAdvertisingParametersV2  // 0x007F

    /// The advertising parameters shared with version 1 of the command.
    public var parameters: HCILESetExtendedAdvertisingParameters

    /// Primary_Advertising_PHY_Options
    public var primaryAdvertisingPhyOptions: AdvertisingPhyOptions

    /// Secondary_Advertising_PHY_Options
    public var secondaryAdvertisingPhyOptions: AdvertisingPhyOptions

    public init(
        parameters: HCILESetExtendedAdvertisingParameters,
        primaryAdvertisingPhyOptions: AdvertisingPhyOptions = .noPreference,
        secondaryAdvertisingPhyOptions: AdvertisingPhyOptions = .noPreference
    ) {

        self.parameters = parameters
        self.primaryAdvertisingPhyOptions = primaryAdvertisingPhyOptions
        self.secondaryAdvertisingPhyOptions = secondaryAdvertisingPhyOptions
    }

    public func append<Data: DataContainer>(to data: inout Data) {

        parameters.append(to: &data)
        data += primaryAdvertisingPhyOptions.rawValue
        data += secondaryAdvertisingPhyOptions.rawValue
    }

    /// Advertising PHY options for the LE Coded PHY coding scheme (Advertising Coding Selection).
    public enum AdvertisingPhyOptions: UInt8 {

        /// The Host has no preferred or required coding when transmitting on the LE Coded PHY.
        case noPreference = 0x00

        /// The Host prefers that S=2 coding be used when transmitting on the LE Coded PHY.
        case preferS2 = 0x01

        /// The Host prefers that S=8 coding be used when transmitting on the LE Coded PHY.
        case preferS8 = 0x02

        /// The Host requires that S=2 coding be used when transmitting on the LE Coded PHY.
        case requireS2 = 0x03

        /// The Host requires that S=8 coding be used when transmitting on the LE Coded PHY.
        case requireS8 = 0x04
    }
}

// MARK: - Return Parameter

/// LE Set Extended Advertising Parameters Command (v2)
@frozen
public struct HCILESetExtendedAdvertisingParametersV2Return: HCICommandReturnParameter {

    public static let command = HCILowEnergyCommand.setExtendedAdvertisingParametersV2  // 0x007F

    public static let length: Int = 1

    public let selectedTxPower: LowEnergyTxPower

    public init?<Data: DataContainer>(data: Data) {
        guard data.count == Self.length
        else { return nil }

        guard let selectedTxPower = LowEnergyTxPower(rawValue: Int8(bitPattern: data[0]))
        else { return nil }

        self.selectedTxPower = selectedTxPower
    }
}
