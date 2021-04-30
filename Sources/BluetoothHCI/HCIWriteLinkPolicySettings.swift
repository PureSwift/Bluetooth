//
//  HCIWriteLinkPolicySettings.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 8/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// Write Link Policy Settings Command
    ///
    /// This command writes the Link Policy setting for the specified Connection_Handle. The Connection_Handle shall be a Connection_Handle for an ACL connection.
    /// The default value is the value set by the Write Default Link Policy Settings Command.
    func writeLinkPolicySettings(connectionHandle: UInt16,
                                 settings: BitMaskOptionSet<HCIWriteLinkPolicySettings.LinkPolicySettings>,
                                 timeout: HCICommandTimeout = .default) throws -> HCIWriteLinkPolicySettingsReturn {
        
        let command = HCIWriteLinkPolicySettings(connectionHandle: connectionHandle,
                                                          settings: settings)
        
        return try deviceRequest(command, HCIWriteLinkPolicySettingsReturn.self, timeout: timeout)
    }
}

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
    
    public var settings: BitMaskOptionSet<LinkPolicySettings>
    
    public init(connectionHandle: UInt16, settings: BitMaskOptionSet<LinkPolicySettings>) {
        
        self.connectionHandle = connectionHandle
        self.settings = settings
    }
    
    public var data: Data {
        
        let handleBytes = connectionHandle.littleEndian.bytes
        let settingsBytes = settings.rawValue.littleEndian.bytes
        
        return Data([handleBytes.0,
                     handleBytes.1,
                     settingsBytes.0,
                     settingsBytes.1])
    }
}

extension HCIWriteLinkPolicySettings {
    
    /// Link Policy Settings
    public enum LinkPolicySettings: UInt16, BitMaskOption {
        
        /// Enable Role Switch.
        case enableRoleSwitch = 0x0001
        
        /// Enable Hold Mode.
        case enableHoldMode = 0x0002
        
        /// Enable Sniff Mode.
        case enableSniffMode = 0x0004
        
        /// Enable Park State.
        case enableParkState = 0x0008
        
        public static let allCases: [LinkPolicySettings] = [
            .enableRoleSwitch,
            .enableHoldMode,
            .enableSniffMode,
            .enableParkState
        ]
    }
}

// MARK: - Return Parameter

public struct HCIWriteLinkPolicySettingsReturn: HCICommandReturnParameter {
    
    public static let command = LinkPolicyCommand.writeLinkPolicySettings
    
    public static let length: Int = 2
    
    public var connectionHandle: UInt16
    
    public init?(data: Data) {
        
        guard data.count == HCIWriteLinkPolicySettingsReturn.length
            else { return nil }
        
        self.connectionHandle = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
    }
}
