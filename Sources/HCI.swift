//
//  HCI.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 3/1/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

/// Bluetooth HCI
public struct HCI {
    
    // MARK: - Constants
    
    public static let maximumDeviceCount    = 16
    
    public static let maximumACLSize        = (1492 + 4)
    
    public static let maximumSCOSize        = 255
    
    public static let maximumEventSize      = 260
    
    public static let maximumFrameSize      = maximumACLSize + 4
    
    public static let maximumNameLength     = 248
    
    public static let typeLength            = 1
        
    // MARK: - Typealiases
    
    public typealias OpcodeGroupField       = HCIOpcodeGroupField
    
    public typealias Error                  = HCIError
    
    public typealias Version                = HCIVersion
    
    public typealias Status                 = HCIStatus
    
    public typealias PacketHeader           = HCIPacketHeader
    
    public typealias CommandHeader          = HCICommandHeader
    
    public typealias EventHeader            = HCIEventHeader
}

/// HCI Opcode Group Field
public enum HCIOpcodeGroupField: UInt16 {
    
    /// Link Control
    case linkControl = 0x01
    
    /// Link Policy
    case linkPolicy = 0x02
    
    /// Host Controller and Baseband
    case hostControllerBaseband = 0x03
    
    /// Informational Parameters
    case informational = 0x04
    
    /// Status Parameters
    case statusParameters = 0x05
    
    /// Low Energy
    case lowEnergy = 0x08
    
    /// Testing Commands
    case testing = 0x3e
    
    /// Vendor specific commands
    case vendor = 0x3f
}

/// HCI Status Code
public enum HCIStatus: RawRepresentable, CustomStringConvertible {
    
    case success
    case error(HCIError)
    
    public init?(rawValue: UInt8) {
        
        if rawValue == 0 {
            
            self = .success
            
        } else {
            
            guard let error = HCIError(rawValue: rawValue)
                else { return nil }
            
            self = .error(error)
        }
    }
    
    public var rawValue: UInt8 {
        
        switch self {
        case .success: return 0x00
        case let .error(error): return error.rawValue
        }
    }
    
    public var error: HCIError? {
        
        switch self {
        case .success: return nil
        case let .error(error): return error
        }
    }
    
    public var description: String {
        
        switch self {
        case .success: return "Success"
        case let .error(error): return error.description
        }
    }
}
