//
//  PSM.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 3/1/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

/// Protocol/Service Multiplexer (PSM).
public enum ProtocolServiceMultiplexer: UInt8 {
    
    /// SDP
    case sdp            = 0x0001
    
    /// RFCOMM
    case rfcomm         = 0x0003
    
    /// TCS
    case tcs            = 0x0005
    
    /// TCS-BIN-CORDLESS
    case ctp            = 0x0007
    
    /// BNEP
    case bnep           = 0x000F
    
    /// HID Control
    case hidc           = 0x0011
    
    /// HID Interrupt
    case hidi           = 0x0013
    
    /// UPnP
    case upnp           = 0x0015
    
    /// AVCTP
    case avctp          = 0x0017
    
    /// AVDTP
    case avdtp          = 0x0019
    
    /// Advanced Control - Browsing
    case avctpBrowsing  = 0x001B
    
    /// Unrestricted Digital Information Profile C-Plane
    case udicp          = 0x001D
    
    /// Attribute Protocol
    case att            = 0x001F
    
    /// 3DSP
    case _3dsp          = 0x0021
    
    /// IPSP
    case ipsp           = 0x0023
    
    /// OTS
    case ots            = 0x0025
    
    /// Extended ATT
    case eatt           = 0x0027
}
