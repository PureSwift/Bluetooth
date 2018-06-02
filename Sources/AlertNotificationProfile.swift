//
//  AlertNotificationProfile.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/1/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

protocol GATTCharacteristicCategoryType {
    
}

public struct GATTAlertNotification {

    

}

public struct SupportedNewAlertCategoryCharacteristic {
    
    
    
}

public enum AlertCategoryIdBitMask0: UInt8, BitMaskOption {
    
    #if swift(>=3.2)
    #elseif swift(>=3.0)
    public typealias RawValue = UInt8
    #endif
    
    case simpleAlert = 0b01
    
    case email = 0b10
    
    case news = 0b100
    
    case call = 0b1000
    
    case missedCall = 0b10000
    
    case sms = 0b100000
    
    case voiceMail = 0b1000000
    
    case schedule = 0b10000000
    
    public static var all: Set<AlertCategoryIdBitMask0> = [
        .simpleAlert,
        .email,
        .news,
        .call,
        .missedCall,
        .sms,
        .voiceMail,
        .schedule
    ]
    
}

public enum AlertCategoryIdBitMask1: UInt8, BitMaskOption {
    
    #if swift(>=3.2)
    #elseif swift(>=3.0)
    public typealias RawValue = UInt8
    #endif
    
    case highPrioritized = 0b01
    
    case instantMessage = 0b10
    
    public static var all: Set<AlertCategoryIdBitMask1> = [
        .highPrioritized,
        .instantMessage
    ]
    
}
