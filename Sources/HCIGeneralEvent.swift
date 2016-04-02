//
//  HCIGeneralEvent.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 3/3/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

/// Bluetooth HCI Events (not categorized)
public enum HCIGeneralEvent: UInt8, HCIEvent {
    
    case InquiryComplete            = 0x01
    case InquiryResult              = 0x02
    case ConnectionComplete         = 0x03
    
    // TODO: Complete all HCI events
    
    case RemoteNameRequestComplete  = 0x07
    case CommandComplete            = 0x0E
    case CommandStatus              = 0x0F
    
    case LowEnergyMeta              = 0x3E
}