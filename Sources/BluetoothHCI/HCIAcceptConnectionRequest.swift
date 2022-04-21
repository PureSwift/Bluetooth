//
//  HCIAcceptConnectionRequest.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 8/2/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

public extension BluetoothHostControllerInterface {
    
    /// Accept Connection Command
    ///
    /// The Accept_Connection_Request command is used to accept a new incoming connection request. The Accept_Connection_Request command shall only be issued after a Connection Request event has occurred. The Connection Request event will return the BD_ADDR of the device which is requesting the connection. This command will cause the Link Manager to create a connection to the BR/EDR Controller, with the BD_ADDR specified by the command parameters. The Link Manager will determine how the new connection will be established. This will be determined by the current state of the device, its piconet, and the state of the device to be connected. The Role command parameter allows the Host to specify if the Link Manager shall request a role switch and become the Master for this connection. This is a preference and not a requirement. If the Role Switch fails then the connection will still be accepted, and the Role Discovery Command will reflect the current role.
    func acceptConnection(address: BluetoothAddress,
                          role: HCIAcceptConnectionRequest.Role,
                          timeout: HCICommandTimeout = .default) async throws {
        
        let acceptConnection = HCIAcceptConnectionRequest(address: address, role: role)
        
        let commandStatus = try await deviceRequest(acceptConnection, HCICommandStatus.self, timeout: timeout)
        
        switch commandStatus.status {
        case let .error(error):
            throw error
        case .success:
            break
        }
    }
}

// MARK: - Command

/// Accept Connection Command
///
/// The Accept_Connection_Request command is used to accept a new incoming connection request. The Accept_Connection_Request command shall only be issued after a Connection Request event has occurred. The Connection Request event will return the BD_ADDR of the device which is requesting the connection. This command will cause the Link Manager to create a connection to the BR/EDR Controller, with the BD_ADDR specified by the command parameters. The Link Manager will determine how the new connection will be established. This will be determined by the current state of the device, its piconet, and the state of the device to be connected. The Role command parameter allows the Host to specify if the Link Manager shall request a role switch and become the Master for this connection. This is a preference and not a requirement. If the Role Switch fails then the connection will still be accepted, and the Role Discovery Command will reflect the current role.
///
/// - Note: The Link Manager may terminate the connection if it would be low on resources if the role switch fails. The decision to accept a connection must be completed before the connection accept timeout expires on the local Bluetooth Module.
///
/// - Note: When accepting synchronous connection request, the Role parameter is not used and will be ignored by the BR/EDR Controller.
@frozen
public struct HCIAcceptConnectionRequest: HCICommandParameter {
    
    public static let command = LinkControlCommand.acceptConnection
    
    /// BD_ADDR of the Device to reject the connection from.
    public var address: BluetoothAddress
    
    public var role: Role
    
    public init(address: BluetoothAddress, role: Role) {
        
        self.address = address
        self.role = role
    }
    
    public var data: Data {
        
        let addressBytes = address.littleEndian.bytes
        
        return Data([addressBytes.0,
                     addressBytes.1,
                     addressBytes.2,
                     addressBytes.3,
                     addressBytes.4,
                     addressBytes.5,
                     role.rawValue])
    }
}

public extension HCIAcceptConnectionRequest {
    
    enum Role: UInt8 {
        
        /// Become the Master for this connection. The LM will perform the role switch.
        case master = 0x00
        
        /// Remain the Slave for this connection. The LM will NOT perform the role switch.
        case slave = 0x01
    }
}
