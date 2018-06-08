//
//  HCIGeneralEventParameter.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 3/3/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

import Foundation

public extension HCIGeneralEvent {
    
    // TODO: Complete all command parameters
    
    public struct CommandCompleteParameter: HCIEventParameter {
        
        public static let event = HCIGeneralEvent.commandComplete
        internal static let length = 3
        
        /// The Number of HCI command packets which are allowed to be sent to the Controller from the Host.
        public var numberOfCommandPackets: UInt8
        public var opcode: UInt16
        
        public init?(byteValue: [UInt8]) {
            
            guard byteValue.count == CommandCompleteParameter.length
                else { return nil }
            
            self.numberOfCommandPackets = byteValue[0]
            self.opcode = UInt16(bytes: (byteValue[1], byteValue[2])).littleEndian
        }
    }
    
    public struct CommandStatusParameter: HCIEventParameter {
        
        public static let event = HCIGeneralEvent.commandStatus
        
        internal static let length = 4
        
        public var status: HCIStatus
        public var ncmd: UInt8
        public var opcode: UInt16
        
        public init?(byteValue: [UInt8]) {
            
            guard byteValue.count == CommandStatusParameter.length
                else { return nil }
            
            let statusByte = byteValue[0]
            
            guard let status = HCIStatus(rawValue: statusByte)
                else { return nil }
            
            self.status = status
            self.ncmd = byteValue[1]
            self.opcode = UInt16(bytes: (byteValue[2], byteValue[3])).littleEndian
        }
    }
    
    public struct RemoteNameRequestCompleteParameter: HCIEventParameter {
        
        public static let event = HCIGeneralEvent.remoteNameRequestComplete
        internal static let length = 255
        
        public var status: HCIStatus
        public var address: Address
        public var name: String
        
        public init?(byteValue: [UInt8]) {
            
            guard byteValue.count == RemoteNameRequestCompleteParameter.length
                else { return nil }
            
            let statusByte = byteValue[0]
            
            guard let status = HCIStatus(rawValue: statusByte)
                else { return nil }
            
            self.status = status
            self.address = Address(bytes: (byteValue[1], byteValue[2], byteValue[3], byteValue[4], byteValue[5], byteValue[6]))
            
            let nameBytes = Array(byteValue[7 ..< HCI.maximumNameLength])
            
            guard let name = String(data: Data(bytes: nameBytes), encoding: .utf8)
                else { return nil }
            
            self.name = name
        }
    }
    
    /// Encryption Change Event
    ///
    /// The Encryption Change event is used to indicate that the change of the encryption mode has been completed.
    ///
    /// This event will occur on both devices to notify the Hosts when Encryption has changed for all connections between the two devices.
    ///
    /// Note: This event shall not be generated if encryption is paused or resumed; during a role switch, for example.
    public struct EncryptionChangeEventParameter: HCIEventParameter {
        
        public static let event = HCIGeneralEvent.encryptionChange
        
        internal static let length: Int = 4
        
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
        
        public init?(byteValue: [UInt8]) {
            
            guard byteValue.count == EncryptionChangeEventParameter.length
                else { return nil }
            
            let statusByte = byteValue[0]
            
            let handle = UInt16(littleEndian: UInt16(bytes: (byteValue[1], byteValue[2])))
            
            let encryptionEnabledByte = byteValue[3]
            
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
    public struct EncryptionKeyRefreshCompleteEventParameter: HCIEventParameter {
        
        public static let event = HCIGeneralEvent.encryptionKeyRefreshComplete // 0x30
        
        internal static let length: Int = 3
        
        public let status: HCIStatus
        
        public let handle: UInt16 // Connection_Handle
        
        public init?(byteValue: [UInt8]) {
            guard byteValue.count == EncryptionKeyRefreshCompleteEventParameter.length
                else { return nil }
            
            let statusByte = byteValue[0]
            
            let handle = UInt16(littleEndian: UInt16(bytes: (byteValue[1], byteValue[2])))
            
            guard let status = HCIStatus(rawValue: statusByte)
                else { return nil }
            
            self.status = status
            self.handle = handle
        }
    }
    
    public struct LowEnergyMetaParameter: HCIEventParameter {
        
        public static let event = HCIGeneralEvent.lowEnergyMeta
        internal static let length = 1 // 1 ... HCI.maximumEventSize
        
        public let subevent: LowEnergyEvent
        public let data: [UInt8]
        
        public init?(byteValue: [UInt8]) {
            
            guard byteValue.count >= LowEnergyMetaParameter.length,
                let subevent = LowEnergyEvent(rawValue: byteValue[0])
                else { return nil }
            
            self.subevent = subevent
            
            if byteValue.count > 1 {
                
                self.data = Array(byteValue.suffix(from: 1))
                
            } else {
                
                self.data = []
            }
        }
    }
}
