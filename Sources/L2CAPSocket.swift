//
//  L2CAPSocket.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 3/26/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// L2CAP Socket protocol.
public protocol L2CAPSocketProtocol {
    
    /// Protocol/Service Multiplexer (PSM)
    var protocolServiceMultiplexer: UInt16 { get }
    
    /// Channel Identifier (CID)
    ///
    /// L2CAP channel endpoints are identified to their clients by a Channel Identifier (CID).
    /// This is assigned by L2CAP, and each L2CAP channel endpoint on any device has a different CID.
    var channelIdentifier: UInt16 { get }
    
    /// Reads from the socket.
    func recieve(_ bufferSize: Int) throws -> Data
    
    /// Write to the socket.
    func send(_ data: Data) throws
    
    /// The socket's security level.
    var securityLevel: SecurityLevel { get }
    
    /// Attempts to change the socket's security level.
    func setSecurityLevel(_ securityLevel: SecurityLevel) throws
}
