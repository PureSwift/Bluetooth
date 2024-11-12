//
//  L2CAPSocket.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 3/26/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

/// L2CAP Socket protocol.
public protocol L2CAPSocket {
    
    associatedtype Data: DataContainer
    
    associatedtype Error: Swift.Error
    
    /// Socket address
    var address: BluetoothAddress { get }
    
    var event: ((L2CAPSocketEvent<Self.Error>) -> ())? { get set }
    
    /// Write to the socket.
    func send(_ data: Data) throws(Self.Error)
    
    var canSend: Bool { get }
    
    /// Reads from the socket.
    func receive(_ bufferSize: Int) throws(Self.Error) -> Self.Data
    
    var canRecieve: Bool { get }
    
    /// Attempts to change the socket's security level.
    func setSecurityLevel(_ securityLevel: SecurityLevel) throws(Self.Error)
    
    /// Get security level
    //var securityLevel: SecurityLevel { get throws(Self.Error) }
    func securityLevel() throws(Self.Error) -> SecurityLevel
    
    /// Close socket.
    func close()
    
    /// Creates a new socket connected to the remote address specified.
    static func lowEnergyClient(
        address: BluetoothAddress,
        destination: BluetoothAddress,
        isRandom: Bool
    ) throws(Self.Error) -> Self
    
    /// Creates a new server,
    static func lowEnergyServer(
        address: BluetoothAddress,
        isRandom: Bool,
        backlog: Int
    ) throws(Self.Error) -> Self
}

/// Bluetooth L2CAP Socket Event
public enum L2CAPSocketEvent <Error: Swift.Error> {
    
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
