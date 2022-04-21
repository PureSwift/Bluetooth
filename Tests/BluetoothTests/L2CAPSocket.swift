//
//  L2CAPSocket.swift
//  BluetoothTests
//
//  Created by Alsey Coleman Miller on 3/30/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation
@testable import Bluetooth
@testable import BluetoothGATT

/// Test L2CAP socket
internal final class TestL2CAPSocket { //}: L2CAPSocket {
    
    // MARK: - Properties
    
    var log: ((String) -> ())?
    
    let name: String
    
    let address: BluetoothAddress
    
    /// The socket's security level.
    private var _securityLevel: SecurityLevel = .sdp
    
    /// Attempts to change the socket's security level.
    func setSecurityLevel(_ securityLevel: SecurityLevel) throws {
        _securityLevel = securityLevel
    }
    
    func securityLevel() throws -> SecurityLevel {
        return _securityLevel
    }
    
    /// Target socket.
    weak var target: TestL2CAPSocket?
    
    private(set) var input = [Data]()
    
    private(set) var cache = [Data]()
    
    init(address: BluetoothAddress = .zero,
         name: String = "") {
        
        self.address = address
        self.name = name
    }
    
    // MARK: - Methods
    
    /// Write to the socket.
    func send(_ data: Data) throws {
        
        guard let target = self.target
            else { throw POSIXError(.ECONNRESET) }
        
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
