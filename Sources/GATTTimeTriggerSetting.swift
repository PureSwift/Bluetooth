//
//  GATTTimeTriggerSetting.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

/// GATT Time Trigger Setting Condition
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
public enum GATTTimeTriggerSetting: GATTDescriptor {
    
    public static let uuid: BluetoothUUID = .timeTriggerSetting
    
    public static let minimumLength = 2
    
    case valueC1(UInt8)
    
    case valueC2(UInt8, UInt8, UInt8)
    
    case valueC3(UInt16)
    
    public init?(byteValue: Data) {
        
        guard byteValue.count >= type(of: self).minimumLength
            else { return nil }
        
        guard let condition = GATTTimeTriggerSettingCondition(rawValue: byteValue[0])
            else { return nil }
        
        switch condition {
            
        case .none:
            
            self = .valueC1(byteValue[1])
            
        case .indicateTimeInterval:
            
            guard byteValue.count == 4
                else { return nil }
            self = .valueC2(byteValue[1], byteValue[2], byteValue[3])
            
        case .timeInterval:
            
            guard byteValue.count == 4
                else { return nil }
            self = .valueC2(byteValue[1], byteValue[2], byteValue[3])
            
        case .count:
            
            guard byteValue.count == 3
                else { return nil }
            self = .valueC3(UInt16(littleEndian: UInt16(bytes: (byteValue[1], byteValue[2]))))
        }
    }
    
    public var byteValue: Data {
        
        switch self {
            
        case .valueC1(let byte):
            
            let conditionByte = GATTTimeTriggerSettingCondition.none.rawValue
            return Data([conditionByte, byte])
            
        case .valueC2(let byte):
            
            let conditionByte = GATTTimeTriggerSettingCondition.timeInterval.rawValue
            return Data([conditionByte, byte.0, byte.1, byte.2])
            
        case .valueC3(let byte):
            
            let conditionByte = GATTTimeTriggerSettingCondition.count.rawValue
            let bytes = byte.bytes
            return Data([conditionByte, bytes.0, bytes.1])
            
        }
    }
    
    public var descriptor: GATT.Descriptor {
        
        return GATT.Descriptor(uuid: type(of: self).uuid,
                               value: byteValue,
                               permissions: [.read])
    }
}
