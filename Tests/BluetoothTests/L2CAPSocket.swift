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
    
    fileprivate(set) var receivedData = Data() {
        
        didSet { if receivedData.isEmpty == false { log?("L2CAP Socket \(name) \([UInt8](receivedData))") } }
    }
    
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
        
        target.receivedData.append(data)
    }
    
    /// Reads from the socket.
    func recieve(_ bufferSize: Int) throws -> Data {
        
        let data = Data(receivedData.prefix(bufferSize))
        
        // slice buffer
        if data.isEmpty == false {
            
            let suffixIndex = data.count
            
            if receivedData.count >= suffixIndex {
                
                receivedData = Data(receivedData.suffix(from: data.count))
                
            } else {
                
                receivedData = Data(receivedData.suffix(from: data.count))
            }
        }
        
        cache.append(data)
        
        return data
    }
}
