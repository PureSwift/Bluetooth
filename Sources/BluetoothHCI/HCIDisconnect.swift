//
//  HCIDisconnect.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 7/26/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// Disconnect Command
    ///
    /// The Disconnection command is used to terminate an existing connection. The Connection_Handle command parameter indicates which connection is to be disconnected. The Reason command parameter indicates the reason for ending the connection. The remote Controller will receive the Reason command parameter in the Disconnection Complete event. All synchronous connections on a physical link should be disconnected before the ACL connection on the same physical connection is disconnected.
    @discardableResult
    func disconnect(connectionHandle: UInt16,
                    error: HCIError,
                    timeout: HCICommandTimeout = .default) async throws -> HCIDisconnectionComplete {
        
        let disconnect = HCIDisconnect(connectionHandle: connectionHandle, error: error)
        
        return try await deviceRequest(disconnect, HCIDisconnectionComplete.self, timeout: timeout)
    }
}

// MARK: - Command

/// Disconnect Command
///
/// The Disconnection command is used to terminate an existing connection. All synchronous connections on a physical link should be disconnected before the ACL connection on the same physical connection is disconnected.
@frozen
public struct HCIDisconnect: HCICommandParameter {
    
    public static let command = LinkControlCommand.disconnect
    
    /// Connection_Handle for the connection being disconnected.
    public var connectionHandle: UInt16
    
    /// The Reason command parameter indicates the reason for ending the connection. The remote Controller will receive the Reason command parameter in the Disconnection Complete event.
    public var error: HCIError
    
    public init(connectionHandle: UInt16,
                error: HCIError) {
        
        self.connectionHandle = connectionHandle
        self.error = error
    }
    
    public var data: Data {
        
        let connectionBytes = connectionHandle.littleEndian.bytes
        
        return Data([connectionBytes.0, connectionBytes.1, error.rawValue])
    }
}

extension HCIDisconnect {
    
    /// The Reason command parameter indicates the reason for ending the connection. The remote Controller will receive the Reason command parameter in the Disconnection Complete event.
    public struct Reason {
        
        /// Authentication Failure
        public static let authenticationFailure: HCIError = .authenticationFailure
        
        /// Other End Terminated Connection
        public static let otherEndTerminatedConnection: [HCIError] = [
            .remoteUserEndedConnection,
            .remoteLowResources,
            .remotePowerOff
        ]
        
        /// Unsupported Remote Feature
        public static let unsupportedRemoteFeature: HCIError = .unsupportedRemoteFeature
        
        /// Pairing with Unit Key Not Supported
        public static let pairingWithUnitKeyNotSupported: HCIError = .pairingWithUnitKeyNotSupported
        
        /// All the cases of the enum.
        public static let allCases: Set<HCIError> = Set([
            Reason.authenticationFailure,
            Reason.unsupportedRemoteFeature,
            Reason.pairingWithUnitKeyNotSupported]
            + Reason.otherEndTerminatedConnection)
    }
}
