//
//  HCIMaxSlotsChange.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 8/17/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// Max Slots Change Event
///
/// This event is used to notify the Host about the LMP_Max_Slots parameter when the value of this parameter changes. It shall be sent each time the maximum allowed length, in number of slots, for baseband packets transmitted by the local device, changes. The Connection_Handle will be a Connection_Handle for an ACL connection.
@frozen
public struct HCIMaxSlotsChange: HCIEventParameter {
    
    public static let event = HCIGeneralEvent.maxSlotsChange
    
    public static let length: Int = 3
    
    public let connectionHandle: UInt16
    
    public let maxSlotsLMP: UInt8
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let connectionHandle = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
        
        self.connectionHandle = connectionHandle
        self.maxSlotsLMP = data[2]
    }
}
