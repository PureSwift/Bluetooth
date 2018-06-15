//
//  HCILEUpdateConnection.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// LE Connection Update Command
    ///
    /// The LE_Connection_Update command is used to change the Link Layer connection parameters of a connection.
    /// This command may be issued on both the master and slave.
    func updateLowEnergyConnection(handle: UInt16,
                                   connectionInterval: LowEnergyConnectionIntervalRange = .full,
                                   connectionLatency: LowEnergyConnectionLatency = .zero,
                                   supervisionTimeout: LowEnergySupervisionTimeout = .max,
                                   connectionLength: LowEnergyConnectionLength = .full,
                                   timeout: HCICommandTimeout = .default) throws {
        
        let parameters = HCILEUpdateConnection(connectionHandle: handle,
                                               connectionInterval: connectionInterval,
                                               connectionLatency: connectionLatency,
                                               supervisionTimeout: supervisionTimeout,
                                               connectionLength: connectionLength)
        
        try deviceRequest(parameters, timeout: timeout)
    }
    
}

// MARK: - Command

/// LE Connection Update Command
///
/// The LE_Connection_Update command is used to change the Link Layer connection parameters of a connection. This command may be issued on both the master and slave.
///
/// The Conn_Interval_Min and Conn_Interval_Max parameters are used to define the minimum and maximum allowed connection interval.
/// The Conn_Interval_Min parameter shall not be greater than the Conn_Interval_Max parameter.
///
/// The Conn_Latency parameter shall define the maximum allowed connection latency.
///
/// The Supervision_Timeout parameter shall define the link supervision timeout for the LE link.
/// The Supervision_Timeout in milliseconds shall be larger than (1 + Conn_Latency) * Conn_Interval_Max * 2, where Conn_Interval_Max is given in milliseconds.
///
/// The Minimum_CE_Length and Maximum_CE_Length are information parameters providing the Controller with a hint about the expected minimum and maximum length
///  of the connection events. The Minimum_CE_Length shall be less than or equal to the Maximum_CE_Length.
///
///  The actual parameter values selected by the Link Layer may be different from the parameter values provided by the Host through this command.
public struct HCILEUpdateConnection: HCICommandParameter { // HCI_LE_Connection_Update
    
    public typealias SupervisionTimeout = LowEnergySupervisionTimeout
    
    public static let command = HCILowEnergyCommand.connectionUpdate //0x0013
    
    public let connectionHandle: UInt16 //Connection_Handle
    
    /// Value for the connection event interval.
    ///
    /// Defines the minimum and maximum allowed connection interval.
    public let connectionInterval: LowEnergyConnectionIntervalRange  // Conn_Interval_Min, Conn_Interval_Max
    
    /// Slave latency for the connection in number of connection events.
    ///
    /// Defines the maximum allowed connection latency.
    public let connectionLatency: LowEnergyConnectionLatency
    
    /// Supervision timeout for the LE Link.
    ///
    /// Defines the link supervision timeout for the connection.
    ///
    /// - Note: The `supervisionTimeout` in milliseconds shall be
    /// larger than the `connectionInterval.miliseconds.upperBound` in milliseconds.
    public let supervisionTimeout: SupervisionTimeout
    
    /// Connection Length
    ///
    /// Informative parameters providing the Controller with the expected minimum
    /// and maximum length of the connection needed for this LE connection.
    public let connectionLength: LowEnergyConnectionLength
    
    public init(connectionHandle: UInt16,
                connectionInterval: LowEnergyConnectionIntervalRange = .full,
                connectionLatency: LowEnergyConnectionLatency = .zero,
                supervisionTimeout: SupervisionTimeout = .max,
                connectionLength: LowEnergyConnectionLength = .full) {
        
        precondition(supervisionTimeout.miliseconds > connectionInterval.miliseconds.upperBound, "The Supervision_Timeout in milliseconds shall be larger than the Conn_Interval_Max in milliseconds.")
        
        self.connectionHandle = connectionHandle
        self.connectionInterval = connectionInterval
        self.connectionLatency = connectionLatency
        self.supervisionTimeout = supervisionTimeout
        self.connectionLength = connectionLength
    }
    
    public var data: Data {
        let connectionIntervalMinBytes = connectionInterval.rawValue.lowerBound.littleEndian.bytes
        let connectionIntervalMaxBytes = connectionInterval.rawValue.upperBound.littleEndian.bytes
        let connectionLatencyBytes = connectionLatency.rawValue.littleEndian.bytes
        let supervisionTimeoutBytes = supervisionTimeout.rawValue.littleEndian.bytes
        let connectionLengthMinBytes = connectionLength.rawValue.lowerBound.littleEndian.bytes
        let connectionLengthMaxBytes = connectionLength.rawValue.upperBound.littleEndian.bytes
        
        return Data([connectionHandle.littleEndian.bytes.0,
                     connectionHandle.littleEndian.bytes.1,
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
                     connectionLengthMaxBytes.1])
    }
}
