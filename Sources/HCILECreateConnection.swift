//
//  HCILECreateConnection.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    func lowEnergyCreateConnection(address peerAddress: Address,
                                   type peerAddressType: LowEnergyAddressType = .public,
                                   ownAddressType: LowEnergyAddressType = .public,
                                   timeout: HCICommandTimeout = .default) throws -> UInt16 {
        
        let parameters = HCILECreateConnection(peerAddressType: peerAddressType,
                                               peerAddress: peerAddress,
                                               ownAddressType: ownAddressType)
        
        return try lowEnergyCreateConnection(parameters: parameters, timeout: timeout).handle
    }
    
    func lowEnergyCreateConnection(parameters: HCILECreateConnection,
                                   timeout: HCICommandTimeout = .default) throws -> HCILEConnectionComplete {
        
        // connect with specified parameters
        let event = try deviceRequest(parameters,
                                      HCILEConnectionComplete.self,
                                      timeout: timeout)
        
        switch event.status {
            
        case let .error(error):
            throw error
            
        case .success:
            
            return event
        }
    }
    
}

// MARK: - Command

/// LE Create Connection Command
///
/// The LE Create Connection command is used to create a Link Layer connection to a connectable advertiser.
///
/// When the Controller receives the LE Create Connection Command, the Controller sends the Command Status
/// event to the Host. An LE Connection Complete event shall be generated when a connection is created
/// or the connection creation procedure is cancelled.
///
/// - Note: No Command Complete event is sent by the Controller to indicate that this command has been completed.
/// Instead, the LE Connection Complete event indicates that this command has been completed.
///
/// - Warning: The Host shall not issue this command when another `LE Create Connection Command` is pending
/// in the Controller; if this does occur the Controller shall return the Command Disallowed error code shall be used.
public struct HCILECreateConnection: HCICommandParameter { // LE_Create_Connection
    
    public static let command = HCILowEnergyCommand.createConnection // 0x000D
    public static let length = 2 + 2 + 1 + 1 + 6 + 1 + 2 + 2 + 2 + 2 + 2 + 2
    
    public typealias SupervisionTimeout = LowEnergySupervisionTimeout
    
    /// Recommendation from the Host on how long the Controller should scan.
    ///
    /// This is defined as the time interval from when the Controller started
    /// its last LE scan until it begins the subsequent LE scan.
    public let scanInterval: LowEnergyScanTimeInterval // LE_Scan_Interval
    
    /// Recommendation from the Host on how frequently the Controller should scan.
    ///
    /// Amount of time for the duration of the LE scan.
    /// - Note: `scanWindow` shall be less than or equal to `scanInterval`.
    /// If both are set to the same value, scanning should run continuously.
    public let scanWindow: LowEnergyScanTimeInterval // LE_Scan_Window
    
    /// Used to determine whether the White List is used.
    /// If the White List is not used, the Peer_Address_Type and the Peer_Address
    /// parameters specify the address type and address of the advertising device to connect to.
    public let initiatorFilterPolicy: InitiatorFilterPolicy // Initiator_Filter_Policy
    
    /// The address type (Public or Random) of the device to be connected.
    public let peerAddressType: LowEnergyAddressType // Peer_Address_Type
    
    /// Public Device Address or Random Device Address of the device to be connected.
    public let peerAddress: Address // Peer_Address
    
    /// The Link Layer shall set the address in the `CONNECT_REQ` packets
    /// to either the Public Device Address or the Random Device Addressed
    /// based on the `ownAddressType` property.
    public let ownAddressType: LowEnergyAddressType // Own_Address_Type
    
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
    
    public init(scanInterval: LowEnergyScanTimeInterval = LowEnergyScanTimeInterval(10),
                scanWindow: LowEnergyScanTimeInterval = LowEnergyScanTimeInterval(10),
                initiatorFilterPolicy: InitiatorFilterPolicy = .peerAddress,
                peerAddressType: LowEnergyAddressType = .public,
                peerAddress: Address,
                ownAddressType: LowEnergyAddressType = .public,
                connectionInterval: LowEnergyConnectionIntervalRange = .full,
                connectionLatency: LowEnergyConnectionLatency = .zero,
                supervisionTimeout: SupervisionTimeout = .max,
                connectionLength: LowEnergyConnectionLength = .full) {
        
        precondition(scanWindow <= scanInterval, "LE_Scan_Window shall be less than or equal to LE_Scan_Interval")
        precondition(supervisionTimeout.miliseconds > connectionInterval.miliseconds.upperBound, "The Supervision_Timeout in milliseconds shall be larger than the Conn_Interval_Max in milliseconds.")
        
        self.scanInterval = scanInterval
        self.scanWindow = scanWindow
        self.initiatorFilterPolicy = initiatorFilterPolicy
        self.peerAddressType = peerAddressType
        self.peerAddress = peerAddress
        self.ownAddressType = ownAddressType
        self.connectionInterval = connectionInterval
        self.connectionLatency = connectionLatency
        self.supervisionTimeout = supervisionTimeout
        self.connectionLength = connectionLength
    }
    
    public var data: Data {
        
        let scanIntervalBytes = scanInterval.rawValue.littleEndian.bytes
        let scanWindowBytes = scanWindow.rawValue.littleEndian.bytes
        let initiatorFilterPolicyByte = initiatorFilterPolicy.rawValue
        let peerAddressTypeByte = peerAddressType.rawValue
        let peerAddressBytes = peerAddress.littleEndian.bytes
        let ownAddressTypeByte = ownAddressType.rawValue
        let connectionIntervalMinBytes = connectionInterval.rawValue.lowerBound.littleEndian.bytes
        let connectionIntervalMaxBytes = connectionInterval.rawValue.upperBound.littleEndian.bytes
        let connectionLatencyBytes = connectionLatency.rawValue.littleEndian.bytes
        let supervisionTimeoutBytes = supervisionTimeout.rawValue.littleEndian.bytes
        let connectionLengthMinBytes = connectionLength.rawValue.lowerBound.littleEndian.bytes
        let connectionLengthMaxBytes = connectionLength.rawValue.upperBound.littleEndian.bytes
        
        return Data([scanIntervalBytes.0,
                     scanIntervalBytes.1,
                     scanWindowBytes.0,
                     scanWindowBytes.1,
                     initiatorFilterPolicyByte,
                     peerAddressTypeByte,
                     peerAddressBytes.0,
                     peerAddressBytes.1,
                     peerAddressBytes.2,
                     peerAddressBytes.3,
                     peerAddressBytes.4,
                     peerAddressBytes.5,
                     ownAddressTypeByte,
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
    
    /// Used to determine whether the White List is used.
    public enum InitiatorFilterPolicy: UInt8 {
        
        /// White list is not used to determine which advertiser to connect to.
        /// `peerAddressType` and `peerAddress` shall be used.
        case peerAddress
        
        /// White list is used to determine which advertiser to connect to.
        /// `peerAddressType` and `peerAddress` shall be ignored.
        case whiteList
    }
}
