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
    case `public`           = 0x00
    
    /// Random Device Address
    case random             = 0x01
    
    /// Public Identity Address (Corresponds to peer’s Resolvable Private Address). 
    ///
    /// This value shall only be used by the Host if either the Host or the 
    /// Controller does not support the LE Set Privacy Mode command.
    ///
    /// - Note: Requires Bluetooth 5.0
    case publicIdentity     = 0x02
    
    /// Random (static) Identity Address (Corresponds to peer’s Resolvable Private Address). 
    ///
    /// This value shall only be used by a Host if either the Host or the Controller does 
    /// not support the LE Set Privacy Mode command.
    ///
    /// - Note: Requires Bluetooth 5.0
    case randomIdentity     = 0x03
    
    /// Default Low Energy Address type (`.public`).
    public init() { self = .public }
}

// MARK: - HCIVersioned

extension LowEnergyAddressType: HCIVersioned {
    
    public func isCompatible(with version: HCIVersion) -> Bool {
        
        switch self {
            
        case .public,
             .random:
            return version >= .v4_0
            
        case .publicIdentity,
             .randomIdentity:
            return version >= .v5_0
        }
    }
}
