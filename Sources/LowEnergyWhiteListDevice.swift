//
//  LowEnergyWhiteListDevice.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

/// LE White List Address Type
public enum LowEnergyWhiteListAddressType: UInt8 {
    
    /// Public Device Address
    case `public` = 0x00
    
    /// Random Device Address
    case random = 0x01
    
    /// Devices sending anonymous advertisements
    case anonymous = 0xFF
}

/// LE White List Device Entry
public enum LowEnergyWhiteListDevice {
    
    case `public`(Address)
    case random(Address)
    case anonymous
    
    public var addressType: LowEnergyWhiteListAddressType {
        switch self {
        case .public: return .public
        case .random: return .random
        case .anonymous: return .anonymous
        }
    }
    
    public var address: Address {
        switch self {
        case let .public(address): return address
        case let .random(address): return address
        case .anonymous: return .any
        }
    }
}
