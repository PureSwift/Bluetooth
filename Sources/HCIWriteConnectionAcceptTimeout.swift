//
//  HCIWriteConnectionAcceptTimeout.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 Write Connection Accept Timeout Command
 
 This command writes the value for the Connection Accept Timeout configuration parameter.
 */
public struct HCIWriteConnectionAcceptTimeout: HCICommandParameter {
    
    public static let command = HostControllerBasebandCommand.writeConnectionAcceptTimeout
    
    public var timeout: ConnectionAcceptTimeout
    
    public init(timeout: ConnectionAcceptTimeout) {
        
        self.timeout = timeout
    }
    
    public var data: Data {
        
        let timeoutBytes = timeout.rawValue.littleEndian.bytes
        
        return Data([timeoutBytes.0, timeoutBytes.1])
    }
}
