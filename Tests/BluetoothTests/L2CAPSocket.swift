//
//  L2CAPSocket.swift
//  BluetoothTests
//
//  Created by Alsey Coleman Miller on 3/30/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation
import Bluetooth

/// Test L2CAP socket
internal final class TestL2CAPSocket: L2CAPSocketProtocol {
    
    // MARK: - Properties
    
    /// Protocol/Service Multiplexer (PSM)
    let protocolServiceMultiplexer: UInt16
    
    /// Channel Identifier (CID)
    ///
    /// L2CAP channel endpoints are identified to their clients by a Channel Identifier (CID).
    /// This is assigned by L2CAP, and each L2CAP channel endpoint on any device has a different CID.
    let channelIdentifier: UInt16
    
    /// The socket's security level.
    private(set) var securityLevel: SecurityLevel = .low
    
    /// Attempts to change the socket's security level.
    func setSecurityLevel(_ securityLevel: SecurityLevel) throws {
        
        self.securityLevel = securityLevel
    }
    
    /// Target socket.
    weak var target: TestL2CAPSocket?
    
    private(set) var buffer = Data()
    
    init(protocolServiceMultiplexer: UInt16 = UInt16(ATT.PSM.rawValue),
         channelIdentifier: UInt16 = ATT.CID) {
        
        self.protocolServiceMultiplexer = protocolServiceMultiplexer
        self.channelIdentifier = channelIdentifier
    }
    
    // MARK: - Methods
    
    /// Write to the socket.
    func send(_ data: Data) throws {
        
        guard let target = self.target
            else { throw POSIXError(code: .ECONNRESET) }
        
        target.buffer += data
    }
    
    /// Reads from the socket.
    func recieve(_ bufferSize: Int) throws -> Data {
        
        let data = buffer.prefix(bufferSize)
        buffer.suffix(from: data.count - 1)
        return data
    }
    
    
}
