//
//  LowEnergyAddressType.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 11/28/17.
//  Copyright © 2017 PureSwift. All rights reserved.
//

/// Bluetooth Low Energy Address type
public enum LowEnergyAddressType: UInt8 {
    
    /// Public Device Address
    case `public`   = 0x00
    
    /// Random Device Address
    case random     = 0x01
    
    public init() { self = .public }
}
