//
//  ATTMaximumTransmissionUnitResponse.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

///  Exchange MTU Response
///
/// The *Exchange MTU Response* is sent in reply to a received *Exchange MTU Request*.
public struct ATTMaximumTransmissionUnitResponse: ATTProtocolDataUnit {
    
    /// 0x03 = Exchange MTU Response
    public static let attributeOpcode = ATT.Opcode.maximumTransmissionUnitResponse
    
    internal static let length = 3
    
    /// Server Rx MTU
    ///
    /// Attribute server receive MTU size
    public var serverMTU: UInt16
    
    public init(serverMTU: UInt16) {
        
        self.serverMTU = serverMTU
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let attributeOpcodeByte = data[0]
        
        guard attributeOpcodeByte == type(of: self).attributeOpcode.rawValue
            else { return nil }
        
        let serverMTU = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))
        
        self.serverMTU = serverMTU
    }
    
    public var data: Data {
        
        var bytes = Data(repeating: 0, count: type(of: self).length)
        
        bytes[0] = type(of: self).attributeOpcode.rawValue
        
        let mtuBytes = self.serverMTU.littleEndian.bytes
        
        bytes[1] = mtuBytes.0
        bytes[2] = mtuBytes.1
        
        return bytes
    }
}
