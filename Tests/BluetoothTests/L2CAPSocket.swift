//
//  L2CAPSocket.swift
//  BluetoothTests
//
//  Created by Alsey Coleman Miller on 3/30/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

#if canImport(BluetoothGATT)
import Foundation
import Bluetooth

internal final class TestL2CAPServer: L2CAPServer, Sendable {

    typealias Error = POSIXError

    enum Cache {

        static let lock = NSLock()

        nonisolated(unsafe) static var pendingClients = [BluetoothAddress: [TestL2CAPSocket]]()

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
            return pendingClients[server, default: []].isEmpty == false
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

    deinit {
        close()
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
        let newConnection = TestL2CAPSocket(
            address: client.address,
            destination: self.address,
            name: "Server connection"
        )
        // connect sockets
        newConnection.connect(to: client)
        client.connect(to: newConnection)
        return newConnection
    }

    func close() {

    }
}

/// Test L2CAP socket
internal final class TestL2CAPSocket: L2CAPConnection, @unchecked Sendable {

    typealias Data = Foundation.Data

    typealias Error = POSIXError

    static func lowEnergyClient(
        address: BluetoothAddress,
        destination: BluetoothAddress,
        isRandom: Bool
    ) throws(POSIXError) -> TestL2CAPSocket {
        let socket = TestL2CAPSocket(
            address: address,
            destination: destination,
            name: "Client"
        )
        TestL2CAPServer.Cache.queue(client: socket, server: destination)
        return socket
    }

    // MARK: - Properties

    let name: String

    let address: BluetoothAddress

    let destination: Bluetooth.BluetoothAddress

    var status: L2CAPSocketStatus<POSIXError> {
        lock.lock()
        defer { lock.unlock() }
        return .init(
            send: _target != nil,
            recieve: _target != nil && _receivedData.isEmpty == false,
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

    /// Serializes access to `_target`, `_receivedData`, and `cache`, all of which are
    /// read and mutated from different threads (the `GATTServer.run()` polling loop and
    /// the thread issuing `send(_:)`/`connect(to:)`/`close()`).
    private let lock = NSLock()

    /// Target socket.
    private weak var _target: TestL2CAPSocket?

    fileprivate var _receivedData = [Data]()

    private var _cache = [Data]()

    fileprivate(set) var receivedData: [Data] {
        get {
            lock.lock()
            defer { lock.unlock() }
            return _receivedData
        }
        set {
            lock.lock()
            defer { lock.unlock() }
            _receivedData = newValue
        }
    }

    private(set) var cache: [Data] {
        get {
            lock.lock()
            defer { lock.unlock() }
            return _cache
        }
        set {
            lock.lock()
            defer { lock.unlock() }
            _cache = newValue
        }
    }

    // MARK: - Initialization

    init(
        address: BluetoothAddress = .zero,
        destination: Bluetooth.BluetoothAddress,
        name: String
    ) {
        self.address = address
        self.destination = destination
        self.name = name
    }

    deinit {
        close()
    }

    // MARK: - Methods

    func close() {
        lock.lock()
        let oldTarget = _target
        _target = nil
        lock.unlock()
        oldTarget?.disconnect()
    }

    private func disconnect() {
        lock.lock()
        _target = nil
        lock.unlock()
    }

    /// Write to the socket.
    func send(_ data: Data) throws(POSIXError) {

        print("L2CAP Socket: \(name) will send \(data.count) bytes")

        lock.lock()
        let target = _target
        lock.unlock()

        guard let target
        else { throw POSIXError(.ECONNRESET) }

        target.receive(data)
    }

    /// Reads from the socket.
    func receive(_ bufferSize: Int) throws(POSIXError) -> Data {

        print("L2CAP Socket: \(name) will read \(bufferSize) bytes")

        lock.lock()
        let hasTarget = _target != nil
        guard hasTarget else {
            lock.unlock()
            throw POSIXError(.ECONNRESET)
        }

        guard _receivedData.isEmpty == false else {
            lock.unlock()
            throw POSIXError(.EAGAIN)
        }

        let data = _receivedData.removeFirst()
        _cache.append(data)
        lock.unlock()
        return data
    }

    fileprivate func receive(_ data: Data) {
        lock.lock()
        _receivedData.append(data)
        lock.unlock()
        print("L2CAP Socket: \(name) received \([UInt8](data))")
    }

    internal func connect(to socket: TestL2CAPSocket) {
        lock.lock()
        _target = socket
        lock.unlock()
    }
}
#endif
