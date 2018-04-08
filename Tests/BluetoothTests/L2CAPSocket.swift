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
    private(set) var securityLevel: SecurityLevel = .sdp
    
    /// Attempts to change the socket's security level.
    func setSecurityLevel(_ securityLevel: SecurityLevel) throws {
        
        self.securityLevel = securityLevel
    }
    
    /// Target socket.
    weak var target: TestL2CAPSocket?
    
    fileprivate(set) var receivedData = Data() {
        
        didSet { print("L2CAP Socket buffer \([UInt8](receivedData))") }
    }
    
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
       
        return data
    }
}

// MARK: - Mocked Data

/// Test L2CAP socket with mocked data.
internal final class MockedL2CAPSocket: L2CAPSocketProtocol {
    
    // MARK: - Properties
    
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
    
    fileprivate(set) var queue = [Data]() {
        
        didSet { print("L2CAP queue: \(queue.count)") }
    }
    
    private(set) var recieved = [Data]()
    
    /// Target socket.
    weak var target: MockedL2CAPSocket?
    
    init(protocolServiceMultiplexer: UInt16 = UInt16(ATT.PSM.rawValue),
         channelIdentifier: UInt16 = ATT.CID) {
        
        self.protocolServiceMultiplexer = protocolServiceMultiplexer
        self.channelIdentifier = channelIdentifier
    }
    
    // MARK: - Methods
    
    /// Write to the socket.
    func send(_ data: Data) throws {
        
        target?.recieved.append(data)
    }
    
    /// Reads from the socket.
    func recieve(_ bufferSize: Int) throws -> Data {
        
        guard let pdu = queue.popFirst()
            else { throw POSIXError(code: .EWOULDBLOCK) }
        
        guard pdu.count <= bufferSize
            else { throw POSIXError(code: .EPIPE) }
        
        return pdu
    }
}

extension MockedL2CAPSocket {
    
    static func from(mock data: [[UInt8]]) -> (server: MockedL2CAPSocket, client: MockedL2CAPSocket) {
        
        let serverSocket = MockedL2CAPSocket()
        let clientSocket = MockedL2CAPSocket()
        
        for pduData in data {
            
            guard let opcodeByte = pduData.first
                else { fatalError("Empty data \(pduData)") }
            
            guard let opcode = ATTOpcode(rawValue: opcodeByte)
                else { fatalError("Invalid opcode \(opcodeByte)") }
            
            switch opcode.type.destination {
                
            case .client:
                
                clientSocket.queue.append(Data(pduData))
                
            case .server:
                
                serverSocket.queue.append(Data(pduData))
            }
        }
        
        return (serverSocket, clientSocket)
    }
}

fileprivate extension ATTOpcodeType {
    
    enum Destination {
        
        case client
        case server
    }
    
    var destination: Destination {
        
        switch self {
            
        case .command,
             .request:
            
            return .server
            
        case .response,
             .confirmation,
             .indication,
             .notification:
            
            return .client
        }
    }
}
