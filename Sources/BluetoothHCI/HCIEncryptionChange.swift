//
//  HCIEncryptionChange.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// Encryption Change Event
///
/// The Encryption Change event is used to indicate that the change of the encryption mode has been completed.
///
/// This event will occur on both devices to notify the Hosts when Encryption has changed for all connections between the two devices.
///
/// Note: This event shall not be generated if encryption is paused or resumed; during a role switch, for example.
public struct HCIEncryptionChange: HCIEventParameter {
    
    public static let event = HCIGeneralEvent.encryptionChange
    
    public static let length: Int = 4
    
    public let status: HCIStatus
    
    /// The Connection_Handle will be a Connection_Handle for an ACL connection and is used to identify the remote device.
    public let handle: UInt16 // Connection_Handle
    
    /// The Encryption_Enabled event parameter specifies the new Encryption_Enabled parameter
    /// for the Connection_Handle specified by the Connection_Handle event parameter.
    ///
    /// The meaning of the Encryption_Enabled parameter depends on whether the Host has indicated support for Secure Connections in the Secure_Connections_Host_Support parameter.
    /// When Secure_Connections_Host_Support is ‘disabled’ or the Connection_Handle refers to an LE link, the Controller
    /// shall only use Encryption_Enabled values 0x00 (OFF) and 0x01 (ON). When Secure_Connections_Host_Support is ‘enabled’ and
    /// the Connection_Handle refers to a BR/EDR link, the Controller shall set Encryption_Enabled to 0x00 when encryption is off,
    /// to 0x01 when encryption is on and using E0 and to 0x02 when encryption is on and using AES-CCM.
    public let encryptionEnabled: EncryptionEnabled
    
    public init?(data: Data) {
        
        guard data.count == HCIEncryptionChange.length
            else { return nil }
        
        let statusByte = data[0]
        
        let handle = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))
        
        let encryptionEnabledByte = data[3]
        
        guard let status = HCIStatus(rawValue: statusByte)
            else { return nil }
        
        guard let encryptionEnabled = EncryptionEnabled(rawValue: encryptionEnabledByte)
            else { return nil }
        
        self.status = status
        self.handle = handle
        self.encryptionEnabled = encryptionEnabled
    }
    
    public enum EncryptionEnabled: UInt8 { // Encryption_Enabled
        
        /// Link Level Encryption is OFF.
        case off         = 0x00
        
        /// Link Level Encryption is ON with E0 for BR/EDR.
        /// Link Level Encryption is ON with AES-CCM for LE.
        case e0          = 0x01
        
        /// Link Level Encryption is ON with AES-CCM for BR/EDR.
        case aes         = 0x02
    }
}
