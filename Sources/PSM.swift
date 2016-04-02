//
//  PSM.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 3/1/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

/// Protocol/Service Multiplexer (PSM).
public enum ProtocolServiceMultiplexer: UInt8 {
    
    case SDP        = 0x0001
    case RFCOMM     = 0x0003
    case TCS        = 0x0005
    case CTP        = 0x0007
    case BNEP       = 0x000F
    case HIDC       = 0x0011
    case HIDI       = 0x0013
    case UPNP       = 0x0015
    case AVCTP      = 0x0017
    case AVDTP      = 0x0019
    
    /// Advanced Control - Browsing
    case AVCTP13    = 0x001B
    
    /// Unrestricted Digital Information Profile C-Plane
    case UDICP      = 0x001D
    
    /// Attribute Protocol
    case ATT        = 0x001F
}