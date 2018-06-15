//
//  HCILEReadPeerResolvableAddress.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {

    /// LE Read Peer Resolvable Address Command
    ///
    /// The command is used to get the current peer Resolvable Private Address being
    /// used for the corresponding peer Public and Random (static) Identity Address.
    /// The peer’s resolvable address being used may change after the command is called.
    func lowEnergyReadPeerResolvableAddress(peerIdentifyAddressType: LowEnergyPeerIdentifyAddressType, peerIdentifyAddress: UInt64, timeout: HCICommandTimeout = .default) throws -> UInt64 {
        
        let parameters = HCILEReadPeerResolvableAddress(peerIdentifyAddressType: peerIdentifyAddressType, peerIdentifyAddress: peerIdentifyAddress)
        
        let returnParameters = try deviceRequest(parameters, HCILEReadPeerResolvableAddressReturn.self, timeout: timeout)
        
        return returnParameters.peerResolvableAddress
    }
}

// MARK: - Command

/// LE Read Peer Resolvable Address Command
///
/// The command is used to get the current peer Resolvable Private Address
/// being used for the corresponding peer Public and Random (static) Identity Address.
/// The peer’s resolvable address being used may change after the command is called.
///
/// This command can be used at any time.
///
/// When a Controller cannot find a Resolvable Private Address associated
/// with the Peer Identity Address, it shall return the error code Unknown
/// Connection Identifier (0x02).
public struct HCILEReadPeerResolvableAddress: HCICommandParameter { //HCI_LE_Read_ Peer_Resolvable_Address
    
    public static let command = HCILowEnergyCommand.readPeerResolvableAddress //0x002B
    
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

/// LE Read Peer Resolvable Address Command
///
/// The command is used to get the current peer Resolvable Private Address
/// being used for the corresponding peer Public and Random (static) Identity Address.
/// The peer’s resolvable address being used may change after the command is called.
///
/// This command can be used at any time.
///
/// When a Controller cannot find a Resolvable Private Address associated
/// with the Peer Identity Address, it shall return the error code Unknown
/// Connection Identifier (0x02).
public struct HCILEReadPeerResolvableAddressReturn: HCICommandReturnParameter {
    
    public static let command = HCILowEnergyCommand.readPeerResolvableAddress //0x002B
    
    public static let length: Int = 6
    
    /// Resolvable Private Address being used by the peer device
    public let peerResolvableAddress: UInt64 //Peer_Resolvable_Address
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        self.peerResolvableAddress = UInt64(littleEndian: UInt64(bytes: ((data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7]))))
    }
}
