//
//  AdvertisingChannelHeader.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 11/28/17.
//  Copyright © 2017 PureSwift. All rights reserved.
//

/// Advertising channel PDU Header’s PDU Type
///
/// - Note: The actual value is 4 bits.
/// 
/// - SeeAlso: BLUETOOTH SPECIFICATION Version 4.0 [Vol 6] p39
public enum AdvertisingChannelHeader: UInt8 {
    
    /// Connectable undirected advertising event
    case undirectedAdvertising          = 0b0000 // ADV_IND
    
    /// Connectable directed advertising event
    case directedAdvertising            = 0b0001 // ADV_DIRECT_IND
    
    /// Non-connectable undirected advertising event
    case nonConnectableAdvertising      = 0b0010 // ADV_NONCONN_IND
    
    /// Scan Request
    case scanRequest                    = 0b0011 // SCAN_REQ
    
    /// Scan Response
    case scanResponse                   = 0b0100 // SCAN_RSP
    
    /// Connection Request
    case connectionRequest              = 0b0101 // CONNECT_REQ
    
    /// Scannable undirected advertising event
    case scannableAdvertising           = 0b0110 // ADV_SCAN_IND
    
    // 0111-1111 reserved
    
    /// Default value.
    public init() { self = .undirectedAdvertising }
}
