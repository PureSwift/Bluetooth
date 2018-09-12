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
    
    var log: ((String) -> ())?
    
    let name: String
    
    let address: Address
    
    /// Protocol/Service Multiplexer (PSM)
    let protocolServiceMultiplexer: UInt16
    
    /// Channel Identifier (CID)
    ///
    /// L2CAP channel endpoints are identified to their clients by a Channel Identifier (CID).
    /// This is assigned by L2CAP, and each L2CAP channel endpoint on any device has a different CID.
    let channelIdentifier: UInt16
    
    /// The socket's security level.
    private(set) var securityLevel: SecurityLevel = .sdp
    
    /// Attempts to change the socket's security level.
    func setSecurityLevel(_ securityLevel: SecurityLevel) throws {
        
        self.securityLevel = securityLevel
    }
    
    /// Target socket.
    weak var target: TestL2CAPSocket?
    
    private(set) var input = [Data]()
    
    private(set) var cache = [Data]()
    
    init(address: Address = .any,
         name: String = "",
         protocolServiceMultiplexer: UInt16 = UInt16(ATT.PSM.rawValue),
         channelIdentifier: UInt16 = ATT.CID) {
        
        self.address = address
        self.protocolServiceMultiplexer = protocolServiceMultiplexer
        self.channelIdentifier = channelIdentifier
        self.name = name
    }
    
    // MARK: - Methods
    
    /// Write to the socket.
    func send(_ data: Data) throws {
        
        guard let target = self.target
            else { throw POSIXError(code: .ECONNRESET) }
        
        target.input.append(data)
    }
    
    /// Reads from the socket.
    @discardableResult
    func recieve(_ bufferSize: Int) throws -> Data? {
        
        guard let sentData = self.input.popFirst()
            else { return nil }
        
        let readData = Data(sentData.prefix(bufferSize))
        
        cache.append(readData)
        
        return readData
    }
}
