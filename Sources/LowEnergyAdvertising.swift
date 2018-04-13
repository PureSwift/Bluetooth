//
//  LowEnergyAdvertising.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 3/26/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

public extension BluetoothHostControllerInterface {
    
    /// LE Set Advertising Enable
    ///
    /// The LE Set Advertising Enable command is used to request the Controller to start or stop advertising.
    /// The Controller manages the timing of advertisements as per the advertising parameters given in the
    /// LE Set Advertising Parameters command.
    func enableLowEnergyAdvertising(_ enabled: Bool = true,
                                    timeout: HCICommandTimeout = .default) throws {
        
        let parameter = LowEnergyCommand.SetAdvertiseEnableParameter(enabled: enabled)
        
        try deviceRequest(parameter, timeout: timeout)
    }
    
    /// LE Set Advertising Data Command
    ///
    /// Used to set the data used in advertising packets that have a data field.
    func setLowEnergyAdvertisingData(_ data: LowEnergyResponseData,
                                     length: UInt8,
                                     timeout: HCICommandTimeout = .default) throws {
        
        let parameter = LowEnergyCommand.SetAdvertisingDataParameter(data: data, length: length)
        
        try deviceRequest(parameter, timeout: timeout)
    }
    
    /// LE Set Advertising Data Command
    ///
    /// Used to set the data used in advertising packets that have a data field.
    func setLowEnergyAdvertisingData(_ data: Data,
                                     timeout: HCICommandTimeout = .default) throws {
        
        precondition(data.count <= 31, "LE Advertising Data can only be 31 octets")
        
        let bytes: LowEnergyResponseData = (data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7], data[8], data[9], data[10], data[11], data[12], data[13], data[14], data[15], data[16], data[17], data[18], data[19], data[20], data[21], data[22], data[23], data[24], data[25], data[26], data[27], data[28], data[29], data[30])
        
        let parameter = LowEnergyCommand.SetAdvertisingDataParameter(data: bytes, length: UInt8(data.count))
        
        try deviceRequest(parameter, timeout: timeout)
    }
    
    /// LE Set Advertising Parameters Command
    ///
    /// Used by the Host to set the advertising parameters.
    func setLowEnergyAdvertisingParameters(_ parameters: LowEnergyCommand.SetAdvertisingParametersParameter,
                                           timeout: HCICommandTimeout = .default) throws {
        
        try deviceRequest(parameters, timeout: timeout)
    }
    
    /// LE Set Advertising Set Random Address Command
    ///
    /// The command is used by the Host to set the random device address specified by the Random_Address parameter.
    func lowEnergySetAdvertisingSetRandomAddress(advertisingHandle: UInt8,
                                                 advertisingRandomAddress: Address,
                                                 timeout: HCICommandTimeout = .default) throws {
        
        let parameters = LowEnergyCommand.SetAdvertisingSetRandomAddress(advertisingHandle: advertisingHandle, advertisingRandomAddress: advertisingRandomAddress)
        
        try deviceRequest(parameters, timeout: timeout)
    }
    
    /// LE Set Extended Advertising Parameters Command
    ///
    /// The command is used by the Host to set the advertising parameters.
    func setLowEnergySetExtendedAdvertisingParameters(_ parameters: LowEnergyCommand.SetExtendedAdvertisingParametersParameter,
                                                      timeout: HCICommandTimeout = .default) throws -> LowEnergyTxPower {
        
        let returnParameter = try deviceRequest(parameters, LowEnergyCommand.SetExtendedAdvertisingParametersReturnParameter.self, timeout: timeout)
        
        return returnParameter.selectedTxPower
    }
    
    /// LE Set Extended Advertising Data Command
    ///
    /// The command is used to set the data used in advertising PDUs that have a data field.
    func setSetExtendedAdvertisingData(advertisingHandle: UInt8,
                                       operation: LowEnergyCommand.SetExtendedAdvertisingDataParameter.Operation,
                                       fragmentPreference: LowEnergyFragmentPreference,
                                       advertisingData: [UInt8],
                                       timeout: HCICommandTimeout = .default)  throws {
        
        let parameters = LowEnergyCommand.SetExtendedAdvertisingDataParameter(advertisingHandle: advertisingHandle, operation: operation, fragmentPreference: fragmentPreference, advertisingData: advertisingData)
        
        try deviceRequest(parameters, timeout: timeout)
    }
    
    /// LE Read Maximum Advertising Data Length Command
    ///
    /// The ommand is used to read the maximum length of data supported by the Controller for use
    /// as advertisement data or scan response data in an advertising event or as periodic advertisement data.
    func setLowEnergyReadMaximumAdvertisingDataLength(timeout: HCICommandTimeout = .default) throws -> UInt16 {
        
        let value = try deviceRequest(LowEnergyCommand.ReadMaximumAadvertisingDataLengthReturnParameter.self,
                                      timeout: timeout)
        
        return value.maximumAdvertisingDataLength
    }
    
    /// LE Read Number of Supported Advertising Sets Command
    ///
    /// The command is used to read the maximum number of advertising sets supported by
    /// the advertising Controller at the same time. Note: The number of advertising sets that
    /// can be supported is not fixed and the Controller can change it at any time because the memory
    /// used to store advertising sets can also be used for other purposes.
    func setLowEnergyReadNumberOfSupportedAdvertisingSets(timeout: HCICommandTimeout = .default) throws -> UInt8 {
        
        let value = try deviceRequest(LowEnergyCommand.ReadNumberOfSupportedAdvertisingSetsReturnParameter.self,
                                      timeout: timeout)
        
        return value.numSupportedAdvertisingSets
    }
    
    /// LE Remove Advertising Set Command
    ///
    /// The command is used to remove an advertising set from the Controller.
    func setLowEnergyRemoveAdvertisingSet(advertisingHandle: UInt8, timeout: HCICommandTimeout = .default) throws {
        
        let parameters = LowEnergyCommand.RemoveAdvertisingSetParameter(advertisingHandle: advertisingHandle)
        
        try deviceRequest(parameters, timeout: timeout)
    }
    
    /// LE Clear Advertising Sets Command
    ///
    /// The command is used to remove all existing advertising sets from the Controller.
    ///
    /// If advertising is enabled on any advertising set,
    /// then the Controller shall return the error code Command Disallowed (0x0C).
    ///
    /// Note: All advertising sets are cleared on HCI reset.
    func lowEnergyClearAdvertisingSets(timeout: HCICommandTimeout = .default) throws {
        
        try deviceRequest(LowEnergyCommand.clearAdvertisingSets, timeout: timeout)
    }
    
    /// LE Set Periodic Advertising Parameters Command
    ///
    /// The  command is used by the Host to set the parameters for periodic advertising.
    func setSetPeriodicAdvertisingParameters(advertisingHandle: UInt8,
                                             periodicAdvertisingInterval: LowEnergyCommand.SetPeriodicAdvertisingParametersParameter.PeriodicAdvertisingInterval,
                                             advertisingEventProperties: LowEnergyCommand.SetPeriodicAdvertisingParametersParameter.AdvertisingEventProperties,
                                             timeout: HCICommandTimeout = .default)  throws {
        
        let parameters = LowEnergyCommand.SetPeriodicAdvertisingParametersParameter(advertisingHandle: advertisingHandle, periodicAdvertisingInterval: periodicAdvertisingInterval, advertisingEventProperties: advertisingEventProperties)
        
        try deviceRequest(parameters, timeout: timeout)
    }
    
    /// LE Set Periodic Advertising Data Command
    ///
    /// The command is used to set the data used in periodic advertising PDUs.
    func setSetPeriodicAdvertisingData(advertisingHandle: UInt8,
                                       operation: LowEnergyCommand.SetPeriodicAdvertisingDataParameter.Operation,
                                       advertisingData: [UInt8],
                                       timeout: HCICommandTimeout = .default)  throws {
        
        let parameters = LowEnergyCommand.SetPeriodicAdvertisingDataParameter(advertisingHandle: advertisingHandle, operation: operation, advertisingData: advertisingData)
        
        try deviceRequest(parameters, timeout: timeout)
    }
    
    /// LE Set Periodic Advertising Enable Command
    ///
    /// The  command is used to request the Controller to enable or disable the periodic advertising
    /// for the advertising set specified by the Advertising_Handle parameter (ordinary advertising is not affected).
    func setSetPeriodicAdvertisingEnable(enable: LowEnergyCommand.SetPeriodicAdvertisingEnableParameter.Enable,
                                         advertisingHandle: UInt8,
                                         timeout: HCICommandTimeout = .default)  throws {
        
        let parameters = LowEnergyCommand.SetPeriodicAdvertisingEnableParameter(enable: enable,
                                                                                advertisingHandle: advertisingHandle)
        
        try deviceRequest(parameters, timeout: timeout)
    }
    
}
