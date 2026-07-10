//
//  HCIReadLocalSupportedCommands.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 7/9/26.
//  Copyright © 2026 PureSwift. All rights reserved.
//

// MARK: - Method

public extension BluetoothHostControllerInterface {

    /// Read Local Supported Commands Command
    ///
    /// This command reads the list of HCI commands supported for the local Controller.
    func readLocalSupportedCommands(timeout: HCICommandTimeout = .default) async throws -> HCISupportedCommands {

        let returnParameter = try await deviceRequest(HCIReadLocalSupportedCommandsReturn.self, timeout: timeout)

        return returnParameter.supportedCommands
    }

    /// Read Local Supported Commands Command (v2)
    ///
    /// This command reads the list of HCI commands supported for the local Controller.
    ///
    /// Version 2 (Bluetooth 6.3, Running Out of Bits) returns all octets of the
    /// Supported_Commands configuration parameter; the v1 command returns octets 0 to 63.
    func readLocalSupportedCommandsV2(timeout: HCICommandTimeout = .default) async throws -> HCISupportedCommands {

        let returnParameter = try await deviceRequest(HCIReadLocalSupportedCommandsV2Return.self, timeout: timeout)

        return returnParameter.supportedCommands
    }
}

// MARK: - Supported Commands

/// Bit mask for each HCI command.
///
/// If a bit is 1, the Controller supports the corresponding command and the features
/// required for the command. Unsupported or undefined commands are set to 0.
///
/// - SeeAlso: [Bluetooth Core Specification](https://www.bluetooth.com/specifications/specs/) Vol 4 Part E 6.27
@frozen
public struct HCISupportedCommands: Equatable, Hashable, Sendable {

    /// Raw octets of the Supported_Commands configuration parameter.
    public let octets: [UInt8]

    public init(octets: [UInt8]) {

        self.octets = octets
    }

    /// Whether the command bit at the specified octet and bit position is set.
    ///
    /// Octets beyond the length returned by the Controller read as unsupported.
    public func isSupported(octet: Int, bit: Int) -> Bool {

        precondition(bit >= 0 && bit <= 7, "Invalid bit index \(bit)")

        guard octet >= 0, octet < octets.count
        else { return false }

        return octets[octet] & (1 << UInt8(bit)) != 0
    }
}

// MARK: - Return Parameter (v1)

/// Read Local Supported Commands Command
///
/// This command reads the list of HCI commands supported for the local Controller.
@frozen
public struct HCIReadLocalSupportedCommandsReturn: HCICommandReturnParameter {

    public static let command = InformationalCommand.readLocalSupportedCommands  // 0x0002

    /// Octets 0 to 63 of the Supported_Commands configuration parameter.
    public static let length = 64

    public let supportedCommands: HCISupportedCommands

    public init?<Data: DataContainer>(data: Data) {

        guard data.count == Self.length
        else { return nil }

        self.supportedCommands = HCISupportedCommands(octets: [UInt8](data))
    }
}

// MARK: - Return Parameter (v2)

/// Read Local Supported Commands Command (v2)
///
/// This command reads the list of HCI commands supported for the local Controller.
///
/// Version 2 (Bluetooth 6.3, Running Out of Bits) returns all octets of the
/// Supported_Commands configuration parameter.
@frozen
public struct HCIReadLocalSupportedCommandsV2Return: HCICommandReturnParameter {

    public static let command = InformationalCommand.readLocalSupportedCommandsV2  // 0x0010

    /// All octets of the Supported_Commands configuration parameter.
    public static let length = 251

    public let supportedCommands: HCISupportedCommands

    public init?<Data: DataContainer>(data: Data) {

        guard data.count == Self.length
        else { return nil }

        self.supportedCommands = HCISupportedCommands(octets: [UInt8](data))
    }
}
