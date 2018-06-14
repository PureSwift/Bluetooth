//
//  LowEnergyResolvingList.swift
//  Bluetooth
//
//  Created by Marco Estrella on 4/5/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

public extension BluetoothHostControllerInterface {
    
    /// LE Add Device To Resolving List Command
    ///
    /// The command is used to add one device to the list of address translations
    /// used to resolve Resolvable Private Addresses in the Controller.
    func lowEnergyAddDeviceToResolvingList(peerIdentifyAddressType: LowEnergyPeerIdentifyAddressType, peerIdentifyAddress: UInt64, peerIrk: UInt128, localIrk: UInt128, timeout: HCICommandTimeout = .default) throws {
        
        let parameters = HCILowEnergyCommand.HCILEAddDeviceToResolvingList(peerIdentifyAddressType: peerIdentifyAddressType, peerIdentifyAddress: peerIdentifyAddress, peerIrk: peerIrk, localIrk: localIrk)
        
        try deviceRequest(parameters, timeout: timeout)
    }
    
    /// LE Remove Device From Resolving List Command
    ///
    /// This command is used to remove one device from the list of address translations used to resolve
    /// Resolvable Private Addresses in the Controller.
    func lowEnergyRemoveDeviceFromResolvingList(peerIdentifyAddressType: LowEnergyPeerIdentifyAddressType,
                                                peerIdentifyAddress: UInt64,
                                                timeout: HCICommandTimeout = .default) throws {
        
        let parameters = HCILowEnergyCommand.HCILERemoveDeviceFromResolvingList(peerIdentifyAddressType: peerIdentifyAddressType, peerIdentifyAddress: peerIdentifyAddress)
        
        try deviceRequest(parameters, timeout: timeout)
    }
    
    /// LE Clear Resolving List Command
    ///
    /// The command is used to remove all devices from the list of address translations
    /// used to resolve Resolvable Private Addresses in the Controller.
    func lowEnergyClearResolvingList(timeout: HCICommandTimeout = .default) throws {
        
        try deviceRequest(HCILowEnergyCommand.clearResolvedList, timeout: timeout)
    }
    
    /// LE Read Resolving List Size Command
    ///
    /// This command is used to read the total number of address translation
    /// entries in the resolving list that can be stored in the Controller.
    func lowEnergyReadResolvingListSize(timeout: HCICommandTimeout = .default) throws -> UInt8 {
        
        let value = try deviceRequest(HCILowEnergyCommand.ReadResolvingListSizeReturnParameter.self,
                                      timeout: timeout)
        
        return value.resolvingListSize
    }
    
    /// LE Read Peer Resolvable Address Command
    ///
    /// The command is used to get the current peer Resolvable Private Address being
    /// used for the corresponding peer Public and Random (static) Identity Address.
    /// The peer’s resolvable address being used may change after the command is called.
    func lowEnergyReadPeerResolvableAddress(peerIdentifyAddressType: LowEnergyPeerIdentifyAddressType, peerIdentifyAddress: UInt64, timeout: HCICommandTimeout = .default) throws -> UInt64 {
        
        let parameters = HCILowEnergyCommand.HCILEReadPeerResolvableAddress(peerIdentifyAddressType: peerIdentifyAddressType, peerIdentifyAddress: peerIdentifyAddress)

        let returnParameters = try deviceRequest(parameters, HCILowEnergyCommand.ReadPeerResolvableAddressReturnParameter.self, timeout: timeout)
        
        return returnParameters.peerResolvableAddress
    }
    
    /// LE Read Local Resolvable Address Command
    ///
    /// The command is used to get the current local Resolvable Private Address being
    /// used for the corresponding peer Identity Address. The local’s resolvable address
    /// being used may change after the command is called.
    func lowEnergyReadLocalResolvableAddress(peerIdentifyAddressType: LowEnergyPeerIdentifyAddressType, peerIdentifyAddress: UInt64, timeout: HCICommandTimeout = .default) throws -> UInt64 {
        
        let parameters = HCILowEnergyCommand.HCILEReadLocalResolvableAddress(peerIdentifyAddressType: peerIdentifyAddressType, peerIdentifyAddress: peerIdentifyAddress)
        
        let returnParameters = try deviceRequest(parameters, HCILowEnergyCommand.ReadLocalResolvableAddressReturnParameter.self, timeout: timeout)
        
        return returnParameters.localResolvableAddress
    }
    
    /// LE Set Address Resolution Enable Command
    ///
    /// The command is used to enable resolution of Resolvable Private Addresses in the Controller.
    func lowEnergySetAddressResolutionEnable(addressResolutionEnable: HCILowEnergyCommand.HCILESetAddressResolutionEnable.AddressResolutionEnable, timeout: HCICommandTimeout = .default) throws {
        
        let parameters = HCILowEnergyCommand.HCILESetAddressResolutionEnable(addressResolutionEnable: addressResolutionEnable)
        
        try deviceRequest(parameters, timeout: timeout)
    }
    
    /// LE Set Resolvable Private Address Timeout Command
    ///
    /// The command set the length of time the Controller uses a Resolvable Private Address before a new resolvable private address is generated and starts being used.
    func lowEnergySetResolvablePrivateAddressTimeout(rpaTimeout: HCILowEnergyCommand.HCILESetResolvablePrivateAddressTimeout.RPATimeout, timeout: HCICommandTimeout = .default) throws {
        
        let parameters = HCILowEnergyCommand.HCILESetResolvablePrivateAddressTimeout(rpaTimeout: rpaTimeout)
        
        try deviceRequest(parameters, timeout: timeout)
    }
    
    /// LE Read Maximum Data Length Command
    ///
    /// This ommand allows the Host to read the Controller’s maximum supported payload octets
    /// and packet duration times for transmission and reception
    func lowEnergyReadMaximumDataLengthReturn(timeout: HCICommandTimeout = .default) throws -> HCILowEnergyCommand.ReadMaximumDataLengthReturnParameter {
        
        let value = try deviceRequest(HCILowEnergyCommand.ReadMaximumDataLengthReturnParameter.self,
                                      timeout: timeout)
        
        return value
    }

}
