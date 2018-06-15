//
//  LowEnergyTxPhy.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

/// Bluetooth LE Tx Phy
public enum LowEnergyTxPhy: UInt8 { //TX_PHY
    
    /// The transmitter PHY for the connection is LE 1M
    case le1m       = 0x01
    
    /// The transmitter PHY for the connection is LE 2M
    case le2m       = 0x02
    
    /// The transmitter PHY for the connection is LE Coded
    case leCoded    = 0x03
}
