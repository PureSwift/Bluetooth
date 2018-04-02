//
//  LowEnergyEvent.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 3/2/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

/// Bluetooth Low Energy HCI Events
public enum LowEnergyEvent: UInt8, HCIEvent {
    
    /// LE Connection Complete
    case connectionComplete                 = 0x01
    
    /// LE Advertising Report
    case advertisingReport                  = 0x02
    
    /// LE Connection Update Complete
    case connectionUpdateComplete           = 0x03
    
    /// LE Read Remote Used Features Complete
    case readRemoteUsedFeaturesComplete     = 0x04
    
    /// LE Long Term Key Request
    case longTermKeyRequest                 = 0x05
    
    /// LE Encryption Change
    case encryptionChange                   = 0x08
    
    /// LE Encryption Key Refresh Complete
    case encryptionKeyRefreshComplete       = 0x30
}

// MARK: - Name

public extension LowEnergyEvent {
    
    public var name: String {
        
        return type(of: self).names[Int(rawValue)]
    }
    
    private static let names = [
        "Unknown",
        "LE Connection Complete",
        "LE Advertising Report",
        "LE Connection Update Complete",
        "LE Read Remote Used Features Complete",
        "LE Long Term Key Request"
    ]
}
