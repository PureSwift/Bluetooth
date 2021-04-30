//
//  LowEnergyPhyOptions.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

/// The PHY_options parameter is a bit field that allows the Host to specify options for PHYs.
/// The default value for a new connection shall be all zero bits. The Controller may override
/// any preferred coding for transmitting on the LE Coded PHY.
@frozen
public enum LowEnergyPhyOptions: UInt16, BitMaskOption {
    
    /// The Host has no preferred coding when transmitting on the LE Coded PHY
    case host       = 0b01
    
    /// The Host prefers that S=2 coding be used when transmitting on the LE Coded PHY
    case s2         = 0b10
    
    /// The Host prefers that S=8 coding be used when transmitting on the LE Coded PHY
    case s3         = 0b100
    
    public static let allCases: [LowEnergyPhyOptions] = [.host,
                                                       .s2,
                                                       .s3]
}
