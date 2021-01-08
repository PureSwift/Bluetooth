//
//  HCIConnectionRequest.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 8/2/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// Connection Request Event
///
/// The Connection Request event is used to indicate that a new incoming connection is trying to be established. The connection may either be accepted or rejected. If this event is masked away and there is an incoming connection attempt and the BR/EDR Controller is not set to auto-accept this connection attempt, the BR/EDR Controller shall automatically refuse the connection attempt. When the Host receives this event and the link type parameter is ACL, it should respond with either an Accept_Connection_Request or Reject_Connection_Request command before the timer Conn_Accept_Timeout expires. If the link type is SCO or eSCO, the Host should reply with the Accept_Synchronous_Connection_Request or the Reject_Synchronous_Connection_Request command. If the link type is SCO, the Host may respond with Accept_Connection_Request command. If the event is responded to with Accept_Connection_Request command, then the default parameter settings of the Accept_Synchronous_Connection_Request command (see Section 7.1.27 on page 504) should be used by the local Link Manager when negotiating the SCO link parameters. In that case, the Connection Complete event and not the Synchronous Connection Complete event, shall be returned on completion of the connection.
@frozen
public struct HCIConnectionRequest: HCIEventParameter {
    
    public static let event = HCIGeneralEvent.connectionRequest
    
    public static let length: Int = 10
    
    /// BD_ADDR of the device that requests the connection.
    public let address: BluetoothAddress
    
    /// Class of Device for the device, which requests the connection.
    public let classOfDevice: ClassOfDevice
    
    public let linkType: LinkType
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let address = BluetoothAddress(littleEndian: BluetoothAddress(bytes: (data[0], data[1], data[2], data[3], data[4], data[5])))
        
        guard let classOfDevice = ClassOfDevice(data: data.subdataNoCopy(in: 6 ..< 9))
            else { return nil }
        
        guard let linkType = LinkType(rawValue: data[9])
            else { return nil }
        
        self.address = address
        self.classOfDevice = classOfDevice
        self.linkType = linkType
    }
    
}

extension HCIConnectionRequest {
    
    public enum LinkType: UInt8 {
        
        /// SCO connection.
        case sco = 0x00
        
        /// ACL connection (Data Channels).
        case acl = 0x01
        
        /// eSCO Connection requested
        case esco = 0x02
    }
}
