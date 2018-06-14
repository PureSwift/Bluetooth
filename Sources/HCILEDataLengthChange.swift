//
//  HCILEDataLengthChange.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// LE Data Length Change Event
///
/// event notifies the Host of a change to either the maximum Payload length or the maximum transmission time of packets
/// in either direction. The values reported are the maximum that will actually be used on the connection following the change,
/// except that on the LE Coded PHY a packet taking up to 2704 μs to transmit may be sent even though the corresponding
/// parameter has a lower value.
public struct HCILEDataLengthChange: HCIEventParameter {
    
    public static let event = LowEnergyEvent.dataLengthChange // 0x07
    
    public static let length: Int = 10
    
    public let handle: UInt16 // Connection_Handle
    
    /// The maximum number of payload octets in a Link Layer packet that the local Controller will send on this connection
    /// (connEffectiveMaxTxOctets defined in [Vol 6] Part B, Section 4.5.10).
    /// onnInitialMaxTxOctets - the value of connMaxTxOctets that the Controller will use for a new connection.
    /// Range 0x001B-0x00FB (all other values reserved for future use)
    public let maxTxOctets: UInt16
    
    /// The maximum time that the local Controller will take to send a Link Layer packet on this connection
    /// (connEffectiveMaxTxTime defined in [Vol 6] Part B, Section 4.5.10).
    /// connEffectiveMaxTxTime - equal to connEffectiveMaxTxTimeUncoded while the connection is on an LE Uncoded PHY
    /// and equal to connEffectiveMaxTxTimeCoded while the connection is on the LE Coded PHY.
    public let maxTxTime: UInt16
    
    /// The maximum number of payload octets in a Link Layer packet that the local Controller expects to receive on
    /// this connection (connEffectiveMaxRxOctets defined in [Vol 6] Part B, Section 4.5.10).
    /// connEffectiveMaxRxOctets - the lesser of connMaxRxOctets and connRemoteMaxTxOctets.
    public let maxRxOctets: UInt16
    
    /// The maximum time that the local Controller expects to take to receive a Link Layer packet on this
    /// connection (connEffectiveMaxRxTime defined in [Vol 6] Part B, Section 4.5.10).
    /// connEffectiveMaxRxTime - equal to connEffectiveMaxRxTimeUncoded while the connection is on an LE Uncoded PHY
    /// and equal to connEffectiveMaxRxTimeCoded while the connection is on the LE Coded PHY.
    public let maxRxTime: UInt16
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let handle = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
        let maxTxOctets = UInt16(littleEndian: UInt16(bytes: (data[2], data[3])))
        let maxTxTime = UInt16(littleEndian: UInt16(bytes: (data[4], data[5])))
        let maxRxOctets = UInt16(littleEndian: UInt16(bytes: (data[6], data[7])))
        let maxRxTime = UInt16(littleEndian: UInt16(bytes: (data[8], data[9])))
        
        self.handle = handle
        self.maxTxOctets = maxTxOctets
        self.maxTxTime = maxTxTime
        self.maxRxOctets = maxRxOctets
        self.maxRxTime = maxRxTime
    }
}
