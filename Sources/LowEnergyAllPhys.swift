//
//  LowEnergyAllPhys.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

/// The ALL_PHYS parameter is a bit field that allows the Host to specify, for each direction,
/// whether it has no preference among the PHYs that the Controller supports in a given direction
/// or whether it has specified particular PHYs that it prefers in the TX_PHYS or RX_PHYS parameter.
public enum LowEnergyAllPhys: UInt8, BitMaskOption {
    
    #if swift(>=3.2)
    #elseif swift(>=3.0)
    public typealias RawValue = UInt8
    #endif
    
    /// The Host has no preference among the transmitter PHYs supported by the Controller
    case hostHasNoPreferenceAmongTheTransmitterPhy  = 0b01
    
    /// The Host has no preference among the receiver PHYs supported by the Controller
    case hostHasNoPreferenceAmongTheReceiverPhy     = 0b10
    
    public static let all: Set<LowEnergyAllPhys> = [.hostHasNoPreferenceAmongTheTransmitterPhy,
                                                    .hostHasNoPreferenceAmongTheReceiverPhy]
}
