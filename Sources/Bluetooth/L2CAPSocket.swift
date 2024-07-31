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
    
    /// Socket address
    var address: BluetoothAddress { get }
    
    var event: L2CAPSocketEventStream { get }
    
    /// Write to the socket.
    func send(_ data: Data) async throws
    
    /// Reads from the socket.
    func receive(_ bufferSize: Int) async throws -> Data
    
    /// Attempt to accept an incoming connection.
    func accept() async throws -> Self
    
    /// Attempts to change the socket's security level.
    func setSecurityLevel(_ securityLevel: SecurityLevel) async throws
    
    /// Get security level
    var securityLevel: SecurityLevel { get async throws }
    
    /// Close socket.
    func close() async
    
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
    ) async throws -> Self
}

/// Bluetooth L2CAP Socket Event
public enum L2CAPSocketEvent {
    
    /// New connection
    case connection
    
    /// Pending read
    case read
    
    /// Pending Write
    case write
    
    /// Did read
    case didRead(Int)
    
    /// Did write
    case didWrite(Int)
    
    /// Error ocurred
    case error(Error)
    
    /// Socket closed
    case close
}

public typealias L2CAPSocketEventStream = AsyncStream<L2CAPSocketEvent>
