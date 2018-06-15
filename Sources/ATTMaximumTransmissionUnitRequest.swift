//
//  ATTMaximumTransmissionUnitRequest.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// Exchange MTU Request
///
/// The *Exchange MTU Request* is used by the client to inform the server of the client’s maximum receive MTU
/// size and request the server to respond with its maximum receive MTU size.
///
/// - Note: This request shall only be sent once during a connection by the client.
/// The *Client Rx MTU* parameter shall be set to the maximum size of the attribute protocol PDU that the client can receive.
public struct ATTMaximumTransmissionUnitRequest: ATTProtocolDataUnit {
    
    /// 0x02 = Exchange MTU Request
    public static let attributeOpcode = ATT.Opcode.maximumTransmissionUnitRequest
    
    internal static let length = 3
    
    /// Client Rx MTU
    ///
    /// Client receive MTU size
    public var clientMTU: UInt16
    
    public init(clientMTU: UInt16) {
        
        self.clientMTU = clientMTU
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let attributeOpcodeByte = data[0]
        
        guard attributeOpcodeByte == type(of: self).attributeOpcode.rawValue
            else { return nil }
        
        let clientMTU = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))
        
        self.clientMTU = clientMTU
    }
    
    public var data: Data {
        
        var bytes = Data(repeating: 0, count: type(of: self).length)
        
        bytes[0] = type(of: self).attributeOpcode.rawValue
        
        let mtuBytes = self.clientMTU.littleEndian.bytes
        
        bytes[1] = mtuBytes.0
        bytes[2] = mtuBytes.1
        
        return bytes
    }
}
