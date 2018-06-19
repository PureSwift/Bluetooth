//
//  GATTBodyCompositionMeasurement.swift
//  Bluetooth-macOS
//
//  Created by Jorge Loc Rubio on 6/18/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 Body Composition Measurement
 
 - SeeAlso: [Body Composition Measurement](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.body_composition_measurement.xml)
 */
public struct GATTBodyCompositionMeasurement: GATTCharacteristic {
    
    public static let minimunLength = MemoryLayout<UInt32>.size
    
    public static var uuid: BluetoothUUID { return .bodyCompositionMeasurement }
    
    internal var flags: BitMaskOptionSet<Flag> {
        
        var flags = BitMaskOptionSet<Flag>()
        
        if timestamp != nil {
            
            flags.insert(.timestamp)
        }
        
        if userIdentifier != nil {
            
            flags.insert(.userID)
        }
        
        if basalMetabolism != nil {
            
            flags.insert(.basalMetabolism)
        }
        
        if musclePercentage != nil {
            
            flags.insert(.musclePercentage)
        }
        
        if muscleMass != nil {
            
            flags.insert(.muscleMass)
        }
        
        if fatFreeMass != nil {
            
            flags.insert(.fatFreeMass)
        }
        
        if softLeanMass != nil {
            
            flags.insert(.softLeanMass)
        }
        
        if bodyWaterMass != nil {
            
            flags.insert(.bodyWaterMass)
        }
        
        if impedance != nil {
            
            flags.insert(.impedance)
        }
        
        if weight != nil {
            
            flags.insert(.weight)
        }
        
        if height != nil {
            
            flags.insert(.height)
        }
        
        return flags
    }
    
    public var bodyFatPercentage: GATTBodyPercentage
    
    public var timestamp: GATTDateTime?
    
    public var userIdentifier: UInt8?
    
    public var basalMetabolism: GATTBodyEnergy?
    
    public var musclePercentage: GATTBodyPercentage?
    
    public var muscleMass: GATTBodyMass?
    
    public var fatFreeMass: GATTBodyMass?
    
    public var softLeanMass: GATTBodyMass?
    
    public var bodyWaterMass: GATTBodyMass?
    
    public var impedance: GATTBodyResistance?
    
    public var weight: GATTBodyMass?
    
    public var height: GATTBodyMass?
    
    public init(bodyFatPercentage: GATTBodyPercentage,
                timeStamp: GATTDateTime? = nil,
                userIdentifier: UInt8? = nil,
                basalMetabolism: GATTBodyEnergy? = nil,
                musclePercentage: GATTBodyPercentage? = nil,
                muscleMass: GATTBodyMass? = nil,
                fatFreeMass: GATTBodyMass? = nil,
                softLeanMass: GATTBodyMass? = nil,
                bodyWaterMass: GATTBodyMass? = nil,
                impedance: GATTBodyResistance? = nil,
                weight: GATTBodyMass? = nil,
                height: GATTBodyMass? = nil) {
        
        self.bodyFatPercentage = bodyFatPercentage
        self.timestamp = timeStamp
        self.userIdentifier = userIdentifier
        self.basalMetabolism = basalMetabolism
        self.musclePercentage = musclePercentage
        self.muscleMass = muscleMass
        self.fatFreeMass = fatFreeMass
        self.softLeanMass = softLeanMass
        self.bodyWaterMass = bodyWaterMass
        self.impedance = impedance
        self.weight = weight
        self.height = height
    }
    
    public init?(data: Data) {
        
        guard data.count >= type(of: self).minimunLength
            else { return nil }
        
        let flags = BitMaskOptionSet<Flag>(rawValue: UInt16(littleEndian: UInt16(bytes: (data[0], data[1]))))
        
        let massUnit = flags.contains(.measurementUnitSI) ? MassUnit.kilogram : MassUnit.kilogram
        
        self.bodyFatPercentage = GATTBodyPercentage(rawValue: UInt16(littleEndian: UInt16(bytes: (data[2], data[3]))))!
        
        var index = 3
        
        if flags.contains(.timestamp) {
            
            guard index + GATTDateTime.length < data.count
                else { return nil }
            
            let timestampData = Data(data[index + 1 ... index + GATTDateTime.length])
            
            guard let timestamp = GATTDateTime(data: timestampData)
                else { return nil }
            
            self.timestamp = timestamp
            
            index += GATTDateTime.length
        } else {
            
            self.timestamp = nil
        }
        
        if flags.contains(.userID) {
            
            guard index + 1 < data.count
                else { return nil }
            
            self.userIdentifier = data[index + 1]
            
            index += 1
        } else {
            
            self.userIdentifier = nil
        }
        
        if flags.contains(.basalMetabolism) {
            
            guard index + MemoryLayout<UInt16>.size < data.count
                else { return nil }
            
            self.basalMetabolism = GATTBodyEnergy(rawValue: UInt16(littleEndian: UInt16(bytes: (data[index + 1], data[index + 2]))))
            
            index += MemoryLayout<UInt16>.size
        } else {
            
            self.basalMetabolism = nil
        }
        
        if flags.contains(.musclePercentage) {
            
            guard index + MemoryLayout<UInt16>.size < data.count
                else { return nil }
            
            self.musclePercentage = GATTBodyPercentage(rawValue: UInt16(littleEndian: UInt16(bytes: (data[index + 1], data[index + 2]))))
            
            index += MemoryLayout<UInt16>.size
        } else {
            
            self.basalMetabolism = nil
        }
        
        if flags.contains(.muscleMass) {
            
            guard index + MemoryLayout<UInt16>.size < data.count
                else { return nil }
            
            self.muscleMass = GATTBodyMass(rawValue: UInt16(littleEndian: UInt16(bytes: (data[index + 1], data[index + 2]))), unit: massUnit)
            
            index += MemoryLayout<UInt16>.size
        } else {
            
            self.muscleMass = nil
        }
        
        if flags.contains(.fatFreeMass) {
            
            guard index + MemoryLayout<UInt16>.size < data.count
                else { return nil }
            
            self.fatFreeMass = GATTBodyMass(rawValue: UInt16(littleEndian: UInt16(bytes: (data[index + 1], data[index + 2]))), unit: massUnit)
            
            index += MemoryLayout<UInt16>.size
        } else {
            
            self.fatFreeMass = nil
        }
        
        if flags.contains(.softLeanMass) {
            
            guard index + MemoryLayout<UInt16>.size < data.count
                else { return nil }
            
            self.softLeanMass = GATTBodyMass(rawValue: UInt16(littleEndian: UInt16(bytes: (data[index + 1], data[index + 2]))), unit: massUnit)
            
            index += MemoryLayout<UInt16>.size
        } else {
            
            self.softLeanMass = nil
        }
        
        if flags.contains(.bodyWaterMass) {
            
            guard index + MemoryLayout<UInt16>.size < data.count
                else { return nil }
            
            self.bodyWaterMass = GATTBodyMass(rawValue: UInt16(littleEndian: UInt16(bytes: (data[index + 1], data[index + 2]))), unit: massUnit)
            
            index += MemoryLayout<UInt16>.size
        } else {
            
            self.bodyWaterMass = nil
        }
        
        if flags.contains(.impedance) {
            
            guard index + MemoryLayout<UInt16>.size < data.count
                else { return nil }
            
            self.impedance = GATTBodyResistance(rawValue: UInt16(littleEndian: UInt16(bytes: (data[index + 1], data[index + 2]))))
            
            index += MemoryLayout<UInt16>.size
        } else {
            
            self.impedance = nil
        }
        
        if flags.contains(.weight) {
            
            self.weight = nil
        }
    }
    
    public var data: Data {
        
        return Data()
    }
    
    /// These flags define which data fields are present in the Characteristic value.
    internal enum Flag: UInt16, BitMaskOption {
        
        #if swift(>=3.2)
        #elseif swift(>=3.0)
        public typealias RawValue = UInt16
        #endif
        
        /// Measurement Units
        /// SI
        case measurementUnitSI = 0b00
        
        /// Imperial
        case measurementUnitImperial = 0b01
        
        /// Time Stamp Present
        case timestamp = 0b10
        
        /// User ID present
        case userID = 0b100
        
        /// Basal Metabolism present
        case basalMetabolism = 0b1000
        
        /// Muscle Percentage present
        case musclePercentage = 0b10000
        
        /// Muscle Mass present
        case muscleMass = 0b100000
        
        /// Fat Free Mass present
        case fatFreeMass = 0b1000000
        
        /// Soft Lean Mass present
        case softLeanMass = 0b10000000
        
        /// Body Water Mass present
        case bodyWaterMass = 0b100000000
        
        /// Impedance present
        case impedance = 0b1000000000
        
        /// Weight present
        case weight = 0b10000000000
        
        /// Height present
        case height = 0b100000000000
        
        /// Multiple Packet Measurement
        case multiplePacket = 0b1000000000000
        
        public static var all: Set<Flag> =
            [.measurementUnitSI,
             .measurementUnitImperial,
             .timestamp,
             .userID,
             .basalMetabolism,
             .musclePercentage,
             .muscleMass,
             .fatFreeMass,
             .softLeanMass,
             .bodyWaterMass,
             .impedance,
             .weight,
             .height,
             .multiplePacket]
    }
}

// MARK: - Unit of measurement -
public enum MassUnit: UInt16 {
    
    /// Mass kilogram
    case kilogram = 0x2702
    
    /// Mass pound
    case pound = 0x27B8
    
    public init?(unit: UnitIdentifier) {
        
        self.init(rawValue: unit.rawValue)
    }
    
    public var unit: UnitIdentifier {
        
        return UnitIdentifier(rawValue: rawValue)
    }
}

public enum LenghtUnit: UInt16 {
    
    /// Lenght metre
    case metre = 0x2701
    
    /// lenght inch
    case inch = 0x27A2
    
    public init?(unit: UnitIdentifier) {
        
        self.init(rawValue: unit.rawValue)
    }
    
    public var unit: UnitIdentifier {
        
        return UnitIdentifier(rawValue: rawValue)
    }
}

// MARK: - BluetoothUnits -
public struct GATTBodyPercentage: BluetoothUnit {
    
    internal static let length = MemoryLayout<UInt16>.size
    
    public static let min = GATTBodyPercentage(0)
    
    public static let max = GATTBodyPercentage(100)
    
    public static var unitType: UnitIdentifier { return .percentage }
    
    public var rawValue: UInt16
    
    public init?(rawValue value: UInt16) {
        
        guard value <= GATTBodyPercentage.max.rawValue,
            value >= GATTBodyPercentage.min.rawValue
            else { return nil }
        
        self.rawValue = value
    }
    
    private init(_ unsafe: UInt16) {
        
        self.rawValue = unsafe
    }
}

extension GATTBodyPercentage: Equatable {
    
    public static func == (lhs: GATTBodyPercentage, rhs: GATTBodyPercentage) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

extension GATTBodyPercentage: CustomStringConvertible {
    
    public var description: String {
        
        return "\(rawValue)%"
    }
}

public struct GATTBodyEnergy: BluetoothUnit {
    
    internal static let length = MemoryLayout<UInt16>.size
    
    public static var unitType: UnitIdentifier { return .energy }
    
    public var rawValue: UInt16
    
    public init?(rawValue value: UInt16) {
        
        self.rawValue = value
    }
    
    private init(_ unsafe: UInt16) {
        
        self.rawValue = unsafe
    }
}

extension GATTBodyEnergy: Equatable {
    
    public static func == (lhs: GATTBodyEnergy, rhs: GATTBodyEnergy) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

extension GATTBodyEnergy: CustomStringConvertible {
    
    public var description: String {
        
        return "\(rawValue)%"
    }
}

public struct GATTBodyResistance: BluetoothUnit {
    
    internal static let length = MemoryLayout<UInt16>.size
    
    public static var unitType: UnitIdentifier { return .electricResistance }
    
    public var rawValue: UInt16
    
    public init?(rawValue value: UInt16) {
        
        self.rawValue = value
    }
    
    private init(_ unsafe: UInt16) {
        
        self.rawValue = unsafe
    }
}

extension GATTBodyResistance: Equatable {
    
    public static func == (lhs: GATTBodyResistance, rhs: GATTBodyResistance) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

extension GATTBodyResistance: CustomStringConvertible {
    
    public var description: String {
        
        return "\(rawValue)%"
    }
}

public struct GATTBodyMass {
    
    internal static let length = MemoryLayout<UInt16>.size
    
    public var unit: MassUnit
    
    public var rawValue: UInt16
    
    public init?(rawValue value: UInt16, unit: MassUnit) {
        
        self.rawValue = value
        self.unit = unit
    }
}

public struct GATTBodyMassSI: BluetoothUnit {
    
    internal static let length = MemoryLayout<UInt16>.size
    
    public static var unitType: UnitIdentifier { return .kilogram }
    
    public var rawValue: UInt16
    
    public init?(rawValue value: UInt16) {
        
        self.rawValue = value
    }
    
    private init(_ unsafe: UInt16) {
        
        self.rawValue = unsafe
    }
}

extension GATTBodyMassSI: Equatable {
    
    public static func == (lhs: GATTBodyMassSI, rhs: GATTBodyMassSI) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

extension GATTBodyMassSI: CustomStringConvertible {
    
    public var description: String {
        
        return "\(rawValue)%"
    }
}

public struct GATTBodyMassImperial: BluetoothUnit {
    
    internal static let length = MemoryLayout<UInt16>.size
    
    public static var unitType: UnitIdentifier { return .pound }
    
    public var rawValue: UInt16
    
    public init?(rawValue value: UInt16) {
        
        self.rawValue = value
    }
    
    private init(_ unsafe: UInt16) {
        
        self.rawValue = unsafe
    }
}

extension GATTBodyMassImperial: Equatable {
    
    public static func == (lhs: GATTBodyMassImperial, rhs: GATTBodyMassImperial) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

extension GATTBodyMassImperial: CustomStringConvertible {
    
    public var description: String {
        
        return "\(rawValue)%"
    }
}

public struct GATTBodyLengthSI: BluetoothUnit {
    
    internal static let length = MemoryLayout<UInt16>.size
    
    public static var unitType: UnitIdentifier { return .metre }
    
    public var rawValue: UInt16
    
    public init?(rawValue value: UInt16) {
        
        self.rawValue = value
    }
    
    private init(_ unsafe: UInt16) {
        
        self.rawValue = unsafe
    }
}

extension GATTBodyLengthSI: Equatable {
    
    public static func == (lhs: GATTBodyLengthSI, rhs: GATTBodyLengthSI) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

extension GATTBodyLengthSI: CustomStringConvertible {
    
    public var description: String {
        
        return "\(rawValue)%"
    }
}

public struct GATTLengthImperial: BluetoothUnit {
    
    internal static let length = MemoryLayout<UInt16>.size
    
    public static var unitType: UnitIdentifier { return .inch }
    
    public var rawValue: UInt16
    
    public init?(rawValue value: UInt16) {
        
        self.rawValue = value
    }
    
    private init(_ unsafe: UInt16) {
        
        self.rawValue = unsafe
    }
}

extension GATTLengthImperial: Equatable {
    
    public static func == (lhs: GATTLengthImperial, rhs: GATTLengthImperial) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

extension GATTLengthImperial: CustomStringConvertible {
    
    public var description: String {
        
        return "\(rawValue)%"
    }
}
