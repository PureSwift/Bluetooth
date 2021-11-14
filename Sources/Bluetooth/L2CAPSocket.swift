//
//  L2CAPSocket.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 3/26/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// L2CAP Socket protocol.
public protocol L2CAPSocket {
    
    /// Write to the socket.
    func send(_ data: Data) async throws
    
    /// Reads from the socket.
    func recieve(_ bufferSize: Int) async throws -> Data
    
    /// Attempts to change the socket's security level.
    func setSecurityLevel(_ securityLevel: SecurityLevel) async throws
    
    /// Get security level
    func securityLevel() async throws -> SecurityLevel
    
    /// Attempt to accept an incoming connection.
    func accept(sleep: UInt64) async throws -> Self
    
    //func canWrite() throws -> Bool
    
    //func canRead() throws -> Bool
}
