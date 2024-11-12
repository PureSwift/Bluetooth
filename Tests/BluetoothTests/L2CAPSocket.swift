//
//  L2CAPSocket.swift
//  BluetoothTests
//
//  Created by Alsey Coleman Miller on 3/30/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

#if canImport(BluetoothGATT)
import Foundation
@testable import Bluetooth
@testable import BluetoothGATT

internal final class TestL2CAPServer: L2CAPServer {
    
    typealias Data = Foundation.Data
    
    typealias Error = POSIXError
    
    enum Cache {
        
        static let lock = NSLock()
        
        static var pendingClients = [BluetoothAddress: [TestL2CAPSocket]]()
        
        static func queue(client socket: TestL2CAPSocket, server: BluetoothAddress) {
            lock.lock()
            defer { lock.unlock() }
            pendingClients[server, default: []].append(socket)
        }
        
        static func dequeue(server: BluetoothAddress) -> TestL2CAPSocket? {
            lock.lock()
            defer { lock.unlock() }
            guard let socket = pendingClients[server]?.first else {
                return nil
            }
            pendingClients[server]?.removeFirst()
            return socket
        }
        
        static func canAccept(server: BluetoothAddress) -> Bool {
            lock.lock()
            defer { lock.unlock() }
            return pendingClients[server, default: []].isEmpty
        }
    }
    
    let name: String
    
    let address: BluetoothAddress
    
    var status: L2CAPSocketStatus<POSIXError> {
        .init(
            send: false,
            recieve: false,
            accept: Cache.canAccept(server: address)
        )
    }
    
    init(name: String, address: BluetoothAddress) {
        self.name = name
        self.address = address
    }
    
    static func lowEnergyServer(
        address: BluetoothAddress,
        isRandom: Bool,
        backlog: Int
    ) throws(POSIXError) -> TestL2CAPServer {
        return TestL2CAPServer(
            name: "Server",
            address: address
        )
    }
    
    func accept() throws(POSIXError) -> TestL2CAPSocket {
        // dequeue socket
        guard let client = Cache.dequeue(server: address) else {
            throw POSIXError(.EAGAIN)
        }
        let newConnection = TestL2CAPSocket(address: client.address, name: "Server connection")
        // connect sockets
        newConnection.connect(to: client)
        client.connect(to: newConnection)
        return newConnection
    }
    
    func close() {
        
    }
}

/// Test L2CAP socket
internal final class TestL2CAPSocket: L2CAPConnection {
    
    typealias Data = Foundation.Data
        
    typealias Error = POSIXError
    
    static func lowEnergyClient(
        address: BluetoothAddress,
        destination: BluetoothAddress,
        isRandom: Bool
    ) throws(POSIXError) -> TestL2CAPSocket {
        let socket = TestL2CAPSocket(
            address: address,
            name: "Client"
        )
        TestL2CAPServer.Cache.queue(client: socket, server: destination)
        return socket
    }
    
    // MARK: - Properties
    
    let name: String
    
    let address: BluetoothAddress
    
    var status: L2CAPSocketStatus<POSIXError> {
        .init(
            send: target != nil,
            recieve: target != nil && receivedData.isEmpty == false,
            accept: false,
            error: nil
        )
    }
    
    func securityLevel() throws(POSIXError) -> Bluetooth.SecurityLevel {
        _securityLevel
    }
    
    private var _securityLevel: Bluetooth.SecurityLevel = .sdp

    /// Attempts to change the socket's security level.
    func setSecurityLevel(_ securityLevel: SecurityLevel) throws(POSIXError) {
        _securityLevel = securityLevel
    }
    
    /// Target socket.
    private weak var target: TestL2CAPSocket?
    
    fileprivate(set) var receivedData = [Foundation.Data]()
    
    private(set) var cache = [Foundation.Data]()
    
    // MARK: - Initialization
    
    init(
        address: BluetoothAddress = .zero,
        name: String
    ) {
        self.address = address
        self.name = name
    }
    
    // MARK: - Methods
    
    func close() {
        target = nil
        target?.target = nil
    }
    
    /// Write to the socket.
    func send(_ data: Data) throws(POSIXError) {
        
        print("L2CAP Socket: \(name) will send \(data.count) bytes")
        
        guard let target = self.target
            else { throw POSIXError(.ECONNRESET) }
        
        target.receive(data)
    }
    
    /// Reads from the socket.
    func receive(_ bufferSize: Int) throws(POSIXError) -> Data {
        
        print("L2CAP Socket: \(name) will read \(bufferSize) bytes")
        
        guard self.target != nil
            else { throw POSIXError(.ECONNRESET) }
        
        guard self.receivedData.isEmpty == false else {
            throw POSIXError(.EAGAIN)
        }
        
        let data = self.receivedData.removeFirst()
        cache.append(data)
        return data
    }
    
    fileprivate func receive(_ data: Data) {
        receivedData.append(data)
        print("L2CAP Socket: \(name) received \([UInt8](data))")
    }
    
    internal func connect(to socket: TestL2CAPSocket) {
        self.target = socket
    }
}
#endif
