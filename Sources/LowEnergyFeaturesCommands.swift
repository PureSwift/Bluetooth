//
//  LowEnergyFeaturesCommands.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 4/10/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

public extension BluetoothHostControllerInterface {
    
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
    func loweEnergyWriteRfPathCompensation(rfTxPathCompensationValue: RfTxPathCompensationValue,
                                           rfRxPathCompensationValue: RfRxPathCompensationValue,
                                           timeout: HCICommandTimeout = .default) throws {
        
        let parameters = LowEnergyCommand.WriteRfPathCompensationParameter(rfTxPathCompensationValue: rfTxPathCompensationValue, rfRxPathCompensationValue: rfRxPathCompensationValue)
        
        try deviceRequest(parameters, timeout: timeout)
    }
}
