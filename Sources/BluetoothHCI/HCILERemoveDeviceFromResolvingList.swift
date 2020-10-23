//
//  HCILERemoveDeviceFromResolvingList.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {

    /// LE Remove Device From Resolving List Command
    ///
    /// This command is used to remove one device from the list of address translations used to resolve
    /// Resolvable Private Addresses in the Controller.
    func lowEnergyRemoveDeviceFromResolvingList(peerIdentifyAddressType: LowEnergyPeerIdentifyAddressType,
                                                peerIdentifyAddress: UInt64,
                                                timeout: HCICommandTimeout = .default) throws {
        
        let parameters = HCILERemoveDeviceFromResolvingList(peerIdentifyAddressType: peerIdentifyAddressType, peerIdentifyAddress: peerIdentifyAddress)
        
        try deviceRequest(parameters, timeout: timeout)
    }
}

// MARK: - Command

/// LE Remove Device From Resolving List Command
///
/// he LE_Remove_Device_From_Resolving_List command is used
/// to remove one device from the list of address translations used to
/// resolve Resolvable Private Addresses in the Controller.
///
/// This command cannot be used when address translation is
/// enabled in the Controller and:
///
/// * Advertising is enabled
/// * Scanning is enabled
/// * Create connection command is outstanding
///
/// This command can be used at any time when address translation
/// is disabled in the Controller.
///
/// When a Controller cannot remove a device from the resolving
/// list because it is not found, it shall return the error code
/// Unknown Connection Identifier (0x02).
public struct HCILERemoveDeviceFromResolvingList: HCICommandParameter {
    
    public static let command = HCILowEnergyCommand.removeDeviceFromResolvedList //0x0028
    
    public let peerIdentifyAddressType: LowEnergyPeerIdentifyAddressType //Peer_Identity_Address_Type
    
    public let peerIdentifyAddress: UInt64 //Peer_Identity_Address
    
    public init(peerIdentifyAddressType: LowEnergyPeerIdentifyAddressType,
                peerIdentifyAddress: UInt64) {
        
        self.peerIdentifyAddressType = peerIdentifyAddressType
        self.peerIdentifyAddress = peerIdentifyAddress
    }
    
    public var data: Data {
        
        let peerIdentifyAddressBytes = peerIdentifyAddress.littleEndian.bytes
        
        return Data([
            peerIdentifyAddressType.rawValue,
            peerIdentifyAddressBytes.0,
            peerIdentifyAddressBytes.1,
            peerIdentifyAddressBytes.2,
            peerIdentifyAddressBytes.3,
            peerIdentifyAddressBytes.4,
            peerIdentifyAddressBytes.5,
            peerIdentifyAddressBytes.6,
            peerIdentifyAddressBytes.7
            ])
    }
}
