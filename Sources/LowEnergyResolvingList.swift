//
//  LowEnergyResolvingList.swift
//  Bluetooth-macOS
//
//  Created by Marco Estrella on 4/5/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

public extension BluetoothHostControllerInterface {
    
    /// LE Add Device To Resolving List Command
    ///
    /// The command is used to add one device to the list of address translations
    /// used to resolve Resolvable Private Addresses in the Controller.
    func lowEnergyAddDeviceToResolvingList(peerIdentifyAddressType: PeerIdentifyAddressType, peerIdentifyAddress: UInt64, peerIrk: UInt128, localIrk: UInt128, timeout: HCICommandTimeout = .default) throws {
        
        let parameters = LowEnergyCommand.AddDeviceToResolvingListParameter(peerIdentifyAddressType: peerIdentifyAddressType, peerIdentifyAddress: peerIdentifyAddress, peerIrk: peerIrk, localIrk: localIrk)
        
        try deviceRequest(parameters, timeout: timeout)
    }
    
    /// LE Remove Device From Resolving List Command
    ///
    /// This command is used to remove one device from the list of address translations used to resolve
    /// Resolvable Private Addresses in the Controller.
    func lowEnergyRemoveDeviceFromResolvingList(peerIdentifyAddressType: PeerIdentifyAddressType, peerIdentifyAddress: UInt64, packetpayload: PacketPayload, timeout: HCICommandTimeout = .default) throws {
        
        let parameters = LowEnergyCommand.RemoveDeviceFromResolvingListParameter(peerIdentifyAddressType: peerIdentifyAddressType, peerIdentifyAddress: peerIdentifyAddress)
        
        try deviceRequest(parameters, timeout: timeout)
    }
    
    /// LE Clear Resolving List Command
    ///
    /// The command is used to remove all devices from the list of address translations
    /// used to resolve Resolvable Private Addresses in the Controller.
    func lowEnergyClearResolvingList(timeout: HCICommandTimeout = .default) throws {
        
        try deviceRequest(LowEnergyCommand.clearResolvedList, timeout: timeout)
    }
    
    /// LE Read Resolving List Size Command
    ///
    /// This command is used to read the total number of address translation
    /// entries in the resolving list that can be stored in the Controller.
    func lowEnergyReadResolvingListSize(timeout: HCICommandTimeout = .default) throws -> UInt8 {
        
        let value = try deviceRequest(LowEnergyCommand.ReadResolvingListSizeReturnParameter.self,
                                      timeout: timeout)
        
        return value.resolvingListSize
    }
    
    /// LE Read Peer Resolvable Address Command
    ///
    /// The command is used to get the current peer Resolvable Private Address being
    /// used for the corresponding peer Public and Random (static) Identity Address.
    /// The peer’s resolvable address being used may change after the command is called.
    func lowEnergyReadPeerResolvableAddress(peerIdentifyAddressType: PeerIdentifyAddressType, peerIdentifyAddress: UInt64, timeout: HCICommandTimeout = .default) throws -> UInt64 {
        
        let parameters = LowEnergyCommand.ReadPeerResolvableAddressParameter(peerIdentifyAddressType: peerIdentifyAddressType, peerIdentifyAddress: peerIdentifyAddress)
        
        let returnParameters = try deviceRequest(parameters, LowEnergyCommand.ReadPeerResolvableAddressReturnParameter.self, timeout: timeout)
        
        return returnParameters.peerResolvableAddress
    }
    
    /// LE Read Local Resolvable Address Command
    ///
    /// The command is used to get the current local Resolvable Private Address being
    /// used for the corresponding peer Identity Address. The local’s resolvable address
    /// being used may change after the command is called.
    func lowEnergyReadLocalResolvableAddress(peerIdentifyAddressType: PeerIdentifyAddressType, peerIdentifyAddress: UInt64, timeout: HCICommandTimeout = .default) throws -> UInt64 {
        
        let parameters = LowEnergyCommand.ReadLocalResolvableAddressParameter(peerIdentifyAddressType: peerIdentifyAddressType, peerIdentifyAddress: peerIdentifyAddress)
        
        let returnParameters = try deviceRequest(parameters, LowEnergyCommand.ReadLocalResolvableAddressReturnParameter.self, timeout: timeout)
        
        return returnParameters.localResolvableAddress
    }

}
