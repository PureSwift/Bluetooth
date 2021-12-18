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
    
    func lowEnergyCreateConnection(address peerAddress: BluetoothAddress,
                                   type peerAddressType: LowEnergyAddressType = .public,
                                   ownAddressType: LowEnergyAddressType = .public,
                                   timeout: HCICommandTimeout = .default) async throws -> UInt16 {
        
        let parameters = HCILECreateConnection(
            peerAddressType: peerAddressType,
            peerAddress: peerAddress,
            ownAddressType: ownAddressType
        )
        
        return try await lowEnergyCreateConnection(parameters: parameters, timeout: timeout).handle
    }
    
    func lowEnergyCreateConnection(parameters: HCILECreateConnection,
                                   timeout: HCICommandTimeout = .default) async throws -> HCILEConnectionComplete {
        
        // connect with specified parameters
        let event = try await deviceRequest(parameters,
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
@frozen
public struct HCILECreateConnection: HCICommandParameter { // LE_Create_Connection
    
    public static var command: HCILowEnergyCommand { return .createConnection } // 0x000D
    
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
    public let peerAddress: BluetoothAddress // Peer_Address
    
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
    public let supervisionTimeout: LowEnergySupervisionTimeout
    
    /// Connection Length
    ///
    /// Informative parameters providing the Controller with the expected minimum
    /// and maximum length of the connection needed for this LE connection.
    public let connectionLength: LowEnergyConnectionLength
    
    public init(scanInterval: LowEnergyScanTimeInterval = LowEnergyScanTimeInterval(rawValue: 10)!,
                scanWindow: LowEnergyScanTimeInterval = LowEnergyScanTimeInterval(rawValue: 10)!,
                initiatorFilterPolicy: InitiatorFilterPolicy = .peerAddress,
                peerAddressType: LowEnergyAddressType = .public,
                peerAddress: BluetoothAddress,
                ownAddressType: LowEnergyAddressType = .public,
                connectionInterval: LowEnergyConnectionIntervalRange = .full,
                connectionLatency: LowEnergyConnectionLatency = .zero,
                supervisionTimeout: LowEnergySupervisionTimeout = .max,
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
        
        return Data(self)
    }
}

public extension HCILECreateConnection {
    
    static var length: Int { return 2 + 2 + 1 + 1 + 6 + 1 + 2 + 2 + 2 + 2 + 2 + 2 }
}

// MARK: - DataConvertible

extension HCILECreateConnection: DataConvertible {
    
    var dataLength: Int {
        
        return type(of: self).length
    }
    
    static func += <T: DataContainer> (data: inout T, value: HCILECreateConnection) {
        
        data += value.scanInterval.rawValue.littleEndian
        data += value.scanWindow.rawValue.littleEndian
        data += value.initiatorFilterPolicy.rawValue
        data += value.peerAddressType.rawValue
        data += value.peerAddress.littleEndian
        data += value.ownAddressType.rawValue
        data += value.connectionInterval.rawValue.lowerBound.littleEndian
        data += value.connectionInterval.rawValue.upperBound.littleEndian
        data += value.connectionLatency.rawValue.littleEndian
        data += value.supervisionTimeout.rawValue.littleEndian
        data += value.connectionLength.rawValue.lowerBound.littleEndian
        data += value.connectionLength.rawValue.upperBound.littleEndian
    }
}

// MARK: - Supporting Types

public extension HCILECreateConnection {
    
    /// Used to determine whether the White List is used.
    enum InitiatorFilterPolicy: UInt8 {
        
        /// White list is not used to determine which advertiser to connect to.
        /// `peerAddressType` and `peerAddress` shall be used.
        case peerAddress = 0x00
        
        /// White list is used to determine which advertiser to connect to.
        /// `peerAddressType` and `peerAddress` shall be ignored.
        case whiteList = 0x01
    }
}
