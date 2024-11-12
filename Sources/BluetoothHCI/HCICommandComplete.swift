//
//  HCICommandComplete.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// HCI Command Complete
@frozen
public struct HCICommandComplete: HCIEventParameter {
    
    public static let event = HCIGeneralEvent.commandComplete
    public static let length = 3
    
    /// The Number of HCI command packets which are allowed to be sent to the Controller from the Host.
    public var numberOfCommandPackets: UInt8
    public var opcode: UInt16
    
    public init?<Data: DataContainer>(data: Data) {
        
        guard data.count == Self.length
            else { return nil }
        
        self.numberOfCommandPackets = data[0]
        self.opcode = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))
    }
}
