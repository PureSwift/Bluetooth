//
//  LowEnergyEvent.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 3/2/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

/// Bluetooth Low Energy HCI Events
public enum LowEnergyEvent: UInt8, HCIEvent {
    
    case ConnectionComplete     = 0x01
    
    // TODO: All LE Events
}