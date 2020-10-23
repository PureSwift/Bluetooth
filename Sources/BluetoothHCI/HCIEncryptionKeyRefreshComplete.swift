//
//  HCIEncryptionKeyRefreshComplete.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// Encryption Key Refresh Complete Event
///
/// The Encryption Key Refresh Complete event is used to indicate to the Host that the encryption key was
/// refreshed on the given Connection_Handle any time encryption is paused and then resumed.
/// The BR/EDR Controller shall send this event when the encryption key has been refreshed
/// due to encryption being started or resumed.
///
/// If the Encryption Key Refresh Complete event was generated due to an encryption pause
/// and resume operation embedded within a change connection link key procedure, t
/// he Encryption Key Refresh Complete event shall be sent prior to the Change Connection Link Key Complete event.
///
/// If the Encryption Key Refresh Complete event was generated due to an encryption pause and
/// resume operation embedded within a role switch procedure,
/// the Encryption Key Refresh Complete event shall be sent prior to the Role Change event.
public struct HCIEncryptionKeyRefreshComplete: HCIEventParameter {
    
    public static let event = HCIGeneralEvent.encryptionKeyRefreshComplete // 0x30
    
    public static let length: Int = 3
    
    public let status: HCIStatus
    
    public let handle: UInt16 // Connection_Handle
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let statusByte = data[0]
        
        let handle = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))
        
        guard let status = HCIStatus(rawValue: statusByte)
            else { return nil }
        
        self.status = status
        self.handle = handle
    }
}
