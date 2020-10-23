//
//  LowEnergyPacketPayload.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

/// Bluetooth LE Packet Payload format
public enum LowEnergyPacketPayload: UInt8 { // Packet_Payload
    
    case prb29Sequence       = 0x00
    case repeated11110000    = 0x01
    case repeated10101010    = 0x02
    case prbs15Sequence      = 0x03
    case repeated11111111    = 0x04
    case repeated00000000    = 0x05
    case repeated00001111    = 0x06
    case repeated01010101    = 0x07
}
