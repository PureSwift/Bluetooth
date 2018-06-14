//
//  ATTProtocolDataUnit.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 3/1/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Protocol Definition

/// Data packet for the ATT protocol.
public protocol ATTProtocolDataUnit {
    
    /// The PDU's attribute opcode.
    static var attributeOpcode: ATT.Opcode { get }
    
    /// Converts PDU to raw bytes (little-endian).
    var data: Data { get }
    
    /// Initializes PDU from raw bytes (little-endian).
    init?(data: Data)
}
