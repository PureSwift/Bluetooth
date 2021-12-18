//
//  HCILEEncrypt.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// LE Encrypt Command
    ///
    /// The Commnad is used to request the Controller to encrypt the Plaintext_Data in the command using the Key given in the command
    /// and returns the Encrypted_Data to the Host.
    func lowEnergyEncrypt(key: UInt128,
                          data: UInt128,
                          timeout: HCICommandTimeout = .default) async throws -> UInt128 {
        
        let parameters = HCILEEncrypt(key: key, plainText: data)
        
        let returnParameters = try await deviceRequest(parameters, HCILEEncryptReturn.self, timeout: timeout)
        
        return returnParameters.encryptedData
    }
}

// MARK: - Command

/// LE Encrypt Command
///
/// The Commnad is used to request the Controller to encrypt the Plaintext_Data in the command using the Key given in the command
/// and returns the Encrypted Data to the Host.
///
/// - Note: The AES-128 bit block cypher is defined in NIST Publication [FIPS-197](http://csrc.nist.gov/publications/fips/fips197/fips-197.pdf).
@frozen
public struct HCILEEncrypt: HCICommandParameter { // HCI_LE_Encrypt
    
    public static let command = HCILowEnergyCommand.encrypt //0x0017
    
    /// 128 bit key for the encryption of the data given in the command.
    /// The most significant octet of the key corresponds to key[0] using the notation specified in FIPS 197.
    public let key: UInt128 //Key
    
    /// 128 bit data block that is requested to be encrypted.
    /// The most significant octet of the PlainText_Data corresponds to in[0] using the notation specified in FIPS 197.
    public let plainText: UInt128 //Plaintext_Data
    
    public init(key: UInt128, plainText: UInt128) {
        
        self.key = key
        self.plainText = plainText
    }
    
    public var data: Data {
        
        return Data(self)
    }
}

extension HCILEEncrypt: DataConvertible {
    
    var dataLength: Int { return 32 }
    
    static func += <T: DataContainer> (data: inout T, value: HCILEEncrypt) {
        
        data += value.key.littleEndian
        data += value.plainText.littleEndian
    }
}

// MARK: - Return parameter

/// LE Encrypt Command
///
/// The Commnad is used to request the Controller to encrypt the Plaintext_Data in the command using the Key given in the command
/// and returns the Encrypted_Data to the Host.
/// The AES-128 bit block cypher is defined in NIST Publication [FIPS-197](http://csrc.nist.gov/publications/fips/fips197/fips-197.pdf).
@frozen
public struct HCILEEncryptReturn: HCICommandReturnParameter {
    
    public static let command = HCILowEnergyCommand.encrypt //0x0017
    
    public static var length: Int { return UInt128.length }
    
    /// 128 bit encrypted data block.
    /// The most significant octet of the Encrypted_Data corresponds to out[0] using the notation specified in FIPS 197.
    public let encryptedData: UInt128
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        guard let encryptedData = UInt128(data: data)
            else { return nil }
        
        self.encryptedData = UInt128(littleEndian: encryptedData)
    }
}
