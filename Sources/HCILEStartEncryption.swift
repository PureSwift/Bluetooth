//
//  HCILEStartEncryption.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

public extension HCILowEnergyCommand {
    
    /// LE Start Encryption Command
    ///
    /// command is used to authenticate the given encryption key associated with the remote device specified
    /// by the Connection_Handle, and once authenticated will encrypt the connection.
    ///
    /// If the connection is already encrypted then the Controller shall pause connection encryption
    /// before attempting to authenticate the given encryption key, and then re-encrypt the connection.
    /// While encryption is paused no user data shall be transmitted.
    ///
    /// On an authentication failure, the connection shall be automatically disconnected
    /// by the Link Layer. If this command succeeds, then the connection shall be encrypted.
    ///
    /// This command shall only be used when the local device’s role is Master.
    public struct HCILEStartEncryption: HCICommandParameter { // HCI_LE_Start_Encryption
        
        public static let command = HCILowEnergyCommand.startEncryption //0x0019
        
        /// Range 0x0000-0x0EFF (all other values reserved for future use)
        public let connectionHandle: UInt16 //Connection_Handle
        
        /// 64 bit random number.
        public let randomNumber: UInt64 //Random_Number
        
        /// 16 bit encrypted diversifier.
        public let encryptedDiversifier: UInt16 //Encrypted_Diversifier
        
        /// 128 bit long term key.
        public let longTermKey: UInt128 //Long_Term_Key
        
        public init(connectionHandle: UInt16, randomNumber: UInt64, encryptedDiversifier: UInt16, longTermKey: UInt128) {
            
            self.connectionHandle = connectionHandle
            self.randomNumber = randomNumber
            self.encryptedDiversifier = encryptedDiversifier
            self.longTermKey = longTermKey
        }
        
        public var data: Data {
            
            let connectionHandleBytes = connectionHandle.littleEndian.bytes
            let randomNumberBytes = randomNumber.littleEndian.bytes
            let encryptedDiversifierBytes = encryptedDiversifier.littleEndian.bytes
            let longTermKeyBytes = longTermKey.littleEndian.bytes
            
            return Data([
                connectionHandleBytes.0,
                connectionHandleBytes.1,
                randomNumberBytes.0,
                randomNumberBytes.1,
                randomNumberBytes.2,
                randomNumberBytes.3,
                randomNumberBytes.4,
                randomNumberBytes.5,
                randomNumberBytes.6,
                randomNumberBytes.7,
                encryptedDiversifierBytes.0,
                encryptedDiversifierBytes.1,
                longTermKeyBytes.0,
                longTermKeyBytes.1,
                longTermKeyBytes.2,
                longTermKeyBytes.3,
                longTermKeyBytes.4,
                longTermKeyBytes.5,
                longTermKeyBytes.6,
                longTermKeyBytes.7,
                longTermKeyBytes.8,
                longTermKeyBytes.9,
                longTermKeyBytes.10,
                longTermKeyBytes.11,
                longTermKeyBytes.12,
                longTermKeyBytes.13,
                longTermKeyBytes.14,
                longTermKeyBytes.15
                ])
        }
    }
}
