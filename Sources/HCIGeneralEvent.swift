//
//  HCIGeneralEvent.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 3/3/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

/// Bluetooth HCI Events (not categorized)
public enum HCIGeneralEvent: UInt8, HCIEvent {
    
    case inquiryComplete            = 0x01
    case inquiryResult              = 0x02
    case connectionComplete         = 0x03
    
    // TODO: Complete all HCI events
    
    case remoteNameRequestComplete  = 0x07
    case commandComplete            = 0x0E
    case commandStatus              = 0x0F
    
    case lowEnergyMeta              = 0x3E
}
