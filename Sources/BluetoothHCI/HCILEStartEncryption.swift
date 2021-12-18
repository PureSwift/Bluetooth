//
//  HCILEStartEncryption.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// LE Start Encryption Command
    ///
    /// The command is used to authenticate the given encryption key associated with the remote device specified
    /// by the Connection_Handle, and once authenticated will encrypt the connection.
    func lowEnergyStartEncryption(connectionHandle: UInt16,
                                  randomNumber: UInt64,
                                  encryptedDiversifier: UInt16,
                                  longTermKey: UInt128,
                                  timeout: HCICommandTimeout = .default) async throws {
        
        /**
         When the Controller receives the LE_Start_Encryption command it shall send the Command Status event to the Host. If the connection is not encrypted when this command is issued, an Encryption Change event shall occur when encryption has been started for the connection. If the connection is encrypted when this command is issued, an Encryption Key Refresh Complete event shall occur when encryption has been resumed.
         
         - Note: A Command Complete event is not sent by the Controller to indicate that this command has been completed. Instead, the Encryption Change or Encryption Key Refresh Complete events indicate that this command has been completed.
         */
        
        let command = HCILEStartEncryption(connectionHandle: connectionHandle,
                                           randomNumber: randomNumber,
                                           encryptedDiversifier: encryptedDiversifier,
                                           longTermKey: longTermKey)
        
        /// expect Command Status - LE Start Encryption
        let commandStatus = try await deviceRequest(command, HCICommandStatus.self, timeout: timeout)
        
        if let error = commandStatus.status.error {
            throw error
        }
        
        /*
         var encryptionChange: LowEnergyEncryptionChange?
         var eventFound = false
         
         try pollEvent(HCILowEnergyMetaEvent.self, shouldContinue: { shouldContinue() && eventFound == false }, event: { (metaEvent) in
         
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

// MARK: - Command

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
@frozen
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
    
    public init(connectionHandle: UInt16,
                randomNumber: UInt64 = .random(in: .min ..< .max),
                encryptedDiversifier: UInt16,
                longTermKey: UInt128) {
        
        self.connectionHandle = connectionHandle
        self.randomNumber = randomNumber
        self.encryptedDiversifier = encryptedDiversifier
        self.longTermKey = longTermKey
    }
    
    public var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension HCILEStartEncryption: DataConvertible {
    
    var dataLength: Int {
        
        return 2 + 8 + 2 + 16
    }
    
    static func += <T: DataContainer> (data: inout T, value: HCILEStartEncryption) {
        
        data += value.connectionHandle.littleEndian
        data += value.randomNumber.littleEndian
        data += value.encryptedDiversifier.littleEndian
        data += value.longTermKey.littleEndian
    }
}
