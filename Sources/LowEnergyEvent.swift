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
    
    /// LE PHY Update Complete Event
    case phyUpdateComplete                  = 0x3E
}

// MARK: - Name

public extension LowEnergyEvent {
    
    public var name: String {
        
        switch self {
        case .connectionComplete: return "LE Connection Complete"
        case .advertisingReport: return "LE Advertising Report"
        case .connectionUpdateComplete: return "LE Connection Update Complete"
        case .readRemoteUsedFeaturesComplete: return "LE Read Remote Used Features Complete"
        case .longTermKeyRequest: return "LE Long Term Key Request"
        case .phyUpdateComplete: return "LE PHY Update Complete Event"
        }
    }
}
