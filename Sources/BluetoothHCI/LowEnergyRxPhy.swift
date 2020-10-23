//
//  LowEnergyRxPhy.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

/// Bluetooth LE Rx Phy
public enum LowEnergyRxPhy: UInt8 { //RX_PHY
    
    /// The receiver PHY for the connection is LE 1M
    case le1m       = 0x01
    
    /// The receiver PHY for the connection is LE 2M
    case le2m       = 0x02
    
    /// The receiver PHY for the connection is LE Coded
    case leCoded    = 0x03
}
