//
//  GATTTimeTriggerSetting.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// GATT Time Trigger Setting Condition
@frozen
public enum GATTTimeTriggerSettingCondition: UInt8 {
    
    case none = 0x00
    case indicateTimeInterval = 0x01
    case timeInterval = 0x02
    case count = 0x03
}

// MARK: - Time Trigger Setting
/// GATT Time Trigger Setting Descriptor
///
/// The value of the descriptor has two parts.
/// Part one is a condition field and occupies one octet, and part two is the comparison value (trigger point) that the characteristic value is checked against.
@frozen
public enum GATTTimeTriggerSetting: GATTDescriptor {
    
    public static let uuid: BluetoothUUID = .timeTriggerSetting
    
    public static let minimumLength = 2
    
    case valueC1(UInt8)
    
    case valueC2(UInt8, UInt8, UInt8)
    
    case valueC3(UInt16)
    
    public init?(data: Data) {
        
        guard data.count >= type(of: self).minimumLength
            else { return nil }
        
        guard let condition = GATTTimeTriggerSettingCondition(rawValue: data[0])
            else { return nil }
        
        switch condition {
            
        case .none:
            
            self = .valueC1(data[1])
            
        case .indicateTimeInterval:
            
            guard data.count == 4
                else { return nil }
            self = .valueC2(data[1], data[2], data[3])
            
        case .timeInterval:
            
            guard data.count == 4
                else { return nil }
            self = .valueC2(data[1], data[2], data[3])
            
        case .count:
            
            guard data.count == 3
                else { return nil }
            self = .valueC3(UInt16(littleEndian: UInt16(bytes: (data[1], data[2]))))
        }
    }
    
    public var data: Data {
        
        switch self {
            
        case let .valueC1(byte):
            
            let conditionByte = GATTTimeTriggerSettingCondition.none.rawValue
            return Data([conditionByte, byte])
            
        case let .valueC2(byte0, byte1, byte2):
            
            let conditionByte = GATTTimeTriggerSettingCondition.timeInterval.rawValue
            return Data([conditionByte, byte0, byte1, byte2])
            
        case let .valueC3(byte):
            
            let conditionByte = GATTTimeTriggerSettingCondition.count.rawValue
            let bytes = byte.bytes
            return Data([conditionByte, bytes.0, bytes.1])
            
        }
    }
    
    public var descriptor: GATTAttribute.Descriptor {
        
        return GATTAttribute.Descriptor(uuid: type(of: self).uuid,
                               value: data,
                               permissions: [.read])
    }
}
