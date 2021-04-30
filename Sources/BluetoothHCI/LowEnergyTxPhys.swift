//
//  LowEnergyTxPhys.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

/// The TX_PHYS parameter is a bit field that indicates the transmitter PHYs that the Host prefers
/// the Controller to use. If the ALL_PHYS parameter specifies that the Host has no preference,
//// the TX_PHYS parameter is ignored; otherwise at least one bit shall be set to 1.
@frozen
public enum LowEnergyTxPhys: UInt8, BitMaskOption {
    
    /// The Host prefers to use the LE 1M transmitter PHY (possibly among others)
    case hostUseLe1MTransmitterPhy      = 0b001
    
    /// The Host prefers to use the LE 2M transmitter PHY (possibly among others)
    case hostUseLe2MTransmitterPhy      = 0b010
    
    /// The Host prefers to use the LE Coded transmitter PHY (possibly among others)
    case hostUseLeCodedTransmitterPhy   = 0b100
    
    public static let allCases: [LowEnergyTxPhys] = [
        .hostUseLe1MTransmitterPhy,
        .hostUseLe2MTransmitterPhy,
        .hostUseLeCodedTransmitterPhy
    ]
}
