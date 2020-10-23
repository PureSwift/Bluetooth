//
//  HCILERemoteConnectionParameterRequestReply.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// LE Remote Connection Parameter Request Reply Command
    ///
    /// Both the master Host and the slave Host use this command to reply to the HCI
    /// LE Remote Connection Parameter Request event. This indicates that the Host
    /// has accepted the remote device’s request to change connection parameters.
    func lowEnergyRemoteConnectionParameterRequestReply(connectionHandle: UInt16,
                                                        interval: LowEnergyConnectionIntervalRange,
                                                        latency: LowEnergyConnectionLatency,
                                                        timeOut: LowEnergySupervisionTimeout,
                                                        length: LowEnergyConnectionLength,
                                                        timeout: HCICommandTimeout = .default) throws -> UInt16 {
        
        let parameters = HCILERemoteConnectionParameterRequestReply(connectionHandle: connectionHandle,
                                                                    interval: interval,
                                                                    latency: latency,
                                                                    timeOut: timeOut,
                                                                    length: length)
        
        let returnParameters = try deviceRequest(parameters, HCILERemoteConnectionParameterRequestReplyReturn.self, timeout: timeout)
        
        return returnParameters.connectionHandle
    }
}

// MARK: - Command

/// LE Remote Connection Parameter Request Reply Command
///
/// Both the master Host and the slave Host use this command to reply to the HCI
/// LE Remote Connection Parameter Request event. This indicates that the Host
/// has accepted the remote device’s request to change connection parameters.
public struct HCILERemoteConnectionParameterRequestReply: HCICommandParameter {
    
    public static let command = HCILowEnergyCommand.remoteConnectionParameterRequestReply //0x0020
    
    public var connectionHandle: UInt16
    
    public var interval: LowEnergyConnectionIntervalRange
    
    public var latency: LowEnergyConnectionLatency
    
    public var timeOut: LowEnergySupervisionTimeout
    
    public var length: LowEnergyConnectionLength
    
    public init(connectionHandle: UInt16,
                interval: LowEnergyConnectionIntervalRange,
                latency: LowEnergyConnectionLatency,
                timeOut: LowEnergySupervisionTimeout,
                length: LowEnergyConnectionLength) {
        
        self.connectionHandle = connectionHandle
        self.interval = interval
        self.latency = latency
        self.timeOut = timeOut
        self.length = length
    }
    
    public var data: Data {
        
        let connectionHandleBytes = connectionHandle.littleEndian.bytes
        let connectionIntervalMinBytes = interval.rawValue.lowerBound.littleEndian.bytes
        let connectionIntervalMaxBytes = interval.rawValue.upperBound.littleEndian.bytes
        let connectionLatencyBytes = latency.rawValue.littleEndian.bytes
        let supervisionTimeoutBytes = timeOut.rawValue.littleEndian.bytes
        let connectionLengthMinBytes = length.rawValue.lowerBound.littleEndian.bytes
        let connectionLengthMaxBytes = length.rawValue.upperBound.littleEndian.bytes
        
        return Data([
            connectionHandleBytes.0,
            connectionHandleBytes.1,
            connectionIntervalMinBytes.0,
            connectionIntervalMinBytes.1,
            connectionIntervalMaxBytes.0,
            connectionIntervalMaxBytes.1,
            connectionLatencyBytes.0,
            connectionLatencyBytes.1,
            supervisionTimeoutBytes.0,
            supervisionTimeoutBytes.1,
            connectionLengthMinBytes.0,
            connectionLengthMinBytes.1,
            connectionLengthMaxBytes.0,
            connectionLengthMaxBytes.1
            ])
    }
}

// MARK: - Return parameter

/// LE Remote Connection Parameter Request Reply Command
///
/// Both the master Host and the slave Host use this command to reply to the HCI
/// LE Remote Connection Parameter Request event. This indicates that the Host
/// has accepted the remote device’s request to change connection parameters.
public struct HCILERemoteConnectionParameterRequestReplyReturn: HCICommandReturnParameter {
    
    public static let command = HCILowEnergyCommand.remoteConnectionParameterRequestReply //0x0020
    
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
