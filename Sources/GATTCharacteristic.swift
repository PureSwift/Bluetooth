//
//  GATTCharacteristic.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/10/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// GATT Characteristic protocol.
///
/// Describes a type that can encode / decode data to a characteristic type.
public protocol GATTCharacteristic {
    
    /// The Bluetooth UUID of the characteristic.
    static var uuid: BluetoothUUID { get }
    
    /// Decode from data.
    init?(data: Data)
    
    /// Encode to data.
    var data: Data { get }
}

// MARK: - Supporting Types

public enum GATTBeatsPerMinute {
    
    public struct Byte: BluetoothUnit {
        
        internal static let length = MemoryLayout<UInt8>.size
        
        public static var unitType: UnitIdentifier { return .beatsPerMinute }
        
        public var rawValue: UInt8
        
        public init(rawValue: UInt8) {
            
            self.rawValue = rawValue
        }
    }
}

extension GATTBeatsPerMinute.Byte: CustomStringConvertible {
    
    public var description: String {
        
        return rawValue.description
    }
}

extension GATTBeatsPerMinute.Byte: Equatable {
    
    public static func == (lhs: GATTBeatsPerMinute.Byte,
                           rhs: GATTBeatsPerMinute.Byte) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

extension GATTBeatsPerMinute.Byte: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt8) {
        
        self.init(rawValue: value)
    }
}

public struct GATTBatteryPercentage: BluetoothUnit {
    
    internal static let length = MemoryLayout<UInt8>.size
    
    public static let min = GATTBatteryPercentage(0)
    
    public static let max = GATTBatteryPercentage(100)
    
    public static var unitType: UnitIdentifier { return .percentage }
    
    public var rawValue: UInt8
    
    public init?(rawValue value: UInt8) {
        
        guard value <= GATTBatteryPercentage.max.rawValue,
            value >= GATTBatteryPercentage.min.rawValue
            else { return nil }
        
        self.rawValue = value
    }
    
    private init(_ unsafe: UInt8) {
        
        self.rawValue = unsafe
    }
}

extension GATTBatteryPercentage: Equatable {
    
    public static func == (lhs: GATTBatteryPercentage, rhs: GATTBatteryPercentage) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

extension GATTBatteryPercentage: CustomStringConvertible {
    
    public var description: String {
        
        return "\(rawValue)%"
    }
}

// MARK: - Internal

internal extension UInt64 {
    
    /// The value of the characteristic is a bit mask implemented as an array of unsigned 8 bit integers.
    init?(bitmaskArray data: Data) {
        
        if data.count == MemoryLayout<UInt64>.size {
            
            self = UInt64(littleEndian: UInt64(bytes: (data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7])))
            
        } else if data.count >= MemoryLayout<UInt32>.size {
            
            let rawValue = UInt32(littleEndian: UInt32(bytes: (data[0], data[1], data[2], data[3])))
            
            self = UInt64(rawValue)
            
        } else if data.count >= MemoryLayout<UInt16>.size {
            
            let rawValue = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
            
            self = UInt64(rawValue)
            
        } else if data.count >= MemoryLayout<UInt8>.size {
            
            let rawValue = data[0]
            
            self = UInt64(rawValue)
            
        } else {
            
            return nil
        }
    }
    
    /// The value of the characteristic is a bit mask implemented as an array of unsigned 8 bit integers.
    var bitmaskArray: Data {
        
        if self <= numericCast(UInt8.max) {
            
            return Data([UInt8(self)])
            
        } else if self <= numericCast(UInt16.max) {
            
            let bytes = UInt16(self).littleEndian.bytes
            
            return Data([bytes.0, bytes.1])
            
        } else if self <= numericCast(UInt32.max) {
            
            let bytes = UInt32(self).littleEndian.bytes
            
            return Data([bytes.0, bytes.1, bytes.2, bytes.3])
            
        } else {
            
            let bytes = self.littleEndian.bytes
            
            return Data([bytes.0, bytes.1, bytes.2, bytes.3, bytes.4, bytes.5, bytes.6, bytes.7])
        }
    }
}
