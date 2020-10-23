//
//  HCIReadConnectionAcceptTimeout.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

// MARK: - Command

import Foundation

/// Read Connection Accept Timeout Command
///
/// This command reads the value for the Connection Accept Timeout configuration parameter.
public struct HCIReadConnectionAcceptTimeout: HCICommandReturnParameter {
    
    public static let command = HostControllerBasebandCommand.readConnectionAcceptTimeout
    public static let length = ConnectionAcceptTimeout.length
    
    public let timeout: ConnectionAcceptTimeout
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let rawValue = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
        
        guard let timeout = ConnectionAcceptTimeout(rawValue: rawValue)
            else { return nil }
        
        self.timeout = timeout
    }
}
