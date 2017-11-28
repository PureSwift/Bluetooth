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
}

/// HCI Opcode Group Field
public enum HCIOpcodeGroupField: UInt16 {
    
    /// Link Control
    case linkControl = 0x01
    
    /// Link Policy
    case LlinkPolicy = 0x02
    
    /// Host Controller and Baseband
    case hostController = 0x03
    
    /// Informational Parameters
    case informationalParameters = 0x04
    
    /// Status Parameters
    case statusParameters = 0x05
    
    /// Low Energy
    case lowEnergy = 0x08
    
    /// Testing Commands
    case testing = 0x3e
    
    /// Vendor specific commands
    case vendor = 0x3f
}

/// Bluetooth version
public enum HCIVersion: UInt8 {
    
    case v1_0b      = 0x00
    case v1_1       = 0x01
    case v1_2       = 0x02
    case v2_0       = 0x03
    case v2_1       = 0x04
    case v3_0       = 0x05
    case v4_0       = 0x06
    case v4_1       = 0x07
    case v4_2       = 0x08
    case v5_0       = 0x09
}

extension HCIVersion: CustomStringConvertible {
    
    public var description: String {
        
        switch self {
        case .v1_0b:     return "1.0b"
        case .v1_1:      return "1.1"
        case .v1_2:      return "1.2"
        case .v2_0:      return "2.0"
        case .v2_1:      return "2.1"
        case .v3_0:      return "3.0"
        case .v4_0:      return "4.0"
        case .v4_1:      return "4.1"
        case .v4_2:      return "4.2"
        case .v5_0:      return "5.0"
        }
    }
}
