//
//  LowEnergyEncryption.swift
//  Bluetooth
//
//  Created by Marco Estrella on 3/30/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

public extension BluetoothHostControllerInterface {
    
    /// LE Encrypt Command
    ///
    /// The Commnad is used to request the Controller to encrypt the Plaintext_Data in the command using the Key given in the command
    /// and returns the Encrypted_Data to the Host.
    func lowEnergyEncrypt(key: UInt128, data: UInt128, timeout: HCICommandTimeout = .default) throws -> UInt128 {
        
        let parameters = LowEnergyCommand.EncryptParameter(key: key, data: data)
        
        let returnParameters = try deviceRequest(parameters, LowEnergyCommand.EncryptReturnParameter.self, timeout: timeout)
        
        return returnParameters.encryptedData
    }
    
    /// LE Rand Command
    ///
    /// The command is used to request the Controller to generate 8 octets of random data to be sent to the Host.
    func lowEnergyRandom(timeout: HCICommandTimeout = .default) throws -> UInt64 {
        
        let returnParameters = try deviceRequest(LowEnergyCommand.RandomReturnParameter.self, timeout: timeout)
        
        return returnParameters.randomNumber
    }
}
