//
//  HCIConnectionPacketTypeChange.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 8/17/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// The Connection Packet Type Changed event is used to indicate that the process has completed of the Link Manager changing which packet types can be used for the connection. This allows current connections to be dynamically modified to support different types of user data. The Packet_Type event parameter specifies which packet types the Link Manager can use for the connection identified by the Connection_Handle event parameter for sending L2CAP data or voice. The Packet_Type event parameter does not decide which packet types the LM is allowed to use for sending LMP PDUs.
@frozen
public struct HCIConnectionPacketTypeChange: HCIEventParameter {
    
    public static let event = HCIGeneralEvent.connectionPacketTypeChanged
    
    public static let length: Int = 5
    
    public let status: HCIStatus
    
    public let connectionHandle: UInt16
    
    public let packetType: UInt16
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        guard let status = HCIStatus(rawValue: data[0])
            else { return nil }
        
        let connectionHandle = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))
        
        let packetType = UInt16(littleEndian: UInt16(bytes: (data[3], data[4])))
        
        self.status = status
        self.connectionHandle = connectionHandle
        self.packetType = packetType
    }
}
