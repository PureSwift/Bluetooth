//
//  LowEnergyFragmentPreference.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

/// Bluetooth LE Fragment Preference
public enum LowEnergyFragmentPreference: UInt8 { //Fragment_Preference
    
    /// The Controller may fragment all Host advertising data
    case fragmentAllHostAdvertisingData = 0x00
    
    /// The Controller should not fragment or should minimize fragmentation of Host advertising data
    case shouldNotFragmentHostAdvertisingData = 0x01
}
