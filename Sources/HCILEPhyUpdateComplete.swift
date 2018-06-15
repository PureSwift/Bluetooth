//
//  HCILEPhyUpdateComplete.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/15/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// LE PHY Update Complete Event
///
/// The LE PHY Update Complete Event is used to indicate that the Controller has changed
/// the transmitter PHY or receiver PHY in use.
///
/// If the Controller changes the transmitter PHY, the receiver PHY, or both PHYs,
/// this event shall be issued.
///
/// If an LE_Set_PHY command was sent and the Controller determines that neither PHY will
/// change as a result, it issues this event immediately.
public struct HCILEPhyUpdateComplete: HCIEventParameter {
    
    public static let event = LowEnergyEvent.phyUpdateComplete // 0x0C
    
    public static let length: Int = 5
    
    public let status: HCIStatus
    
    public let handle: UInt16 // Connection_Handle
    
    public let txPhy: LowEnergyTxPhy
    
    public let rxPhy: LowEnergyRxPhy
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let statusByte = data[0]
        
        let handle = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))
        
        guard let status = HCIStatus(rawValue: statusByte)
            else { return nil }
        
        guard let txPhy = LowEnergyTxPhy(rawValue: data[3])
            else { return nil }
        
        guard let rxPhy = LowEnergyRxPhy(rawValue: data[4])
            else { return nil }
        
        self.status = status
        self.handle = handle
        self.txPhy = txPhy
        self.rxPhy = rxPhy
    }
}
