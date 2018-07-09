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

public struct GATTE2ecrc: RawRepresentable {
    
    internal static let length = MemoryLayout<UInt16>.size
    
    public var rawValue: UInt16
    
    public init(rawValue: UInt16) {
        
        self.rawValue = rawValue
    }
}

extension GATTE2ecrc: Equatable {
    
    public static func == (lhs: GATTE2ecrc, rhs: GATTE2ecrc) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

extension GATTE2ecrc: CustomStringConvertible {
    
    public var description: String {
        
        return "\(rawValue)"
    }
}

extension GATTE2ecrc: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt16) {
        
        self.init(rawValue: value)
    }
}

public enum GATTKilogramCalorie {
    
    public struct Byte: BluetoothUnit {
        
        internal static let length = MemoryLayout<UInt8>.size
        
        public static var unitType: UnitIdentifier { return .kilogramCalorie }
        
        public var rawValue: UInt8
        
        public init(rawValue: UInt8) {
            
            self.rawValue = rawValue
        }
    }
    
    public struct Bits16: BluetoothUnit {
        
        internal static let length = MemoryLayout<UInt16>.size
        
        public static var unitType: UnitIdentifier { return .kilogramCalorie }
        
        public var rawValue: UInt16
        
        public init(rawValue: UInt16) {
            
            self.rawValue = rawValue
        }
    }
}

extension GATTKilogramCalorie.Byte: Equatable {
    
    public static func == (lhs: GATTKilogramCalorie.Byte, rhs: GATTKilogramCalorie.Byte) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

extension GATTKilogramCalorie.Byte: CustomStringConvertible {
    
    public var description: String {
        
        return "\(rawValue)"
    }
}

extension GATTKilogramCalorie.Byte: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt8) {
        
        self.init(rawValue: value)
    }
}

extension GATTKilogramCalorie.Bits16: Equatable {
    
    public static func == (lhs: GATTKilogramCalorie.Bits16, rhs: GATTKilogramCalorie.Bits16) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

extension GATTKilogramCalorie.Bits16: CustomStringConvertible {
    
    public var description: String {
        
        return "\(rawValue)"
    }
}

extension GATTKilogramCalorie.Bits16: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt16) {
        
        self.init(rawValue: value)
    }
}
