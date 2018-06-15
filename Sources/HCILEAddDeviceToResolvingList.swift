//
//  HCILEAddDeviceToResolvingList.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// LE Add Device To Resolving List Command
    ///
    /// The command is used to add one device to the list of address translations
    /// used to resolve Resolvable Private Addresses in the Controller.
    func lowEnergyAddDeviceToResolvingList(peerIdentifyAddressType: LowEnergyPeerIdentifyAddressType, peerIdentifyAddress: UInt64, peerIrk: UInt128, localIrk: UInt128, timeout: HCICommandTimeout = .default) throws {
        
        let parameters = HCILEAddDeviceToResolvingList(peerIdentifyAddressType: peerIdentifyAddressType, peerIdentifyAddress: peerIdentifyAddress, peerIrk: peerIrk, localIrk: localIrk)
        
        try deviceRequest(parameters, timeout: timeout)
    }
}

// MARK: - Command

/// LE Add Device To Resolving List Command
///
/// The LE_Add_Device_To_Resolving_List command is used to
/// add one device to the list of address translations used to
/// resolve Resolvable Private Addresses in the Controller.
///
/// This command cannot be used when address translation is enabled
/// in the Controller and:
/// * Advertising is enabled
/// * Scanning is enabled
/// * Create connection command is outstanding
///
/// This command can be used at any time when address translation
/// is disabled in the Controller.
///
/// The added device shall be set to Network Privacy mode.
///
/// When a Controller cannot add a device to the list because
/// there is no space available, it shall return the error code
/// Memory Capacity Exceeded (0x07).
public struct HCILEAddDeviceToResolvingList: HCICommandParameter {
    
    public static let command = HCILowEnergyCommand.addDeviceToResolvedList //0x0027
    
    public let peerIdentifyAddressType: LowEnergyPeerIdentifyAddressType //Peer_Identity_Address_Type
    
    public let peerIdentifyAddress: UInt64 //Peer_Identity_Address
    
    public let peerIrk: UInt128 //Peer_IRK
    
    public let localIrk: UInt128 //Local_IRK
    
    public init(peerIdentifyAddressType: LowEnergyPeerIdentifyAddressType, peerIdentifyAddress: UInt64, peerIrk: UInt128, localIrk: UInt128) {
        
        self.peerIdentifyAddressType = peerIdentifyAddressType
        self.peerIdentifyAddress = peerIdentifyAddress
        self.peerIrk = peerIrk
        self.localIrk = localIrk
    }
    
    public var data: Data {
        
        let peerIdentifyAddressBytes = peerIdentifyAddress.littleEndian.bytes
        let peerIrkBytes = peerIrk.littleEndian.bytes
        let localIrkBytes = localIrk.littleEndian.bytes
        
        return Data([
            peerIdentifyAddressType.rawValue,
            peerIdentifyAddressBytes.0,
            peerIdentifyAddressBytes.1,
            peerIdentifyAddressBytes.2,
            peerIdentifyAddressBytes.3,
            peerIdentifyAddressBytes.4,
            peerIdentifyAddressBytes.5,
            peerIdentifyAddressBytes.6,
            peerIdentifyAddressBytes.7,
            peerIrkBytes.0,
            peerIrkBytes.1,
            peerIrkBytes.2,
            peerIrkBytes.3,
            peerIrkBytes.4,
            peerIrkBytes.5,
            peerIrkBytes.6,
            peerIrkBytes.7,
            peerIrkBytes.8,
            peerIrkBytes.9,
            peerIrkBytes.10,
            peerIrkBytes.11,
            peerIrkBytes.12,
            peerIrkBytes.13,
            peerIrkBytes.14,
            peerIrkBytes.15,
            localIrkBytes.0,
            localIrkBytes.1,
            localIrkBytes.2,
            localIrkBytes.3,
            localIrkBytes.4,
            localIrkBytes.5,
            localIrkBytes.6,
            localIrkBytes.7,
            localIrkBytes.8,
            localIrkBytes.9,
            localIrkBytes.10,
            localIrkBytes.11,
            localIrkBytes.12,
            localIrkBytes.13,
            localIrkBytes.14,
            localIrkBytes.15
            ])
    }
}
