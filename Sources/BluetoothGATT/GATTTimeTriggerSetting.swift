//
//  GATTTimeTriggerSetting.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Bluetooth

/// GATT Time Trigger Setting Descriptor
///
/// The value of the descriptor has two parts.
/// Part one is a condition field and occupies one octet, and part two is the comparison value (trigger point) that the characteristic value is checked against.
@frozen
public enum GATTTimeTriggerSetting: GATTDescriptor, Hashable, Sendable {
    
    public static var uuid: BluetoothUUID { .timeTriggerSetting }
        
    case valueC1(UInt8)
    
    case valueC2(UInt8, UInt8, UInt8)
    
    case valueC3(UInt16)
}

// MARK: - DataConvertible

extension GATTTimeTriggerSetting: DataConvertible {
    
    internal static var minimumLength: Int { 2 }
    
    public init?<Data: DataContainer>(data: Data) {
        
        guard data.count >= Self.minimumLength
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
    
    public func append<Data>(to data: inout Data) where Data : DataContainer {        
        switch self {
        case let .valueC1(byte):
            let conditionByte = GATTTimeTriggerSettingCondition.none.rawValue
            data += conditionByte
            data += byte
        case let .valueC2(byte0, byte1, byte2):
            let conditionByte = GATTTimeTriggerSettingCondition.timeInterval.rawValue
            data += conditionByte
            data += byte0
            data += byte1
            data += byte2
        case let .valueC3(value):
            let conditionByte = GATTTimeTriggerSettingCondition.count.rawValue
            data += conditionByte
            data += value.littleEndian
        }
    }
    
    public var dataLength: Int {
        switch self {
        case .valueC1:
            return 2
        case .valueC2:
            return 4
        case .valueC3:
            return 3
        }
    }
}

// MARK: - Supporting Types

/// GATT Time Trigger Setting Condition
@frozen
public enum GATTTimeTriggerSettingCondition: UInt8, CaseIterable, Sendable {
    
    case none = 0x00
    case indicateTimeInterval = 0x01
    case timeInterval = 0x02
    case count = 0x03
}
