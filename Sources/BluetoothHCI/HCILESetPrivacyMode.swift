//
//  HCILESetPrivacyMode.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// LE Set Privacy Mode Command
    ///
    /// The command is used to allow the Host to specify the privacy mode to be used for a given entry on the resolving list.
    func lowEnergySetPrivacyMode(peerIdentityAddressType: LowEnergyPeerIdentifyAddressType,
                                 peerIdentityAddress: BluetoothAddress,
                                 privacyMode: HCILESetPrivacyMode.PrivacyMode = HCILESetPrivacyMode.PrivacyMode.networkPrivacy,
                                 timeout: HCICommandTimeout = .default) async throws {
        
        let parameters = HCILESetPrivacyMode(peerIdentityAddressType: peerIdentityAddressType,
                                             peerIdentityAddress: peerIdentityAddress,
                                             privacyMode: privacyMode)
        
        try await deviceRequest(parameters, timeout: timeout)
    }
}

// MARK: - Command

/// LE Set Privacy Mode Command
///
/// The command is used to allow the Host to specify the privacy mode to be used for a given entry on the resolving list.
@frozen
public struct HCILESetPrivacyMode: HCICommandParameter {
    
    public static let command = HCILowEnergyCommand.setPrivacyMode // 0x004E
    
    public let peerIdentityAddressType: LowEnergyPeerIdentifyAddressType
    public let peerIdentityAddress: BluetoothAddress
    public let privacyMode: PrivacyMode
    
    public init(peerIdentityAddressType: LowEnergyPeerIdentifyAddressType,
                peerIdentityAddress: BluetoothAddress,
                privacyMode: PrivacyMode = PrivacyMode.networkPrivacy) {
        
        self.peerIdentityAddressType = peerIdentityAddressType
        self.peerIdentityAddress = peerIdentityAddress
        self.privacyMode = privacyMode
    }
    
    public var data: Data {
        
        let addressBytes = peerIdentityAddress.littleEndian.bytes
        
        return Data([
            peerIdentityAddressType.rawValue,
            addressBytes.0,
            addressBytes.1,
            addressBytes.2,
            addressBytes.3,
            addressBytes.4,
            addressBytes.5,
            privacyMode.rawValue
            ])
    }
    
    public enum PrivacyMode: UInt8 {
        
        /// Use Network Privacy Mode for this peer device (default)
        case networkPrivacy     = 0x00
        
        /// Use Device Privacy Mode for this peer device
        case devicePrivacy      = 0x01
    }
}
