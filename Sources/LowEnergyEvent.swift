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
    
    /// LE Remote Connection Parameter Request Event
    case remoteConnectionParameterRequest   = 0x06
    
    /// LE Data Length Change Event
    case dataLengthChange                   = 0x07
    
    /// LE Read Local P-256 Public Key Complete Event
    case readLocalP256PublicKeyComplete     = 0x08
    
    /// LE Generate DHKey Complete Event
    case generateDHKeyComplete              = 0x09
    
    /// LE Enhanced Connection Complete Event
    case enhancedConnectionComplete         = 0x0A
    
    /// LE Directed Advertising Report Event
    case directedAdvertisingReport          = 0x0B
    
    /// LE PHY Update Complete Event
    case phyUpdateComplete                  = 0x0C
    
    /// LE Extended Advertising Report Event
    case extendedAdvertisingReport          = 0x0D
    
    /// LE Periodic Advertising Sync Established Event
    case periodicAdvertisingSyncEstablished = 0x0E
    
    /// LE Periodic Advertising Report Event
    case periodicAdvertisingReport          = 0x0F
    
    /// LE Periodic Advertising Sync Lost Event
    case periodicAdvertisingSyncLost        = 0x10
    
    /// LE Scan Timeout Event
    case scanTimeout                        = 0x11
    
    /// LE Advertising Set Terminated Event
    case advertisingSetTerminated           = 0x12
    
    /// LE Scan Request Received Event
    case scanRequestReceived                = 0x13
    
    /// LE Channel Selection Algorithm Event
    case channelSelectionAlgorithm          = 0x14
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
        case .remoteConnectionParameterRequest: return "LE Remote Connection Parameter Request Event"
        case .dataLengthChange: return "LE Data Length Change Event"
        case .readLocalP256PublicKeyComplete: return "LE Read Local P-256 Public Key Complete Event"
        case .generateDHKeyComplete: return "LE Generate DHKey Complete Event"
        case .enhancedConnectionComplete: return "LE Enhanced Connection Complete"
        case .directedAdvertisingReport: return "LE Directed Advertising Report Event"
        case .phyUpdateComplete: return "LE PHY Update Complete"
        case .extendedAdvertisingReport: return "LE Extended Advertising Report Event"
        case .periodicAdvertisingSyncEstablished: return "LE Periodic Advertising Sync Established Event"
        case .periodicAdvertisingReport: return "LE Periodic Advertising Report Event"
        case .periodicAdvertisingSyncLost: return "LE Periodic Advertising Sync Lost Event"
        case .scanTimeout: return "LE Scan Timeout Event"
        case .advertisingSetTerminated: return "LE Advertising Set Terminated Event"
        case .scanRequestReceived: return "LE Scan Request Received Event"
        case .channelSelectionAlgorithm: return "LE Channel Selection Algorithm Event"
        }
    }
}
