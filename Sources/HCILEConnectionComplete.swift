//
//  HCILEConnectionComplete.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// LE Connection Complete Event
///
/// The LE Connection Complete event indicates to both of the Hosts forming the connection
/// that a new connection has been created. Upon the creation of the connection a
/// `Connection_Handle` shall be assigned by the Controller, and passed to the Host in this event.
/// If the connection establishment fails this event shall be provided to the Host that had issued
/// the LE Create Connection command.
///
/// This event indicates to the Host which issued a LE Create Connection command
/// and received a Command Status event if the connection establishment failed or was successful.
///
/// The `masterClockAccuracy` parameter is only valid for a slave.
/// On a master, this parameter shall be set to 0x00.
public struct HCILEConnectionComplete: HCIEventParameter {
    
    public static let event = LowEnergyEvent.connectionComplete // 0x01
    public static let length = 18
    
    /// Connection supervision timeout.
    ///
    /// Range: 0x000A to 0x0C80
    /// Time = N * 10 msec
    /// Time Range: 100 msec to 32 seconds
    public typealias SupervisionTimeout = LowEnergySupervisionTimeout
    
    public typealias Status = HCIStatus
    
    /// `0x00` if Connection successfully completed.
    /// `HCIError` value otherwise.
    public let status: Status
    
    /// Connection Handle
    ///
    /// Connection Handle to be used to identify a connection between two Bluetooth devices.
    /// The handle is used as an identifier for transmitting and receiving data.
    ///
    /// Range: 0x0000-0x0EFF (0x0F00 - 0x0FFF Reserved for future use)
    ///
    /// Size: 2 Octets (12 bits meaningful)
    public let handle: UInt16 // Connection_Handle
    
    /// Connection role (master or slave).
    public let role: LowEnergyRole // Role
    
    /// Peer Bluetooth address type.
    public let peerAddressType: LowEnergyAddressType // Peer_Address_Type
    
    /// Public Device Address or Random Device Address of the peer device.
    public let peerAddress: Address
    
    /// Connection interval used on this connection.
    ///
    /// Range: 0x0006 to 0x0C80
    /// Time = N * 1.25 msec
    /// Time Range: 7.5 msec to 4000 msec.
    public let interval: LowEnergyConnectionInterval
    
    /// Connection latency for this connection.
    ///
    /// Range: 0x0006 to 0x0C80
    /// Time = N * 1.25 msec
    /// Time Range: 7.5 msec to 4000 msec.
    public let latency: LowEnergyConnectionInterval
    
    /// Connection supervision timeout.
    ///
    /// Range: 0x000A to 0x0C80
    /// Time = N * 10 msec
    /// Time Range: 100 msec to 32 seconds
    public let supervisionTimeout: SupervisionTimeout
    
    /// The `masterClockAccuracy` parameter is only valid for a slave.
    ///
    /// On a master, this parameter shall be set to 0x00.
    public let masterClockAccuracy: LowEnergyClockAccuracy // Master_Clock_Accuracy
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let statusByte = data[0]
        
        let handle = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))
        
        let roleByte = data[3]
        
        let peerAddressTypeByte = data[4]
        
        let peerAddress = Address(littleEndian:
            Address(bytes: (data[5],
                            data[6],
                            data[7],
                            data[8],
                            data[9],
                            data[10])))
        
        let intervalRawValue = UInt16(littleEndian: UInt16(bytes: (data[11], data[12])))
        
        let latencyRawValue = UInt16(littleEndian: UInt16(bytes: (data[13], data[14])))
        
        let supervisionTimeoutRaw = UInt16(littleEndian: UInt16(bytes: (data[15], data[16])))
        
        let masterClockAccuracyByte = data[17]
        
        // Parse enums and values ranges
        guard let status = Status(rawValue: statusByte),
            let role = LowEnergyRole(rawValue: roleByte),
            let peerAddressType = LowEnergyAddressType(rawValue: peerAddressTypeByte),
            let supervisionTimeout = SupervisionTimeout(rawValue: supervisionTimeoutRaw),
            let masterClockAccuracy = LowEnergyClockAccuracy(rawValue: masterClockAccuracyByte)
            else { return nil }
        
        self.status = status
        self.handle = handle
        self.role = role
        self.peerAddressType = peerAddressType
        self.peerAddress = peerAddress
        self.interval = LowEnergyConnectionInterval(rawValue: intervalRawValue)
        self.latency = LowEnergyConnectionInterval(rawValue: latencyRawValue)
        self.supervisionTimeout = supervisionTimeout
        self.masterClockAccuracy = masterClockAccuracy
    }
}
