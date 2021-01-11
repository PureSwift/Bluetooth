//
//  HCIConnectionComplete.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 7/31/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// Connection Complete Event
///
/// The Connection Complete event indicates to both of the Hosts forming the connection that a new connection has been established. This event also indicates to the Host, which issued the Create_Connection, or Accept_Connection_ Request or Reject_Connection_Request command and then received a Command Status event, if the issued command failed or was successful.
@frozen
public struct HCIConnectionComplete: HCIEventParameter {
    
    public static let event = HCIGeneralEvent.connectionComplete
    
    public static let length: Int = 11
    
    public let status: HCIStatus
    
    /// Connection_Handle to be used to identify a connection between two BR/ EDR Controllers. The Connection_Handle is used as an identifier for transmitting and receiving voice or data.
    public let handle: UInt16
    
    /// BD_ADDR of the other connected Device forming the connection.
    public let address: BluetoothAddress
    
    public let linkType: LinkType
    
    public let encryption: Encryption
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        guard let status = HCIStatus(rawValue: data[0])
            else { return nil }
        
        let handle = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))
        
        let address = BluetoothAddress(littleEndian: BluetoothAddress(bytes: (data[3], data[4], data[5], data[6], data[7], data[8])))
        
        guard let linkType = LinkType(rawValue: data[9])
            else { return nil }
        
        guard let encryption = Encryption(rawValue: data[10])
            else { return nil }
        
        self.status = status
        self.handle = handle
        self.address = address
        self.linkType = linkType
        self.encryption = encryption
    }
}

extension HCIConnectionComplete {
    
    public enum LinkType: UInt8 {
        
        /// SCO connection.
        case sco = 0x00
        
        /// ACL connection (Data Channels).
        case acl = 0x01
    }
}

extension HCIConnectionComplete {
    
    public enum Encryption: UInt8 {
        
        /// Link level encryption disabled.
        case disabled = 0x00
        
        /// Link level encryption enabled.
        case enabled = 0x01
    }
}
