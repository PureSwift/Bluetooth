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
        
        let parameters = HCILEEncrypt(key: key, plainText: data)
        
        let returnParameters = try deviceRequest(parameters, HCILowEnergyCommand.EncryptReturnParameter.self, timeout: timeout)
        
        return returnParameters.encryptedData
    }
    
    /// LE Rand Command
    ///
    /// The command is used to request the Controller to generate 8 octets of random data to be sent to the Host.
    func lowEnergyRandom(timeout: HCICommandTimeout = .default) throws -> UInt64 {
        
        let returnParameters = try deviceRequest(HCILowEnergyCommand.RandomReturnParameter.self, timeout: timeout)
        
        return returnParameters.randomNumber
    }
    
    /// LE Start Encryption Command
    ///
    /// The command is used to authenticate the given encryption key associated with the remote device specified
    /// by the Connection_Handle, and once authenticated will encrypt the connection.
    func lowEnergyStartEncryption(connectionHandle: UInt16,
                                  randomNumber: UInt64,
                                  encryptedDiversifier: UInt16,
                                  longTermKey: UInt128,
                                  timeout: HCICommandTimeout = .default) throws {
        
        /**
         When the Controller receives the LE_Start_Encryption command it shall send the Command Status event to the Host. If the connection is not encrypted when this command is issued, an Encryption Change event shall occur when encryption has been started for the connection. If the connection is encrypted when this command is issued, an Encryption Key Refresh Complete event shall occur when encryption has been resumed.
         
         - Note: A Command Complete event is not sent by the Controller to indicate that this command has been completed. Instead, the Encryption Change or Encryption Key Refresh Complete events indicate that this command has been completed.
         */
        
        let command = HCILEStartEncryption(connectionHandle: connectionHandle,
                                                                randomNumber: randomNumber,
                                                                encryptedDiversifier: encryptedDiversifier,
                                                                longTermKey: longTermKey)
        
        /// expect Command Status - LE Start Encryption
        let commandStatus = try deviceRequest(command, HCIGeneralEvent.CommandStatusParameter.self, timeout: timeout)
        
        if let error = commandStatus.status.error {
            
            throw error
        }
        
        /*
        var encryptionChange: LowEnergyEncryptionChange?
        var eventFound = false
        
        try pollEvent(HCIGeneralEvent.LowEnergyMetaParameter.self, shouldContinue: { shouldContinue() && eventFound == false }, event: { (metaEvent) in
            
            eventFound = true
            
            switch metaEvent.subevent {
                
            case .encryptionChange:
                
                // parse LE Encryption Change
                guard let encryptionEvent = LowEnergyEvent.EncryptionChangeEventParameter(data: metaEvent.data)
                    else { throw BluetoothHostControllerError.garbageResponse(Data(metaEvent.data)) }
                
                if let error = encryptionEvent.status.error {
                    
                    throw error
                }
                
                assert(encryptionEvent.handle == connectionHandle)
                
                encryptionChange = encryptionEvent.encryptionEnabled
                
            case .encryptionKeyRefreshComplete:
                
                // parse LE Key Refresh Complete
                guard let encryptionEvent = LowEnergyEvent.EncryptionKeyRefreshCompleteEventParameter(data: metaEvent.data)
                    else { throw BluetoothHostControllerError.garbageResponse(Data(metaEvent.data)) }
                
                if let error = encryptionEvent.status.error {
                    
                    throw error
                }
                
                assert(encryptionEvent.handle == connectionHandle)
                
            default:
                
                throw BluetoothHostControllerError.garbageResponse(Data(metaEvent.data))
            }
        })
 
        return encryptionChange
        */
    }
}
