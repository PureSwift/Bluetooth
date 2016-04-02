//
//  HCI.swift
//  BluetoothLinux
//
//  Created by Alsey Coleman Miller on 3/1/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

import SwiftFoundation

/// Bluetooth HCI
public struct HCI {
    
    // MARK: - Constants
    
    public static let MaximumDeviceCount    = 16
    
    public static let MaximumACLSize        = (1492 + 4)
    
    public static let MaximumSCOSize        = 255
    
    public static let MaximumEventSize      = 260
    
    public static let MaximumFrameSize      = MaximumACLSize + 4
    
    public static let MaximumNameLength     = 248
    
    public static let TypeLength            = 1
    
    // MARK: - Typealiases
    
    public typealias OpcodeGroupField       = HCIOpcodeGroupField
    
    public typealias Error                  = HCIError
}

/// HCI Opcode Group Field
public enum HCIOpcodeGroupField: UInt16 {
    
    /// Link Control
    case LinkControl = 0x01
    
    /// Link Policy
    case LinkPolicy = 0x02
    
    /// Host Controller and Baseband
    case HostController = 0x03
    
    /// Informational Parameters
    case InformationalParameters = 0x04
    
    /// Status Parameters
    case StatusParameters = 0x05
    
    /// Low Energy
    case LowEnergy = 0x08
    
    /// Testing Commands
    case Testing = 0x3e
    
    /// Vendor specific commands
    case Vendor = 0x3f
}

/// Bluetooth HCI Errors
public enum HCIError: UInt8, ErrorType {
    
    case UnknownCommand                     = 0x01
    case NoConnection
    case HardwareFailure
    case PageTimeout
    case AuthenticationFailure
    case KeyMissing
    case MemoryFull
    case ConnectionTimeout
    case MaxConnections
    case MaxSCOConnections
    case ACLConnectionExists
    case CommandDisallowed
    case RejectedLimitedResources
    case RejectedSecurity
    case RejectedPersonal
    case HostTimeout
    case UnsupportedFeature
    case InvalidParameters
    case OEUserEndedConnection
    case OELowResources
    case OEPowerOff
    case ConnectionTerminated
    case RepeatedAttempts
    case PairingNotAllowed
    
    // ... Add More
    
    case TransactionCollision               = 0x2a
    case QOSUnacceptableParameter           = 0x2c
    
    // TODO: Add all errors
    
    case HostBusyPairing                    = 0x38
}

