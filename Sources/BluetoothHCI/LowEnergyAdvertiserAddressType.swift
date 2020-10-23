//
//  LowEnergyAdvertiserAddressType.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

/// Bluetooth LE Advertiser Address Type
public enum LowEnergyAdvertiserAddressType: UInt8 { //Advertiser_Address_Type
    
    /// Public Device Address or Public Identity Address
    case `public` = 0x00
    
    /// Random Device Address or Random (static) Identity Address
    case random = 0x01
}
