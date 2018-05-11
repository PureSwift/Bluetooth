//
//  LowEnergyFeaturesCommands.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 4/10/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

public extension BluetoothHostControllerInterface {
    
    /// LE Read Local Supported Features Command
    ///
    /// This command requests the list of the supported LE features for the Controller.
    func readLocalSupportedFeatures(timeout: HCICommandTimeout = .default) throws -> LowEnergyFeatureSet {
        
        let returValue = try deviceRequest(LowEnergyCommand.ReadLocalSupportedFeaturesReturnParameter.self, timeout: timeout)
        
        return returValue.features
    }
    
    /// LE Read Supported States
    ///
    /// The LE_Read_Supported_States command reads the states and state combinations that the link layer supports.
    func readSupportedStates(timeout: HCICommandTimeout = .default) throws -> LowEnergyStateSet {
        
        let returValue = try deviceRequest(LowEnergyCommand.ReadSupportedStatesReturnParameter.self, timeout: timeout)
        
        return returValue.state
    }
    
    /// LE Read Remote Features Command
    ///
    /// The command requests, from the remote device identified by the connection handle,
    /// the features used on the connection and the features supported by the remote device.
    func lowEnergyReadRemoteUsedFeatures(connectionHandle: UInt16, timeout: HCICommandTimeout = .default) throws -> LowEnergyFeatureSet {
        
        let parameters = LowEnergyCommand.ReadRemoteUsedFeaturesParameter(connectionHandle: connectionHandle)
        
        let event =  try deviceRequest(parameters,
                                       LowEnergyEvent.ReadRemoteUsedFeaturesCompleteEventParameter.self,
                                       timeout: timeout)
        
        switch event.status {
            
        case let .error(error):
            throw error
            
        case .success:
            
            assert(event.handle == connectionHandle, "Invalid connection handle \(event.handle)")
            
            return event.features
        }
    }
    
    /// LE Read Transmit Power Command
    ///
    /// The command is used to read the minimum and maximum transmit powers supported by the Controller.ReadTransmitPowerReturnParameter
    func lowEnergyReadTransmitPower(timeout: HCICommandTimeout = .default) throws -> LowEnergyCommand.ReadTransmitPowerReturnParameter {
        
        return try deviceRequest(LowEnergyCommand.ReadTransmitPowerReturnParameter.self, timeout: timeout)
    }
    
    /// LE Read RF Path Compensation Command
    ///
    /// The command is used to read the RF Path Compensation Values parameter used in the Tx Power Level and RSSI calculation.
    func lowEnergyReadRfPathCompensation(timeout: HCICommandTimeout = .default) throws -> LowEnergyCommand.ReadRfPathCompensationReturnParameter {
        
        return try deviceRequest(LowEnergyCommand.ReadRfPathCompensationReturnParameter.self, timeout: timeout)
    }
    
    /// LE Write RF Path Compensation Command
    ///
    /// The command is used to indicate the RF path gain or loss between the RF transceiver and
    /// the antenna contributed by intermediate components.
    func lowEnergyWriteRfPathCompensation(rfTxPathCompensationValue: RfTxPathCompensationValue,
                                          rfRxPathCompensationValue: RfRxPathCompensationValue,
                                          timeout: HCICommandTimeout = .default) throws {
        
        let parameters = LowEnergyCommand.WriteRfPathCompensationParameter(rfTxPathCompensationValue: rfTxPathCompensationValue, rfRxPathCompensationValue: rfRxPathCompensationValue)
        
        try deviceRequest(parameters, timeout: timeout)
    }
    
    /// LE Set Privacy Mode Command
    ///
    /// The command is used to allow the Host to specify the privacy mode to be used for a given entry on the resolving list.
    func lowEnergySetPrivacyMode(peerIdentityAddressType: LowEnergyPeerIdentifyAddressType,
                                 peerIdentityAddress: Address,
                                 privacyMode: LowEnergyCommand.SetPrivacyModeParameter.PrivacyMode = LowEnergyCommand.SetPrivacyModeParameter.PrivacyMode.networkPrivacy,
                                 timeout: HCICommandTimeout = .default) throws {
        
        let parameters = LowEnergyCommand.SetPrivacyModeParameter(peerIdentityAddressType: peerIdentityAddressType,
                                                                  peerIdentityAddress: peerIdentityAddress,
                                                                  privacyMode: privacyMode)
        
        try deviceRequest(parameters, timeout: timeout)
    }
    
    /// LE Extended Create Connection Command
    ///
    /// The command is used to create a Link Layer connection to a connectable advertiser.
    func lowEnergyExtendedCreateConnection(initialingFilterPolicy: LowEnergyCommand.ExtendedCreateConnectionParameter.InitialingFilterPolicy,
                                           ownAddressType: LowEnergyCommand.ExtendedCreateConnectionParameter.OwnAddressType,
                                           peerAddressType: LowEnergyPeerIdentifyAddressType,
                                           peerAddress: Address,
                                           initialingPHY: LowEnergyCommand.ExtendedCreateConnectionParameter.InitialingPHY,
                                           timeout: HCICommandTimeout = .default) throws -> LowEnergyEvent.EnhancedConnectionCompleteEventParameter {
        
        let parameters = LowEnergyCommand.ExtendedCreateConnectionParameter(initialingFilterPolicy: initialingFilterPolicy,
                                                                  ownAddressType: ownAddressType,
                                                                  peerAddressType: peerAddressType,
                                                                  peerAddress: peerAddress,
                                                                  initialingPHY: initialingPHY)

        let event =  try deviceRequest(parameters,
                                       LowEnergyEvent.EnhancedConnectionCompleteEventParameter.self,
                                       timeout: timeout)
        
        switch event.status {
            
        case let .error(error):
            throw error
            
        case .success:
            
            return event
        }
    }
}
