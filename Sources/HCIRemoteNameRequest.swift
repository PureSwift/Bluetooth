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
    
    public var address = Address()
    
    public var pscanRepMode: UInt8 = 0
    
    public var pscanMode: UInt8 = 0
    
    public var clockOffset: UInt16 = 0
    
    public init() { }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        self.address = Address(bytes: (data[0], data[1], data[2], data[3], data[4], data[5]))
        
        self.pscanRepMode = data[6]
        self.pscanMode = data[7]
        self.clockOffset = UInt16(bytes: (data[8], data[9])).littleEndian
    }
    
    public var data: Data {
        
        let address = self.address.bytes
        
        let clockOffsetBytes = clockOffset.littleEndian.bytes
        
        return Data([address.0, address.1, address.2, address.3, address.4, address.5, pscanRepMode, pscanMode, clockOffsetBytes.0, clockOffsetBytes.1])
    }
}
