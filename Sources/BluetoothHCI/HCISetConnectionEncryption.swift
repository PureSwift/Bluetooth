//
//  HCISetConnectionEncryption.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 8/6/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// Set Connection Encryption Command
    ///
    /// The Set_Connection_Encryption command is used to enable and disable the link level encryption. Note: the Connection_Handle command parameter is used to identify the other BR/EDR Controller which forms the connection. The Connection_Handle should be a Connection_Handle for an ACL connection. While the encryption is being changed, all ACL traffic must be turned off for all Connection_Handles associated with the remote device.
    func setConnectionEncryption(handle: UInt16,
                                 encryption: HCISetConnectionEncryption.Encryption,
                                 timeout: HCICommandTimeout = .default) async throws -> HCIEncryptionChange {
        
        let connectionEncryption = HCISetConnectionEncryption(handle: handle, encryption: encryption)
        return try await deviceRequest(connectionEncryption, HCIEncryptionChange.self, timeout: timeout)
    }
}

// MARK: - Command

/// Set Connection Encryption Command
///
/// The Set_Connection_Encryption command is used to enable and disable the link level encryption. Note: the Connection_Handle command parameter is used to identify the other BR/EDR Controller which forms the connection. The Connection_Handle should be a Connection_Handle for an ACL connection. While the encryption is being changed, all ACL traffic must be turned off for all Connection_Handles associated with the remote device.
@frozen
public struct HCISetConnectionEncryption: HCICommandParameter {
    
    public static let command = LinkControlCommand.setConnectionEncryption
    
    /// Connection_Handle to be used to enable/disable the link layer encryption for all Connection_Handles with the same BR/EDR Controller end-point as the specified Connection_Handle.
    public var handle: UInt16
    
    public var encryption: Encryption
    
    public init(handle: UInt16, encryption: Encryption) {
        
        self.handle = handle
        self.encryption = encryption
    }
    
    public var data: Data {
        
        let handleBytes = handle.littleEndian.bytes
        
        return Data([handleBytes.0, handleBytes.1, encryption.rawValue])
    }
}

extension HCISetConnectionEncryption {
    
    public enum Encryption: UInt8 {
        
        case disable = 0x00
        
        case enable = 0x01
    }
}
