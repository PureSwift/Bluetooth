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
    
    /// Attempt to accept an incoming connection.
    func accept() async throws -> Self
    
    /// Attempts to change the socket's security level.
    func setSecurityLevel(_ securityLevel: SecurityLevel) async throws
    
    /// Get security level
    func securityLevel() async throws -> SecurityLevel
    
    /// Creates a new socket connected to the remote address specified.
    static func lowEnergyClient(
        address: BluetoothAddress,
        destination: BluetoothAddress,
        isRandom: Bool
    ) async throws -> Self
    
    /// Creates a new server,
    static func lowEnergyServer(
        address: BluetoothAddress,
        isRandom: Bool,
        backlog: Int
    ) throws -> Self
}
