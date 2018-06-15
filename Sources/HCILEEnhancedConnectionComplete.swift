//
//  HCILEEnhancedConnectionComplete.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/15/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// LE Enhanced Connection Complete Event
///
/// The event indicates to both of the Hosts forming the connection that a new connection has been created.
public struct HCILEEnhancedConnectionComplete: HCIEventParameter {
    
    public static let event = LowEnergyEvent.enhancedConnectionComplete // 0x0A
    
    public static let length: Int = 30
    
    public let status: HCIStatus
    
    public let connectionHandle: UInt16
    
    public let role: LowEnergyRole
    
    /// Peer Bluetooth address type.
    public let peerAddressType: LowEnergyAddressType // Peer_Address_Type
    
    /// Public Device Address, or Random Device Address, Public Identity Address or
    /// Random (static) Identity Address of the device to be con- nected.
    public let peerAddress: Address
    
    /// Resolvable Private Address being used by the local device for this connection.
    /// This is only valid when the Own_Address_Type (from the HCI_LE_Create_Connection,
    /// HCI_LE_Set_Advertising_Parameters, HCI_LE_Set_Extended_Advertising_Parameters, or
    /// HCI_LE_Extended_Create_Connection commands) is set to 0x02 or 0x03, and the Controller
    /// generated a resolvable private address for the local device using a non-zero local IRK.
    /// For other Own_Address_Type values, the Controller shall return all zeros.
    public let localResolvablePrivateAddress: Address
    
    /// Resolvable Private Address being used by the peer device for this con- nection.
    /// This is only valid for Peer_Address_Type 0x02 and 0x03. For other Peer_Address_Type
    /// values, the Controller shall return all zeros.
    public let peerResolvablePrivateAddress: Address
    
    /// Connection interval used on this connection.
    ///
    /// Range: 0x0006 to 0x0C80
    /// Time = N * 1.25 msec
    /// Time Range: 7.5 msec to 4000 msec.
    public let interval: LowEnergyConnectionInterval
    
    /// Slave latency for the connection in number of connection events.
    /// Range: 0x0000 to 0x01F3
    public let latency: LowEnergyConnectionLatency
    
    /// Connection supervision timeout. Range: 0x000A to 0x0C80
    /// Time = N * 10 ms
    /// Time Range: 100 ms to 32 s
    public let supervisionTimeout: LowEnergySupervisionTimeout
    
    public let masterClockAccuracy: LowEnergyClockAccuracy
    
    public init?(data: Data) {
        guard data.count == type(of: self).length
            else { return nil }
        
        guard let status = HCIStatus(rawValue: data[0])
            else { return nil }
        
        let handle = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))
        
        guard let role = LowEnergyRole(rawValue: data[3])
            else { return nil }
        
        guard let peerAddressType = LowEnergyAddressType(rawValue: data[4])
            else { return nil }
        
        let peerAddress = Address(littleEndian: Address(bytes: (data[5],
                                                                data[6], data[7],
                                                                data[8], data[9],
                                                                data[10])))
        
        let localResolvableprivateAddress = Address(littleEndian: Address(bytes: (data[11],
                                                                                  data[12], data[13],
                                                                                  data[14], data[15],
                                                                                  data[16])))
        
        let peerResolvablePrivateAddress = Address(littleEndian: Address(bytes: (data[17],
                                                                                 data[18], data[19],
                                                                                 data[20], data[21],
                                                                                 data[22])))
        
        let connInternal = LowEnergyConnectionInterval(rawValue: UInt16(littleEndian: UInt16(bytes: (data[23], data[24]))))
        
        guard let latency = LowEnergyConnectionLatency(rawValue: UInt16(littleEndian: UInt16(bytes: (data[25], data[26]))))
            else { return nil }
        
        guard let supervisionTimeout = LowEnergySupervisionTimeout(rawValue: UInt16(littleEndian: UInt16(bytes: (data[27], data[28]))))
            else { return nil }
        
        guard let masterClockAccuracy = LowEnergyClockAccuracy(rawValue: data[29])
            else { return nil }
        
        self.status = status
        self.connectionHandle = handle
        self.role = role
        self.peerAddressType = peerAddressType
        self.peerAddress = peerAddress
        self.localResolvablePrivateAddress = localResolvableprivateAddress
        self.peerResolvablePrivateAddress = peerResolvablePrivateAddress
        self.interval = connInternal
        self.latency = latency
        self.supervisionTimeout = supervisionTimeout
        self.masterClockAccuracy = masterClockAccuracy
    }
}
