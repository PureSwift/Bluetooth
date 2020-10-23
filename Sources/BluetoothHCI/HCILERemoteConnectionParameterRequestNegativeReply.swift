//
//  HCILERemoteConnectionParameterRequestNegativeReply.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// LE Remote Connection Parameter Request Negative Reply Command
    ///
    /// Both the master Host and the slave Host use this command to reply to the HCI
    /// LE Remote Connection Parameter Request event. This indicates that the Host
    /// has rejected the remote device’s request to change connection parameters.
    /// The reason for the rejection is given in the Reason parameter.
    func lowEnergyRemoteConnectionParameterRequestNegativeReply(connectionHandle: UInt16,
                                                                reason: UInt8,
                                                                timeout: HCICommandTimeout = .default) throws -> UInt16 {
        
        let parameters = HCILERemoteConnectionParameterRequestNegativeReply(connectionHandle: connectionHandle,
                                                                                                reason: reason)
        
        let returnParameters = try deviceRequest(parameters, HCILERemoteConnectionParameterRequestNegativeReplyReturn.self, timeout: timeout)
        
        return returnParameters.connectionHandle
    }
}

// MARK: - Command

/// LE Remote Connection Parameter Request Negative Reply Command
///
/// Both the master Host and the slave Host use this command to reply to the HCI
/// LE Remote Connection Parameter Request event. This indicates that the Host
/// has rejected the remote device’s request to change connection parameters.
/// The reason for the rejection is given in the Reason parameter.
public struct HCILERemoteConnectionParameterRequestNegativeReply: HCICommandParameter {
    
    public static let command = HCILowEnergyCommand.remoteConnectionParameterRequestNegativeReply //0x0021
    
    public var connectionHandle: UInt16
    
    public var reason: UInt8
    
    public init(connectionHandle: UInt16,
                reason: UInt8) {
        
        self.connectionHandle = connectionHandle
        self.reason = reason
    }
    
    public var data: Data {
        
        let connectionHandleBytes = connectionHandle.littleEndian.bytes
        
        return Data([
            connectionHandleBytes.0,
            connectionHandleBytes.1,
            reason
            ])
    }
}

// MARK: - Return parameter

/// LE Remote Connection Parameter Request Negative Reply Command
///
/// Both the master Host and the slave Host use this command to reply to the HCI
/// LE Remote Connection Parameter Request event. This indicates that the Host
/// has rejected the remote device’s request to change connection parameters.
/// The reason for the rejection is given in the Reason parameter.
public struct HCILERemoteConnectionParameterRequestNegativeReplyReturn: HCICommandReturnParameter {
    
    public static let command = HCILowEnergyCommand.remoteConnectionParameterRequestNegativeReply //0x0021
    
    public static let length: Int = 2
    
    /// Connection_Handle
    /// Range 0x0000-0x0EFF (all other values reserved for future use)
    public let connectionHandle: UInt16 // Connection_Handle
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        connectionHandle = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
    }
}
