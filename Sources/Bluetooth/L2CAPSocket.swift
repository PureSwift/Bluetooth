//
//  L2CAPSocket.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 3/26/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// L2CAP Socket protocol.
public protocol L2CAPSocketProtocol: AnyObject {
    
    /// Reads from the socket.
    func recieve(_ bufferSize: Int) throws -> Data?
    
    /// Write to the socket.
    func send(_ data: Data) throws
    
    /// The socket's security level.
    var securityLevel: SecurityLevel { get }
    
    /// Attempts to change the socket's security level.
    func setSecurityLevel(_ securityLevel: SecurityLevel) throws
}
