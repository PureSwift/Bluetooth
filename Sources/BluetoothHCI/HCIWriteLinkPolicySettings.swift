//
//  HCIWriteLinkPolicySettings.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 8/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

// MARK: - Method

#if !hasFeature(Embedded)
public extension BluetoothHostControllerInterface {

    /// Write Link Policy Settings Command
    ///
    /// This command writes the Link Policy setting for the specified Connection_Handle. The Connection_Handle shall be a Connection_Handle for an ACL connection.
    /// The default value is the value set by the Write Default Link Policy Settings Command.
    func writeLinkPolicySettings(
        connectionHandle: UInt16,
        settings: HCIWriteLinkPolicySettings.LinkPolicySettings,
        timeout: HCICommandTimeout = .default
    ) async throws -> HCIWriteLinkPolicySettingsReturn {

        let command = HCIWriteLinkPolicySettings(
            connectionHandle: connectionHandle,
            settings: settings)

        return try await deviceRequest(command, HCIWriteLinkPolicySettingsReturn.self, timeout: timeout)
    }
}
#endif

// MARK: - Command

/// Write Link Policy Settings Command
///
/// This command writes the Link Policy setting for the specified Connection_Handle. The Connection_Handle shall be a Connection_Handle for an ACL connection.
/// The default value is the value set by the Write Default Link Policy Settings Command.
@frozen
public struct HCIWriteLinkPolicySettings: HCICommandParameter {

    public static let command = LinkPolicyCommand.writeLinkPolicySettings

    public static let length = 4

    public var connectionHandle: UInt16

    public var settings: LinkPolicySettings

    public init(connectionHandle: UInt16, settings: LinkPolicySettings) {

        self.connectionHandle = connectionHandle
        self.settings = settings
    }

    public func append<Data: DataContainer>(to data: inout Data) {

        let handleBytes = connectionHandle.littleEndian.bytes
        let settingsBytes = settings.rawValue.littleEndian.bytes

        data += [
            handleBytes.0,
            handleBytes.1,
            settingsBytes.0,
            settingsBytes.1
        ]
    }
}

extension HCIWriteLinkPolicySettings {

    /// Link Policy Settings
    public struct LinkPolicySettings: OptionSet, Hashable, Sendable, CaseIterable {

        public let rawValue: UInt16

        public init(rawValue: UInt16) {
            self.rawValue = rawValue
        }

        /// Enable Role Switch.
        public static let enableRoleSwitch = LinkPolicySettings(rawValue: 0x0001)

        /// Enable Hold Mode.
        public static let enableHoldMode = LinkPolicySettings(rawValue: 0x0002)

        /// Enable Sniff Mode.
        public static let enableSniffMode = LinkPolicySettings(rawValue: 0x0004)

        /// Enable Park State.
        public static let enableParkState = LinkPolicySettings(rawValue: 0x0008)

        public static var allCases: [LinkPolicySettings] {
            [
                .enableRoleSwitch,
                .enableHoldMode,
                .enableSniffMode,
                .enableParkState
            ]
        }
    }
}

// MARK: - Return Parameter

public struct HCIWriteLinkPolicySettingsReturn: HCICommandReturnParameter {

    public static let command = LinkPolicyCommand.writeLinkPolicySettings

    public static let length: Int = 2

    public var connectionHandle: UInt16

    public init?<Data: DataContainer>(data: Data) {

        guard data.count == HCIWriteLinkPolicySettingsReturn.length
        else { return nil }

        self.connectionHandle = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
    }
}
