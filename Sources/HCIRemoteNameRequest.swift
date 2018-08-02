//
//  HCIRemoteNameRequest.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/15/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// HCI Remote Name Request
public struct HCIRemoteNameRequest: HCICommandParameter {
    
    public static let command = LinkControlCommand.remoteNameRequest
    
    internal static let length = 10
    
    public var address: Address
    
    public var pscanRepMode: UInt8
    
    public var pscanMode: UInt8
    
    public var clockOffset: UInt16
    
    public init(address: Address,
                pscanRepMode: UInt8,
                pscanMode: UInt8,
                clockOffset: UInt16) {
        
        self.address = address
        self.pscanRepMode = pscanRepMode
        self.pscanMode = pscanMode
        self.clockOffset = clockOffset
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        self.address = Address(bytes: (data[0], data[1], data[2], data[3], data[4], data[5]))
        
        self.pscanRepMode = data[6]
        self.pscanMode = data[7]
        self.clockOffset = UInt16(littleEndian: UInt16(bytes: (data[8], data[9])))
    }
    
    public var data: Data {
        
        let addressBytes = address.littleEndian.bytes
        
        let clockOffsetBytes = clockOffset.littleEndian.bytes
        
        return Data([addressBytes.0,
                     addressBytes.1,
                     addressBytes.2,
                     addressBytes.3,
                     addressBytes.4,
                     addressBytes.5,
                     pscanRepMode,
                     pscanMode,
                     clockOffsetBytes.0,
                     clockOffsetBytes.1])
    }
}
