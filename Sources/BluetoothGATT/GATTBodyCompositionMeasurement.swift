//
//  GATTBodyCompositionMeasurement.swift
//  Bluetooth
//
//  Created by Jorge Loc Rubio on 6/18/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Bluetooth

/// Body Composition Measurement
///
/// - SeeAlso: [Body Composition Measurement](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.body_composition_measurement.xml)
@frozen
public struct GATTBodyCompositionMeasurement: GATTCharacteristic {

    internal static let minimumLength = MemoryLayout<UInt32>.size

    public static var uuid: BluetoothUUID { BluetoothUUID.Characteristic.bodyCompositionMeasurement }

    internal var flags: Flag {

        var flags = Flag()

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

    public var muscleMass: BodyMass?

    public var fatFreeMass: BodyMass?

    public var softLeanMass: BodyMass?

    public var bodyWaterMass: BodyMass?

    public var impedance: GATTBodyResistance?

    public var weight: BodyMass?

    public var height: BodyLength?

    public let massUnit: MassUnit

    public let lengthUnit: LengthUnit

    public init(
        bodyFatPercentage: GATTBodyPercentage,
        massUnit: MassUnit,
        lengthUnit: LengthUnit,
        timeStamp: GATTDateTime? = nil,
        userIdentifier: UInt8? = nil,
        basalMetabolism: GATTBodyEnergy? = nil,
        musclePercentage: GATTBodyPercentage? = nil,
        muscleMass: BodyMass? = nil,
        fatFreeMass: BodyMass? = nil,
        softLeanMass: BodyMass? = nil,
        bodyWaterMass: BodyMass? = nil,
        impedance: GATTBodyResistance? = nil,
        weight: BodyMass? = nil,
        height: BodyLength? = nil
    ) {

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
        self.massUnit = massUnit
        self.lengthUnit = lengthUnit
    }

    // swiftlint:disable:next cyclomatic_complexity
    public init?<Data: DataContainer>(data: Data) {

        guard data.count >= Self.minimumLength
        else { return nil }

        let flags = Flag(rawValue: UInt16(littleEndian: UInt16(bytes: (data[0], data[1]))))

        massUnit = flags.contains(.measurementUnitImperial) ? .pound : .kilogram

        lengthUnit = flags.contains(.measurementUnitImperial) ? .inch : .metre

        self.bodyFatPercentage = GATTBodyPercentage(rawValue: UInt16(littleEndian: UInt16(bytes: (data[2], data[3]))))

        var index = 3

        if flags.contains(.timestamp) {

            guard index + GATTDateTime.length < data.count
            else { return nil }

            let timestampData = data.subdata(in: index + 1..<index + 1 + GATTDateTime.length)

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

            self.muscleMass = BodyMass(rawValue: UInt16(littleEndian: UInt16(bytes: (data[index + 1], data[index + 2]))), unit: massUnit)

            index += MemoryLayout<UInt16>.size
        } else {

            self.muscleMass = nil
        }

        if flags.contains(.fatFreeMass) {

            guard index + MemoryLayout<UInt16>.size < data.count
            else { return nil }

            self.fatFreeMass = BodyMass(rawValue: UInt16(littleEndian: UInt16(bytes: (data[index + 1], data[index + 2]))), unit: massUnit)

            index += MemoryLayout<UInt16>.size
        } else {

            self.fatFreeMass = nil
        }

        if flags.contains(.softLeanMass) {

            guard index + MemoryLayout<UInt16>.size < data.count
            else { return nil }

            self.softLeanMass = BodyMass(rawValue: UInt16(littleEndian: UInt16(bytes: (data[index + 1], data[index + 2]))), unit: massUnit)

            index += MemoryLayout<UInt16>.size
        } else {

            self.softLeanMass = nil
        }

        if flags.contains(.bodyWaterMass) {

            guard index + MemoryLayout<UInt16>.size < data.count
            else { return nil }

            self.bodyWaterMass = BodyMass(rawValue: UInt16(littleEndian: UInt16(bytes: (data[index + 1], data[index + 2]))), unit: massUnit)

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

            guard index + MemoryLayout<UInt16>.size < data.count
            else { return nil }

            self.weight = BodyMass(rawValue: UInt16(littleEndian: UInt16(bytes: (data[index + 1], data[index + 2]))), unit: massUnit)

            index += MemoryLayout<UInt16>.size
        } else {

            self.weight = nil
        }

        if flags.contains(.height) {

            guard index + MemoryLayout<UInt16>.size < data.count
            else { return nil }

            self.height = BodyLength(rawValue: UInt16(littleEndian: UInt16(bytes: (data[index + 1], data[index + 2]))), unit: lengthUnit)

            index += MemoryLayout<UInt16>.size
        } else {

            self.height = nil
        }
    }

    public var dataLength: Int {

        let flags = self.flags

        var totalBytes = MemoryLayout<UInt32>.size  //Flags size + Body Fat Percentage size

        if flags.contains(.timestamp) {

            totalBytes += GATTDateTime.length
        }

        if flags.contains(.userID) {

            totalBytes += MemoryLayout<UInt8>.size
        }

        if flags.contains(.basalMetabolism) {

            totalBytes += MemoryLayout<GATTBodyEnergy.RawValue>.size
        }

        if flags.contains(.musclePercentage) {

            totalBytes += MemoryLayout<GATTBodyPercentage.RawValue>.size
        }

        if flags.contains(.muscleMass) {

            totalBytes += MemoryLayout<UInt16>.size
        }

        if flags.contains(.fatFreeMass) {

            totalBytes += MemoryLayout<UInt16>.size
        }

        if flags.contains(.softLeanMass) {

            totalBytes += MemoryLayout<UInt16>.size
        }

        if flags.contains(.bodyWaterMass) {

            totalBytes += MemoryLayout<UInt16>.size
        }

        if flags.contains(.impedance) {

            totalBytes += MemoryLayout<GATTBodyResistance.RawValue>.size
        }

        if flags.contains(.weight) {

            totalBytes += MemoryLayout<UInt16>.size
        }

        if flags.contains(.height) {

            totalBytes += MemoryLayout<UInt16>.size
        }

        return totalBytes
    }

    public func append<Data: DataContainer>(to data: inout Data) {

        let flagBytes = flags.rawValue.littleEndian.bytes
        let bodyfatBytes = bodyFatPercentage.rawValue.littleEndian.bytes

        data += flagBytes.0
        data += flagBytes.1
        data += bodyfatBytes.0
        data += bodyfatBytes.1

        if let timestamp = self.timestamp {

            timestamp.append(to: &data)
        }

        if let userIdentifier = self.userIdentifier {

            data += userIdentifier
        }

        if let basalMetabolism = self.basalMetabolism {

            let bytes = basalMetabolism.rawValue.littleEndian.bytes

            data += bytes.0
            data += bytes.1
        }

        if let musclePercentage = self.musclePercentage {

            let bytes = musclePercentage.rawValue.littleEndian.bytes
            data += bytes.0
            data += bytes.1
        }

        if let muscleMass = self.muscleMass {

            let bytes = muscleMass.rawValue.littleEndian.bytes
            data += bytes.0
            data += bytes.1
        }

        if let fatFreeMass = self.fatFreeMass {

            let bytes = fatFreeMass.rawValue.littleEndian.bytes
            data += bytes.0
            data += bytes.1
        }

        if let softleanMass = self.softLeanMass {

            let bytes = softleanMass.rawValue.littleEndian.bytes
            data += bytes.0
            data += bytes.1
        }

        if let bodyWaterMass = self.bodyWaterMass {

            let bytes = bodyWaterMass.rawValue.littleEndian.bytes
            data += bytes.0
            data += bytes.1
        }

        if let impedance = self.impedance {

            let bytes = impedance.rawValue.littleEndian.bytes
            data += bytes.0
            data += bytes.1
        }

        if let weight = self.weight {

            let bytes = weight.rawValue.littleEndian.bytes
            data += bytes.0
            data += bytes.1
        }

        if let height = self.height {

            let bytes = height.rawValue.littleEndian.bytes
            data += bytes.0
            data += bytes.1
        }
    }

    /// These flags define which data fields are present in the Characteristic value.
    internal struct Flag: OptionSet, Hashable, Sendable, CaseIterable {

        internal let rawValue: UInt16

        internal init(rawValue: UInt16) {
            self.rawValue = rawValue
        }

        /// Measurement Units
        /// SI
        internal static let measurementUnitSI = Flag(rawValue: 0b00)

        /// Imperial
        internal static let measurementUnitImperial = Flag(rawValue: 0b01)

        /// Time Stamp Present
        internal static let timestamp = Flag(rawValue: 0b10)

        /// User ID present
        internal static let userID = Flag(rawValue: 0b100)

        /// Basal Metabolism present
        internal static let basalMetabolism = Flag(rawValue: 0b1000)

        /// Muscle Percentage present
        internal static let musclePercentage = Flag(rawValue: 0b10000)

        /// Muscle Mass present
        internal static let muscleMass = Flag(rawValue: 0b100000)

        /// Fat Free Mass present
        internal static let fatFreeMass = Flag(rawValue: 0b1000000)

        /// Soft Lean Mass present
        internal static let softLeanMass = Flag(rawValue: 0b10000000)

        /// Body Water Mass present
        internal static let bodyWaterMass = Flag(rawValue: 0b100000000)

        /// Impedance present
        internal static let impedance = Flag(rawValue: 0b10_00000000)

        /// Weight present
        internal static let weight = Flag(rawValue: 0b100_00000000)

        /// Height present
        internal static let height = Flag(rawValue: 0b1000_00000000)

        /// Multiple Packet Measurement
        internal static let multiplePacket = Flag(rawValue: 0b10000_00000000)

        internal static let allCases: [Flag] = [
            .measurementUnitSI,
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
            .multiplePacket
        ]
    }

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

    public enum LengthUnit: UInt16 {

        /// Length metre
        case metre = 0x2701

        /// length inch
        case inch = 0x27A2

        public init?(unit: UnitIdentifier) {

            self.init(rawValue: unit.rawValue)
        }

        public var unit: UnitIdentifier {

            return UnitIdentifier(rawValue: rawValue)
        }
    }

    public struct BodyMass {

        public typealias MassUnit = GATTBodyCompositionMeasurement.MassUnit

        internal static let length = MemoryLayout<UInt16>.size

        public var unit: MassUnit

        public var rawValue: UInt16

        public init(rawValue: UInt16, unit: MassUnit) {

            self.rawValue = rawValue
            self.unit = unit
        }
    }

    public struct BodyLength {

        public typealias LengthUnit = GATTBodyCompositionMeasurement.LengthUnit

        internal static let length = MemoryLayout<UInt16>.size

        public var unit: LengthUnit

        public var rawValue: UInt16

        public init(rawValue: UInt16, unit: LengthUnit) {

            self.rawValue = rawValue
            self.unit = unit
        }
    }
}

// MARK: - BluetoothUnits -
@frozen
public struct GATTBodyPercentage: BluetoothUnit {

    internal static let length = MemoryLayout<UInt16>.size

    public static var unitType: UnitIdentifier { return .percentage }

    public var rawValue: UInt16

    public init(rawValue: UInt16) {

        self.rawValue = rawValue
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

extension GATTBodyPercentage: ExpressibleByIntegerLiteral {

    public init(integerLiteral value: UInt16) {

        self.init(rawValue: value)
    }
}

public struct GATTBodyEnergy: BluetoothUnit {

    internal static let length = MemoryLayout<UInt16>.size

    public static var unitType: UnitIdentifier { return .energy }

    public var rawValue: UInt16

    public init(rawValue: UInt16) {

        self.rawValue = rawValue
    }
}

extension GATTBodyEnergy: Equatable {

    public static func == (lhs: GATTBodyEnergy, rhs: GATTBodyEnergy) -> Bool {

        return lhs.rawValue == rhs.rawValue
    }
}

extension GATTBodyEnergy: CustomStringConvertible {

    public var description: String {

        return rawValue.description
    }
}

public struct GATTBodyResistance: BluetoothUnit {

    internal static let length = MemoryLayout<UInt16>.size

    public static var unitType: UnitIdentifier { return .electricResistance }

    public var rawValue: UInt16

    public init(rawValue: UInt16) {

        self.rawValue = rawValue
    }
}

extension GATTBodyResistance: Equatable {

    public static func == (lhs: GATTBodyResistance, rhs: GATTBodyResistance) -> Bool {

        return lhs.rawValue == rhs.rawValue
    }
}

extension GATTBodyResistance: CustomStringConvertible {

    public var description: String {

        return rawValue.description
    }
}

extension GATTBodyCompositionMeasurement.BodyMass: Equatable {

    public static func == (lhs: GATTBodyCompositionMeasurement.BodyMass, rhs: GATTBodyCompositionMeasurement.BodyMass) -> Bool {

        return lhs.rawValue == rhs.rawValue
    }
}

extension GATTBodyCompositionMeasurement.BodyMass: CustomStringConvertible {

    public var description: String {

        return rawValue.description
    }
}

extension GATTBodyCompositionMeasurement.BodyLength: Equatable {

    public static func == (lhs: GATTBodyCompositionMeasurement.BodyLength, rhs: GATTBodyCompositionMeasurement.BodyLength) -> Bool {

        return lhs.rawValue == rhs.rawValue
    }
}

extension GATTBodyCompositionMeasurement.BodyLength: CustomStringConvertible {

    public var description: String {

        return rawValue.description
    }
}
