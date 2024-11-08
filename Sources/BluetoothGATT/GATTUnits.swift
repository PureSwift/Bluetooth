//
//  GATTUnits.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 11/6/24.
//

@frozen
public enum GATTBeatsPerMinute {
    
    public struct Byte: BluetoothUnit, Equatable, Hashable, Sendable {
        
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

extension GATTBeatsPerMinute.Byte: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt8) {
        self.init(rawValue: value)
    }
}

@frozen
public struct GATTBatteryPercentage: BluetoothUnit, Equatable, Hashable, Sendable {
    
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

extension GATTBatteryPercentage: CustomStringConvertible {
    
    public var description: String {
        return "\(rawValue)%"
    }
}

@frozen
public struct GATTE2ecrc: RawRepresentable, Equatable, Hashable, Sendable {
    
    internal static let length = MemoryLayout<UInt16>.size
    
    public var rawValue: UInt16
    
    public init(rawValue: UInt16) {
        
        self.rawValue = rawValue
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

@frozen
public enum GATTKilogramCalorie {
    
    public struct Byte: BluetoothUnit, Equatable, Hashable, Sendable {
        
        internal static let length = MemoryLayout<UInt8>.size
        
        public static var unitType: UnitIdentifier { return .kilogramCalorie }
        
        public var rawValue: UInt8
        
        public init(rawValue: UInt8) {
            self.rawValue = rawValue
        }
    }
    
    public struct Bits16: BluetoothUnit, Equatable, Hashable, Sendable {
        
        internal static let length = MemoryLayout<UInt16>.size
        
        public static var unitType: UnitIdentifier { return .kilogramCalorie }
        
        public var rawValue: UInt16
        
        public init(rawValue: UInt16) {
            self.rawValue = rawValue
        }
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
