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

public struct GATTSupportedNewAlertCategoryCharacteristic: GATTProfileCharacteristic {
    
    public static var UUID: BluetoothUUID { return .supportedNewAlertCategory }
    
    public init?(data: Data) {
        
        
    }
    
}

public struct GATTAlertCategoryIdBitMaskCharacteristic: GATTProfileCharacteristic {
    
    internal static let length = 2
    
    public static var UUID: BluetoothUUID { return .alertCategoryIdBitMask }
    
    public var bitMask0: BitMaskOptionSet<GATTAlertCategoryIdBitMask0>
    
    public var bitMask1: BitMaskOptionSet<GATTAlertCategoryIdBitMask1>
    
    public init(bitMask0: GATTAlertCategoryIdBitMask0, bitMask1: GATTAlertCategoryIdBitMask1)
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        bitMask0 = data[0]
        bitMask1 = data[1]
    }
    
}

public enum GATTAlertCategoryIdBitMask0: UInt8, BitMaskOption {
    
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
    
    public static var all: Set<GATTAlertCategoryIdBitMask0> = [
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

public enum GATTAlertCategoryIdBitMask1: UInt8, BitMaskOption {
    
    #if swift(>=3.2)
    #elseif swift(>=3.0)
    public typealias RawValue = UInt8
    #endif
    
    case highPrioritized = 0b01
    
    case instantMessage = 0b10
    
    public static var all: Set<GATTAlertCategoryIdBitMask1> = [
        .highPrioritized,
        .instantMessage
    ]
    
}
