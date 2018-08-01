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
    func disconnect(connectionHandle: UInt16,
                    reason: HCIDisconnect.Reason,
                    timeout: HCICommandTimeout = .default) throws -> HCIDisconnectionComplete {
        
        let disconnect = HCIDisconnect(connectionHandle: connectionHandle, reason: reason)
        
        return try deviceRequest(disconnect, HCIDisconnectionComplete.self, timeout: timeout)
    }
}

// MARK: - Command

/// Disconnect Command
///
/// The Disconnection command is used to terminate an existing connection. All synchronous connections on a physical link should be disconnected before the ACL connection on the same physical connection is disconnected.
public struct HCIDisconnect: HCICommandParameter {
    
    public static let command = LinkControlCommand.disconnect
    
    /// Connection_Handle for the connection being disconnected.
    public var connectionHandle: UInt16
    
    /// The Reason command parameter indicates the reason for ending the connection. The remote Controller will receive the Reason command parameter in the Disconnection Complete event.
    public var reason: Reason
    
    public init(connectionHandle: UInt16, reason: Reason) {
        
        self.connectionHandle = connectionHandle
        self.reason = reason
    }
    
    public var data: Data {
        
        let bytes = connectionHandle.littleEndian.bytes
        
        return Data([bytes.0, bytes.1, reason.rawValue])
    }
}

extension HCIDisconnect {
    
    /// The Reason command parameter indicates the reason for ending the connection. The remote Controller will receive the Reason command parameter in the Disconnection Complete event.
    public struct Reason: RawRepresentable {
        
        /// Authentication Failure
        public static let authenticationFailure = Reason(0x05)
        
        /// Other End Terminated Connection
        public static let otherEndTerminatedConnection: CountableClosedRange<UInt8> = (0x13 ... 0x15)
        
        /// Unsupported Remote Feature
        public static let unsupportedRemoteFeature = Reason(0x1a)
        
        /// Pairing with Unit Key Not Supported
        public static let pairingWwithUnitKeyNotSupported = Reason(0x29)
        
        public var rawValue: UInt8
        
        public init?(rawValue: UInt8) {
            
            guard type(of: self).allValues.contains(rawValue)
                else { return nil }
            
            self.rawValue = rawValue
        }
        
        private init(_ unsafe: UInt8) {
            
            self.rawValue = unsafe
        }
        
        private static var allValues: [UInt8] {
            
            return [Reason.authenticationFailure.rawValue,
                    Reason.unsupportedRemoteFeature.rawValue,
                    Reason.pairingWwithUnitKeyNotSupported.rawValue] + Array(Reason.otherEndTerminatedConnection)
        }
    }
}
