//
//  LowEnergyAdvertising.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 3/26/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - BluetoothHostControllerInterface

public extension BluetoothHostControllerInterface {
    
    /// LE Read Advertising Channel Tx Power Command
    ///
    /// The command is used by the Host to read the transmit power level used for LE advertising channel packets.
    func readAdvertisingChannelTxPower(timeout: HCICommandTimeout = .default) throws -> HCILowEnergyCommand.ReadAdvertisingChannelTxPowerReturnParameter.TransmitPowerLevel {
        
        let value = try deviceRequest(HCILowEnergyCommand.ReadAdvertisingChannelTxPowerReturnParameter.self,
                                      timeout: timeout)
        
        return value.transmitPowerLevel
    }
    
    /// LE Set Advertising Enable
    ///
    /// The LE Set Advertising Enable command is used to request the Controller to start or stop advertising.
    /// The Controller manages the timing of advertisements as per the advertising parameters given in the
    /// LE Set Advertising Parameters command.
    func enableLowEnergyAdvertising(_ isEnabled: Bool = true,
                                    timeout: HCICommandTimeout = .default) throws {
        
        let parameter = HCILowEnergyCommand.HCILESetAdvertiseEnable(isEnabled: isEnabled)
        
        try deviceRequest(parameter, timeout: timeout)
    }
    
    /// LE Set Advertising Data Command
    ///
    /// Used to set the data used in advertising packets that have a data field.
    func setLowEnergyAdvertisingData(_ data: LowEnergyAdvertisingData,
                                     timeout: HCICommandTimeout = .default) throws {
        
        let parameter = HCILowEnergyCommand.HCILESetAdvertisingData(advertisingData: data)
        
        try deviceRequest(parameter, timeout: timeout)
    }
    
    /// LE Set Advertising Parameters Command
    ///
    /// Used by the Host to set the advertising parameters.
    func setLowEnergyAdvertisingParameters(_ parameters: HCILowEnergyCommand.HCILESetAdvertisingParameters,
                                           timeout: HCICommandTimeout = .default) throws {
        
        try deviceRequest(parameters, timeout: timeout)
    }
    
    /// LE Set Advertising Set Random Address Command
    ///
    /// The command is used by the Host to set the random device address specified by the Random_Address parameter.
    func setAdvertisingSetRandomAddress(advertisingHandle: UInt8,
                                        advertisingRandomAddress: Address,
                                        timeout: HCICommandTimeout = .default) throws {
        
        let parameters = HCILowEnergyCommand.SetAdvertisingSetRandomAddress(advertisingHandle: advertisingHandle, advertisingRandomAddress: advertisingRandomAddress)
        
        try deviceRequest(parameters, timeout: timeout)
    }
    
    /// LE Set Extended Advertising Parameters Command
    ///
    /// The command is used by the Host to set the advertising parameters.
    func setExtendedAdvertisingParameters(_ parameters: HCILowEnergyCommand.SetExtendedAdvertisingParametersParameter,
                                          timeout: HCICommandTimeout = .default) throws -> LowEnergyTxPower {
        
        let returnParameter = try deviceRequest(parameters, HCILowEnergyCommand.SetExtendedAdvertisingParametersReturnParameter.self, timeout: timeout)
        
        return returnParameter.selectedTxPower
    }
    
    /// LE Set Extended Advertising Data Command
    ///
    /// The command is used to set the data used in advertising PDUs that have a data field.
    func setExtendedAdvertisingData(advertisingHandle: UInt8,
                                    operation: HCILowEnergyCommand.SetExtendedAdvertisingDataParameter.Operation,
                                    fragmentPreference: LowEnergyFragmentPreference,
                                    advertisingData: [UInt8],
                                    timeout: HCICommandTimeout = .default)  throws {
        
        let parameters = HCILowEnergyCommand.SetExtendedAdvertisingDataParameter(advertisingHandle: advertisingHandle, operation: operation, fragmentPreference: fragmentPreference, advertisingData: advertisingData)
        
        try deviceRequest(parameters, timeout: timeout)
    }
    
    /// LE Read Maximum Advertising Data Length Command
    ///
    /// The ommand is used to read the maximum length of data supported by the Controller for use
    /// as advertisement data or scan response data in an advertising event or as periodic advertisement data.
    func setReadMaximumAdvertisingDataLength(timeout: HCICommandTimeout = .default) throws -> UInt16 {
        
        let value = try deviceRequest(HCILowEnergyCommand.ReadMaximumAdvertisingDataLengthReturnParameter.self,
                                      timeout: timeout)
        
        return value.maximumAdvertisingDataLength
    }
    
    /// LE Read Number of Supported Advertising Sets Command
    ///
    /// The command is used to read the maximum number of advertising sets supported by
    /// the advertising Controller at the same time. Note: The number of advertising sets that
    /// can be supported is not fixed and the Controller can change it at any time because the memory
    /// used to store advertising sets can also be used for other purposes.
    func readNumberOfSupportedAdvertisingSets(timeout: HCICommandTimeout = .default) throws -> UInt8 {
        
        let value = try deviceRequest(HCILowEnergyCommand.ReadNumberOfSupportedAdvertisingSetsReturnParameter.self,
                                      timeout: timeout)
        
        return value.numSupportedAdvertisingSets
    }
    
    /// LE Remove Advertising Set Command
    ///
    /// The command is used to remove an advertising set from the Controller.
    func setLowEnergyRemoveAdvertisingSet(advertisingHandle: UInt8, timeout: HCICommandTimeout = .default) throws {
        
        let parameters = HCILowEnergyCommand.RemoveAdvertisingSetParameter(advertisingHandle: advertisingHandle)
        
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
        
        try deviceRequest(HCILowEnergyCommand.clearAdvertisingSets, timeout: timeout)
    }
    
    /// LE Set Periodic Advertising Parameters Command
    ///
    /// The  command is used by the Host to set the parameters for periodic advertising.
    func setSetPeriodicAdvertisingParameters(advertisingHandle: UInt8,
                                             periodicAdvertisingInterval: HCILowEnergyCommand.SetPeriodicAdvertisingParametersParameter.PeriodicAdvertisingInterval,
                                             advertisingEventProperties: HCILowEnergyCommand.SetPeriodicAdvertisingParametersParameter.AdvertisingEventProperties,
                                             timeout: HCICommandTimeout = .default)  throws {
        
        let parameters = HCILowEnergyCommand.SetPeriodicAdvertisingParametersParameter(advertisingHandle: advertisingHandle, periodicAdvertisingInterval: periodicAdvertisingInterval, advertisingEventProperties: advertisingEventProperties)
        
        try deviceRequest(parameters, timeout: timeout)
    }
    
    /// LE Set Periodic Advertising Data Command
    ///
    /// The command is used to set the data used in periodic advertising PDUs.
    func setSetPeriodicAdvertisingData(advertisingHandle: UInt8,
                                       operation: HCILowEnergyCommand.SetPeriodicAdvertisingDataParameter.Operation,
                                       advertisingData: [UInt8],
                                       timeout: HCICommandTimeout = .default)  throws {
        
        let parameters = HCILowEnergyCommand.SetPeriodicAdvertisingDataParameter(advertisingHandle: advertisingHandle, operation: operation, advertisingData: advertisingData)
        
        try deviceRequest(parameters, timeout: timeout)
    }
    
    /// LE Set Periodic Advertising Enable Command
    ///
    /// The  command is used to request the Controller to enable or disable the periodic advertising
    /// for the advertising set specified by the Advertising_Handle parameter (ordinary advertising is not affected).
    func setPeriodicAdvertisingEnable(enable: HCILowEnergyCommand.SetPeriodicAdvertisingEnableParameter.Enable,
                                      advertisingHandle: UInt8,
                                      timeout: HCICommandTimeout = .default)  throws {
        
        let parameters = HCILowEnergyCommand.SetPeriodicAdvertisingEnableParameter(enable: enable,
                                                                                advertisingHandle: advertisingHandle)
        
        try deviceRequest(parameters, timeout: timeout)
    }
    
    /// LE Periodic Advertising Create Sync Command
    ///
    /// The command is used to synchronize with periodic advertising from an advertiser
    /// and begin receiving periodic advertising packets.
    func setPeriodicAdvertisingCreateSyncParameters(_ parameters: HCILowEnergyCommand.PeriodicAdvertisingCreateSyncParameter,
                                                    timeout: HCICommandTimeout = .default)  throws {
        
        try deviceRequest(parameters, timeout: timeout)
    }
    
    /// LE Periodic Advertising Create Sync Cancel Command
    ///
    /// ommand is used to cancel the LE_Periodic_Advertising_Create_Sync command while it is pending.
    ///
    /// If the Host issues this command while no LE_Periodic_Advertising_Create_Sync command is pending,
    /// the Controller shall return the error code Command Disallowed (0x0C).
    func lowEnergyPeriodicAdvertisingCreateSyncCancel(timeout: HCICommandTimeout = .default) throws {
        
        try deviceRequest(HCILowEnergyCommand.periodicAdvertisingCreateSyncCancel, timeout: timeout)
    }
    
    /// LE Periodic Advertising Terminate Sync Command
    ///
    /// The command is used to stop reception of the periodic advertising identified by the Sync_Handle parameter.
    func setPeriodicAdvertisingTerminateSync(syncHandle: UInt16,
                                             timeout: HCICommandTimeout = .default)  throws {
        
        let parameters = HCILowEnergyCommand.PeriodicAdvertisingTerminateSyncParameter(syncHandle: syncHandle)
        
        try deviceRequest(parameters, timeout: timeout)
    }
    
    /// LE Add Device To Periodic Advertiser List Command
    ///
    /// The command is used to add a single device to the Periodic Advertiser list stored in the Controller.
    func addDeviceToPeriodicAdvertiserList(advertiserAddressType: LowEnergyAdvertiserAddressType,
                                           address: Address,
                                           advertisingSid: UInt8,
                                           timeout: HCICommandTimeout = .default)  throws {
        
        let parameters = HCILowEnergyCommand.AddDeviceToPeriodicAdvertiserListParameter(advertiserAddressType: advertiserAddressType,
                                                                            address: address,
                                                                            advertisingSid: advertisingSid)
        
        try deviceRequest(parameters, timeout: timeout)
    }
    
    /// LE Remove Device From Periodic Advertiser List Command
    ///
    /// The LE_Remove_Device_From_Periodic_Advertiser_List command is used to remove one device from the list of Periodic
    /// Advertisers stored in the Controller. Removals from the Periodic Advertisers List take effect immediately.
    func lowEnergyRemoveDeviceToPeriodicAdvertiserList(advertiserAddressType: LowEnergyAdvertiserAddressType,
                                                       address: Address,
                                                       advertisingSid: UInt8,
                                                       timeout: HCICommandTimeout = .default)  throws {
        
        let parameters = HCILowEnergyCommand.RemoveDeviceToPeriodicAdvertiserListParameter(advertiserAddressType: advertiserAddressType,
                                                                                     address: address,
                                                                                     advertisingSid: advertisingSid)
        
        try deviceRequest(parameters, timeout: timeout)
    }
    
    /// LE Clear Periodic Advertiser List Command
    ///
    /// The LE_Clear_Periodic_Advertiser_List command is used to remove all devices from the list of Periodic Advertisers
    /// in the Controller.
    ///
    /// If this command is used when an LE_Periodic_Advertising_Create_Sync command is pending,
    /// the Controller shall return the error code Command Disallowed (0x0C).
    func lowEnergyClearPeriodicAdvertiserList(timeout: HCICommandTimeout = .default) throws {
        
        try deviceRequest(HCILowEnergyCommand.clearPeriodicAdvertiserList, timeout: timeout) //0x0049
    }
    
    /// LE Read Periodic Advertiser List Size Command
    ///
    /// The command is used to read the total number of Periodic Advertiser list entries that can be stored in the Controller.
    func lowEnergyReadPeriodicAdvertisingListSize(timeout: HCICommandTimeout = .default) throws -> UInt8 {
        
        let value = try deviceRequest(HCILowEnergyCommand.ReadPeriodicAdvertisingListSizeReturnParameter.self,
                                      timeout: timeout)
        
        return value.periodicAdvertiserListSize
    }
    
    /// LE Generate DHKey Command
    ///
    /// This command is used to initiate generation of a Diffie- Hellman key in the Controller for use over the LE transport.
    /// This command takes the remote P-256 public key as input.
    /// The Diffie-Hellman key generation uses the private key generated by LE_Read_Local_P256_Public_Key command.
    func lowEnergyGenerateDHKey( remoteP256PublicKey: UInt512,
                                 timeout: HCICommandTimeout = .default) throws {
        
        let parameters = HCILowEnergyCommand.GenerateDHKeyParameter(remoteP256PublicKey: remoteP256PublicKey)
        
        try deviceRequest(parameters, timeout: timeout)
    }
    
}
