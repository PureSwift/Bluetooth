//
//  LowEnergyClockAccuracy.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

/// Bluetooth LE Clock Accuracy
public enum LowEnergyClockAccuracy: UInt8 {
    
    case ppm500     = 0x00
    case ppm250     = 0x01
    case ppm150     = 0x02
    case ppm100     = 0x03
    case ppm75      = 0x04
    case ppm50      = 0x05
    case ppm30      = 0x06
    case ppm20      = 0x07
}
