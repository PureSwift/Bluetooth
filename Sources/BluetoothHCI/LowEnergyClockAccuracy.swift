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

public extension LowEnergyClockAccuracy {
    
    var ppm: UInt {
        
        switch self {
        case .ppm500: return 500
        case .ppm250: return 250
        case .ppm150: return 150
        case .ppm100: return 100
        case .ppm75: return 75
        case .ppm50: return 50
        case .ppm30: return 30
        case .ppm20: return 20
        }
    }
}
