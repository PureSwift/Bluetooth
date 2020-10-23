//
//  LowEnergyRole.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

/// Bluetooth LE Connection role
public enum LowEnergyRole: UInt8 {
    
    /// Connection is master.
    case master = 0x00
    
    /// Connection is slave
    case slave = 0x01
}
