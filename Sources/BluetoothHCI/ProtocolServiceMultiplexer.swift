//
//  PSM.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 3/1/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

/// Protocol/Service Multiplexer (PSM).
public enum ProtocolServiceMultiplexer: UInt8 {
    
    case sdp        = 0x0001
    case rfcomm     = 0x0003
    case tcs        = 0x0005
    case ctp        = 0x0007
    case bnep       = 0x000F
    case hidc       = 0x0011
    case hidi       = 0x0013
    case upnp       = 0x0015
    case avctp      = 0x0017
    case avdtp      = 0x0019
    
    /// Advanced Control - Browsing
    case avctp13    = 0x001B
    
    /// Unrestricted Digital Information Profile C-Plane
    case udicp      = 0x001D
    
    /// Attribute Protocol
    case att        = 0x001F
}
