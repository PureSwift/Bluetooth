//
//  HCILEReadLocalResolvableAddress.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {

    /// LE Read Local Resolvable Address Command
    ///
    /// The command is used to get the current local Resolvable Private Address being
    /// used for the corresponding peer Identity Address. The local’s resolvable address
    /// being used may change after the command is called.
    func lowEnergyReadLocalResolvableAddress(peerIdentifyAddressType: LowEnergyPeerIdentifyAddressType,
                                             peerIdentifyAddress: UInt64,
                                             timeout: HCICommandTimeout = .default) throws -> UInt64 {
        
        let parameters = HCILEReadLocalResolvableAddress(peerIdentifyAddressType: peerIdentifyAddressType, peerIdentifyAddress: peerIdentifyAddress)
        
        let returnParameters = try deviceRequest(parameters, HCILEReadLocalResolvableAddressReturn.self, timeout: timeout)
        
        return returnParameters.localResolvableAddress
    }
}

// MARK: - Command

/// LE Read Local Resolvable Address Command
///
/// The command is used to get the current local Resolvable Private Address
//// being used for the corresponding peer Identity Address.
/// The local’s resolvable address being used may change after the command is called.
///
/// This command can be used at any time.
///
/// When a Controller cannot find a Resolvable Private Address associated
/// with the Peer Identity Address, it shall return the error code
/// Unknown Connection Identifier (0x02).
public struct HCILEReadLocalResolvableAddress: HCICommandParameter { //HCI_LE_Read_Local_ Resolvable_Address
    
    public static let command = HCILowEnergyCommand.readLocalResolvableAddress //0x002C
    
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

// MARK: - Return parameter

/// LE Read Local Resolvable Address Command
///
/// The command is used to get the current local Resolvable Private Address
//// being used for the corresponding peer Identity Address.
/// The local’s resolvable address being used may change after the command is called.
///
/// This command can be used at any time.
///
/// When a Controller cannot find a Resolvable Private Address associated
/// with the Peer Identity Address, it shall return the error code
/// Unknown Connection Identifier (0x02).
public struct HCILEReadLocalResolvableAddressReturn: HCICommandReturnParameter {
    
    public static let command = HCILowEnergyCommand.readLocalResolvableAddress //0x002C
    
    public static let length: Int = 6
    
    /// Resolvable Private Address being used by the local device
    public let localResolvableAddress: UInt64 //Local_Resolvable_Address
    
    public init?(data: Data) {
        guard data.count == type(of: self).length
            else { return nil }
        
        self.localResolvableAddress = UInt64(littleEndian: UInt64(bytes: ((data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7]))))
    }
}
