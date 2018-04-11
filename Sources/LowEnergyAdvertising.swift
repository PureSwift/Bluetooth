//
//  LowEnergyAdvertising.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 3/26/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

public extension BluetoothHostControllerInterface {
    
    typealias AdvertisingEventProperties = LowEnergyCommand.SetExtendedAdvertisingParametersParameter.AdvertisingEventProperties
    typealias PrimaryAdvertisingInterval = LowEnergyCommand.SetExtendedAdvertisingParametersParameter.PrimaryAdvertisingInterval
    typealias PrimaryAdvertisingChannelMap = LowEnergyCommand.SetExtendedAdvertisingParametersParameter.PrimaryAdvertisingChannelMap
    typealias OwnAddressType = LowEnergyCommand.SetExtendedAdvertisingParametersParameter.OwnAddressType
    typealias PeerAddressType = LowEnergyCommand.SetExtendedAdvertisingParametersParameter.PeerAddressType
    typealias AdvertisingFilterPolicy = LowEnergyCommand.SetExtendedAdvertisingParametersParameter.AdvertisingFilterPolicy
    typealias PrimaryAdvertisingPhy = LowEnergyCommand.SetExtendedAdvertisingParametersParameter.PrimaryAdvertisingPhy
    typealias SecondaryAdvertisingMaxSkip = LowEnergyCommand.SetExtendedAdvertisingParametersParameter.SecondaryAdvertisingMaxSkip
    typealias SecondaryAdvertisingPhy = LowEnergyCommand.SetExtendedAdvertisingParametersParameter.SecondaryAdvertisingPhy
    typealias ScanRequestNotificationEnable = LowEnergyCommand.SetExtendedAdvertisingParametersParameter.ScanRequestNotificationEnable
    
    func enableLowEnergyAdvertising(_ enabled: Bool = true, timeout: HCICommandTimeout = .default) throws {
        
        let parameter = LowEnergyCommand.SetAdvertiseEnableParameter(enabled: enabled)
        
        try deviceRequest(parameter, timeout: timeout)
    }
    
    func setLowEnergyAdvertisingData(_ data: LowEnergyResponseData, length: UInt8, timeout: HCICommandTimeout = .default) throws {
        
        let parameter = LowEnergyCommand.SetAdvertisingDataParameter(data: data, length: length)
        
        try deviceRequest(parameter, timeout: timeout)
    }
    
    func setLowEnergyAdvertisingData(data: Data, timeout: HCICommandTimeout = .default) throws {
        
        precondition(data.count <= 31, "LE Advertising Data can only be 31 octets")
        
        let bytes: LowEnergyResponseData = (data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7], data[8], data[9], data[10], data[11], data[12], data[13], data[14], data[15], data[16], data[17], data[18], data[19], data[20], data[21], data[22], data[23], data[24], data[25], data[26], data[27], data[28], data[29], data[30])
        
        let parameter = LowEnergyCommand.SetAdvertisingDataParameter(data: bytes, length: UInt8(data.count))
        
        try deviceRequest(parameter, timeout: timeout)
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
    
    func setLowEnergySetExtendedAdvertisingParameters(_ parameters: LowEnergyCommand.SetExtendedAdvertisingParametersParameter,
                                                      timeout: HCICommandTimeout = .default) throws -> LowEnergyTxPower {
        
        let returnParameter = try deviceRequest(parameters, LowEnergyCommand.SetExtendedAdvertisingParametersReturnParameter.self, timeout: timeout)
        
        return returnParameter.selectedTxPower
    }
}
