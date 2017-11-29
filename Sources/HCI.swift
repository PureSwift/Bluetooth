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
