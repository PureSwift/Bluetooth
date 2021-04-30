//
//  GATTCrossTrainerData.swift
//  Bluetooth
//
//  Created by Jorge Loc Rubio on 6/27/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation
/**
 Cross Trainer Data
 
 The Cross Trainer Data characteristic is used to send training-related data to the Client from a cross trainer (Server).
 
 - SeeAlso: [Cross Trainer Data](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.cross_trainer_data.xml)
 */
@frozen
public struct GATTCrossTrainerData {
    
    internal static let minimumLength = MemoryLayout<UInt24>.size
    
    public static var uuid: BluetoothUUID { return .crossTrainerData }
    
    internal var flags: BitMaskOptionSet<Flag> {
        
        var flags = BitMaskOptionSet<Flag>()
        
        if instantaneousSpeed != nil {
            
            flags.insert(.moreData)
        }
        
        if averageSpeed != nil {
            
            flags.insert(.averageSpeed)
        }
        
        if totalDistance != nil {
            
            flags.insert(.totalDistance)
        }
        
        if stepPerMinute != nil && averageStepRate != nil {
            
            flags.insert(.stepCount)
        }
        
        if strideCount != nil {
            
            flags.insert(.strideCount)
        }
        
        if positiveElevationGain != nil && negativeElevationGain != nil {
            
            flags.insert(.elevationGain)
        }
        
        if inclination != nil && rampAngleSetting != nil {
            
            flags.insert(.inclinationAndRampAngleSetting)
        }
        
        if resistanceLevel != nil {
            
            flags.insert(.resistanceLevel)
        }
        
        if instantaneousPower != nil {
            
            flags.insert(.instantaneousPower)
        }
        
        if averagePower != nil {
            
            flags.insert(.averagePower)
        }
        
        if totalEnergy != nil &&
            energyPerHour != nil &&
            energyPerMinute != nil {
            
            flags.insert(.expendedEnergy)
        }
        
        if heartRate != nil {
            
            flags.insert(.heartRate)
        }
        
        if metabolicEquivalent != nil {
            
            flags.insert(.metabolicEquivalent)
        }
        
        if elapsedTime != nil {
            
            flags.insert(.elapsedTime)
        }
        
        if remainingTime != nil {
            
            flags.insert(.remainingTime)
        }
        
        return flags
    }
    
    public var instantaneousSpeed: KilometerPerHour?
    
    public var averageSpeed: KilometerPerHour?
    
    public var totalDistance: Metre.Bit24?
    
    public var stepPerMinute: StepPerMinute?
    
    public var averageStepRate: StepPerMinute?
    
    public var strideCount: Unitless.Unsigned?
    
    public var positiveElevationGain: Metre.Bits16?
    
    public var negativeElevationGain: Metre.Bits16?
    
    public var inclination: Percentage?
    
    public var rampAngleSetting: PlainAngleDegree?
    
    public var resistanceLevel: Unitless.Signed?
    
    public var instantaneousPower: Power?
    
    public var averagePower: Power?
    
    public var totalEnergy: GATTKilogramCalorie.Bits16?
    
    public var energyPerHour: GATTKilogramCalorie.Bits16?
    
    public var energyPerMinute: GATTKilogramCalorie.Byte?
    
    public var heartRate: GATTBeatsPerMinute.Byte?
    
    public var metabolicEquivalent: MetabolicEquivalent?
    
    public var elapsedTime: Time?
    
    public var remainingTime: Time?
    
    public init(instantaneousSpeed: KilometerPerHour? = nil,
                averageSpeed: KilometerPerHour? = nil,
                totalDistance: Metre.Bit24? = nil,
                stepPerMinute: StepPerMinute? = nil,
                averageStepRate: StepPerMinute? = nil,
                strideCount: Unitless.Unsigned? = nil,
                positiveElevationGain: Metre.Bits16? = nil,
                negativeElevationGain: Metre.Bits16? = nil,
                inclination: Percentage? = nil,
                rampAngleSetting: PlainAngleDegree? = nil,
                resistanceLevel: Unitless.Signed? = nil,
                instantaneousPower: Power? = nil,
                averagePower: Power? = nil,
                totalEnergy: GATTKilogramCalorie.Bits16? = nil,
                energyPerHour: GATTKilogramCalorie.Bits16? = nil,
                energyPerMinute: GATTKilogramCalorie.Byte? = nil,
                heartRate: GATTBeatsPerMinute.Byte? = nil,
                metabolicEquivalent: MetabolicEquivalent? = nil,
                elapsedTime: Time? = nil,
                remainingTime: Time? = nil) {
        
        self.instantaneousSpeed = instantaneousSpeed
        self.averageSpeed = averageSpeed
        self.totalDistance = totalDistance
        self.stepPerMinute = stepPerMinute
        self.averageStepRate = averageStepRate
        self.strideCount = strideCount
        self.positiveElevationGain = positiveElevationGain
        self.negativeElevationGain = negativeElevationGain
        self.inclination = inclination
        self.rampAngleSetting = rampAngleSetting
        self.resistanceLevel = resistanceLevel
        self.instantaneousPower = instantaneousPower
        self.averagePower = averagePower
        self.totalEnergy = totalEnergy
        self.energyPerHour = energyPerHour
        self.energyPerMinute = energyPerMinute
        self.heartRate = heartRate
        self.metabolicEquivalent = metabolicEquivalent
        self.elapsedTime = elapsedTime
        self.remainingTime = remainingTime
    }
    
    // swiftlint:disable:next cyclomatic_complexity
    public init?(data: Data) {
        
        guard data.count >= type(of: self).minimumLength
            else { return nil }
        
        let flags = BitMaskOptionSet<Flag>(rawValue: UInt32(littleEndian: UInt32(bytes: (data[0], data[1], data[2], 0))))
        
        var index = 2 // flags size
        
        if flags.contains(.moreData) {
            
            guard index + KilometerPerHour.length < data.count
                else { return nil }
            
            self.instantaneousSpeed = KilometerPerHour(rawValue: UInt16(littleEndian: UInt16(bytes: (data[index + 1], data[index + 2]))))
            
            index += KilometerPerHour.length
        } else {
            
            self.instantaneousSpeed = nil
        }
        
        if flags.contains(.averageSpeed) {
            
            guard index + KilometerPerHour.length < data.count
                else { return nil }
            
            self.averageSpeed = KilometerPerHour(rawValue: UInt16(littleEndian: UInt16(bytes: (data[index + 1], data[index + 2]))))
            
            index += KilometerPerHour.length
        } else {
            
            self.averageSpeed = nil
        }
        
        if flags.contains(.totalDistance) {
            
            guard index + MemoryLayout<UInt16>.size + MemoryLayout<UInt8>.size < data.count
                else { return nil }
            
            self.totalDistance = Metre.Bit24(rawValue: UInt24(littleEndian: UInt24(bytes: (data[index + 1], data[index + 2], data[index + 3]))))
            
            index += MemoryLayout<UInt16>.size + MemoryLayout<UInt8>.size
        } else {
            
            self.totalDistance = nil
        }
        
        if flags.contains(.stepCount) {
            
            guard index + StepPerMinute.length + StepPerMinute.length < data.count
                else { return nil }
            
            self.stepPerMinute = StepPerMinute(rawValue: UInt16(littleEndian: UInt16(bytes: (data[index + 1], data[index + 2]))))
            
            self.averageStepRate = StepPerMinute(rawValue: UInt16(littleEndian: UInt16(bytes: (data[index + 3], data[index + 4]))))
            
            index += StepPerMinute.length * 2
        } else {
            
            self.stepPerMinute = nil
            self.averageStepRate = nil
        }
        
        if flags.contains(.strideCount) {
            
            guard index + Unitless.Unsigned.length < data.count
                else { return nil }
            
            self.strideCount = Unitless.Unsigned(rawValue: UInt16(littleEndian: UInt16(bytes: (data[index + 1], data[index + 2]))))
            
            index += Unitless.Unsigned.length
        } else {
            
            self.strideCount = nil
        }
        
        if flags.contains(.elevationGain) {
            
            guard index + Metre.Bits16.length + Metre.Bits16.length < data.count
                else { return nil }
            
            self.positiveElevationGain = Metre.Bits16(rawValue: UInt16(littleEndian: UInt16(bytes: (data[index + 1], data[index + 2]))))
            
            self.negativeElevationGain = Metre.Bits16(rawValue: UInt16(littleEndian: UInt16(bytes: (data[index + 3], data[index + 4]))))
            
            index += Metre.Bits16.length * 2
        } else {
            
            self.positiveElevationGain = nil
            self.negativeElevationGain = nil
        }
        
        if flags.contains(.inclinationAndRampAngleSetting) {
            
            guard index + Percentage.length + PlainAngleDegree.length < data.count
                else { return nil }
            
            self.inclination = Percentage(rawValue: Int16(bitPattern: UInt16(littleEndian: UInt16(bytes: (data[index + 1], data[index + 2])))))
            
            self.rampAngleSetting = PlainAngleDegree(rawValue: Int16(bitPattern: UInt16(littleEndian: UInt16(bytes: (data[index + 3], data[index + 4])))))
            
            index += Percentage.length + PlainAngleDegree.length
        } else {
            
            self.inclination = nil
            self.rampAngleSetting = nil
        }
        
        if flags.contains(.resistanceLevel) {
            
            guard index + Unitless.Signed.length < data.count
                else { return nil }
            
            self.resistanceLevel = Unitless.Signed(rawValue: Int16(bitPattern: UInt16(littleEndian: UInt16(bytes: (data[index + 1], data[index + 2])))))
            
            index += Unitless.Signed.length
        } else {
            
            self.resistanceLevel = nil
        }
        
        if flags.contains(.instantaneousPower) {
            
            guard index + Power.length < data.count
                else { return nil }
            
            self.instantaneousPower = Power(rawValue: Int16(bitPattern: UInt16(littleEndian: UInt16(bytes: (data[index + 1], data[index + 2])))))
            
            index += Power.length
        } else {
            
            self.instantaneousPower = nil
        }
        
        if flags.contains(.averagePower) {
            
            guard index + Power.length < data.count
                else { return nil }
            
            self.averagePower = Power(rawValue: Int16(bitPattern: UInt16(littleEndian: UInt16(bytes: (data[index + 1], data[index + 2])))))
            
            index += Power.length
        } else {
            
            self.averagePower = nil
        }
        
        if flags.contains(.expendedEnergy) {
            
            guard index + GATTKilogramCalorie.Bits16.length * 2 + GATTKilogramCalorie.Byte.length < data.count
                else { return nil }
            
            self.totalEnergy = GATTKilogramCalorie.Bits16(rawValue: UInt16(littleEndian: UInt16(bytes: (data[index + 1], data[index + 2]))))
            
            self.energyPerHour = GATTKilogramCalorie.Bits16(rawValue: UInt16(littleEndian: UInt16(bytes: (data[index + 3], data[index + 4]))))
            
            self.energyPerMinute = GATTKilogramCalorie.Byte(rawValue: data[index + 5])
            
            index += GATTKilogramCalorie.Bits16.length * 2 + GATTKilogramCalorie.Byte.length
        } else {
            
            self.averageSpeed = nil
            self.energyPerHour = nil
            self.energyPerMinute = nil
        }
        
        if flags.contains(.heartRate) {
            
            guard index + GATTBeatsPerMinute.Byte.length < data.count
                else { return nil }
            
            self.heartRate = GATTBeatsPerMinute.Byte(rawValue: data[index + 1])
            
            index += GATTBeatsPerMinute.Byte.length
        } else {
            
            self.heartRate = nil
        }
        
        if flags.contains(.metabolicEquivalent) {
            
            guard index + MetabolicEquivalent.length < data.count
                else { return nil }
            
            self.metabolicEquivalent = MetabolicEquivalent(rawValue: data[index + 1])
            
            index += MetabolicEquivalent.length
        } else {
            
            self.metabolicEquivalent = nil
        }
        
        if flags.contains(.elapsedTime) {
            
            guard index + Time.length < data.count
                else { return nil }
            
            self.elapsedTime = Time(rawValue: UInt16(littleEndian: UInt16(bytes: (data[index + 1], data[index + 2]))))
            
            index += Time.length
        } else {
            
            self.elapsedTime = nil
        }
        
        if flags.contains(.remainingTime) {
            
            guard index + Time.length < data.count
                else { return nil }
            
            self.remainingTime = Time(rawValue: UInt16(littleEndian: UInt16(bytes: (data[index + 1], data[index + 2]))))
            
            index += Time.length
        } else {
            
            self.remainingTime = nil
        }
    }
    
    public var data: Data {
        
        let flags = self.flags
        
        var totalBytes = MemoryLayout<UInt24>.size //flag size
        
        if flags.contains(.moreData) {
            
            totalBytes += KilometerPerHour.length
        }
        
        if flags.contains(.averageSpeed) {
            
            totalBytes += KilometerPerHour.length
        }
        
        if flags.contains(.totalDistance) {
            
            totalBytes += MemoryLayout<UInt24>.size
        }
        
        if flags.contains(.stepCount) {
            
            totalBytes += StepPerMinute.length * 2
        }
        
        if flags.contains(.strideCount) {
            
            totalBytes += Unitless.Unsigned.length
        }
        
        if flags.contains(.elevationGain) {
            
            totalBytes += Metre.Bits16.length * 2
        }
        
        if flags.contains(.inclinationAndRampAngleSetting) {
            
            totalBytes += Percentage.length + PlainAngleDegree.length
        }
        
        if flags.contains(.resistanceLevel) {
            
            totalBytes += Unitless.Signed.length
        }
        
        if flags.contains(.instantaneousPower) {
            
            totalBytes += Power.length
        }
        
        if flags.contains(.averagePower) {
            
            totalBytes += Power.length
        }
        
        if flags.contains(.expendedEnergy) {
            
            totalBytes += GATTKilogramCalorie.Byte.length
        }
        
        if flags.contains(.heartRate) {
            
            totalBytes += GATTBeatsPerMinute.Byte.length
        }
        
        if flags.contains(.metabolicEquivalent) {
            
            totalBytes += MetabolicEquivalent.length
        }
        
        if flags.contains(.elapsedTime) {
            
            totalBytes += Time.length
        }
        
        if flags.contains(.remainingTime) {
            
            totalBytes += Time.length
        }
        
        let flagBytes = flags.rawValue.littleEndian.bytes
        
        var data = Data([
            flagBytes.0,
            flagBytes.1,
            flagBytes.2
            ])
        
        data.reserveCapacity(totalBytes)
        
        if let instantaneousSpeed = self.instantaneousSpeed {
            
            let bytes = instantaneousSpeed.rawValue.littleEndian.bytes
            
            data += [bytes.0, bytes.1]
        }
        
        if let averageSpeed = self.averageSpeed {
            
            let bytes = averageSpeed.rawValue.littleEndian.bytes
            
            data += [bytes.0, bytes.1]
        }
        
        if let totalDistance = self.totalDistance {
            
            let bytes = totalDistance.rawValue.littleEndian.bytes //24bits
            
            data += [bytes.0, bytes.1, bytes.2]
        }
        
        if let stepPerMinute = self.stepPerMinute {
            
            let bytes = stepPerMinute.rawValue.littleEndian.bytes
            
            data += [bytes.0, bytes.1]
        }
        
        if let averageStepRate = self.averageStepRate {
            
            let bytes = averageStepRate.rawValue.littleEndian.bytes
            
            data += [bytes.0, bytes.1]
        }
        
        if let strideCount = self.strideCount {
            
            let bytes = strideCount.rawValue.littleEndian.bytes
            
            data += [bytes.0, bytes.1]
        }
        
        if let positiveElevationGain = self.positiveElevationGain {
            
            let bytes = positiveElevationGain.rawValue.littleEndian.bytes
            
            data += [bytes.0, bytes.1]
        }
        
        if let negativeElevationGain = self.negativeElevationGain {
            
            let bytes = negativeElevationGain.rawValue.littleEndian.bytes
            
            data += [bytes.0, bytes.1]
        }
        
        if let inclination = self.inclination {
            
            let bytes = UInt16(bitPattern: inclination.rawValue).littleEndian.bytes
            
            data += [bytes.0, bytes.1]
        }
        
        if let rampAngleSetting = self.rampAngleSetting {
            
            let bytes = UInt16(bitPattern: rampAngleSetting.rawValue).littleEndian.bytes
            
            data += [bytes.0, bytes.1]
        }
        
        if let resistanceLevel = self.resistanceLevel {
            
            let bytes = UInt16(bitPattern: resistanceLevel.rawValue).littleEndian.bytes
            
            data += [bytes.0, bytes.1]
        }
        
        if let instantaneousPower = self.instantaneousPower {
            
            let bytes = UInt16(bitPattern: instantaneousPower.rawValue).littleEndian.bytes
            
            data += [bytes.0, bytes.1]
        }
        
        if let averagePower = self.averagePower {
            
            let bytes = UInt16(bitPattern: averagePower.rawValue).littleEndian.bytes
            
            data += [bytes.0, bytes.1]
        }
        
        if let totalEnergy = self.totalEnergy {
            
            let bytes = totalEnergy.rawValue.littleEndian.bytes
            
            data += [bytes.0, bytes.1]
        }
        
        if let energyPerHour = self.energyPerHour {
            
            let bytes = energyPerHour.rawValue.littleEndian.bytes
            
            data += [bytes.0, bytes.1]
        }
        
        if let energyPerMinute = self.energyPerMinute {
            
            data += [energyPerMinute.rawValue]
        }
        
        if let hearRate = self.heartRate {
            
            data += [hearRate.rawValue]
        }
        
        if let metabolicEquivalent = self.metabolicEquivalent {

            data += [metabolicEquivalent.rawValue]
        }
        
        if let elapsedTime = self.elapsedTime {
            
            let bytes = elapsedTime.rawValue.littleEndian.bytes
            
            data += [bytes.0, bytes.1]
        }
        
        if let remainingTime = self.remainingTime {
            
            let bytes = remainingTime.rawValue.littleEndian.bytes
            
            data += [bytes.0, bytes.1]
        }
        
        return data
    }
    
    /// These flags define which data fields are present in the Characteristic value.
    internal enum Flag: UInt32, BitMaskOption {
        
        /// More Data
        case moreData = 0b01
        
        /// Average Speed present
        case averageSpeed = 0b10
        
        /// Total Distance Present
        case totalDistance = 0b100
        
        /// Step Count present
        case stepCount = 0b1000
        
        /// Stride Count present
        case strideCount = 0b10000
        
        /// Elevation Gain present
        case elevationGain = 0b100000
        
        /// Inclination and Ramp Angle Setting present
        case inclinationAndRampAngleSetting = 0b1000000
        
        /// Resistance Level Present
        case resistanceLevel = 0b10000000
        
        /// Instantaneous Power present
        case instantaneousPower = 0b100000000
        
        /// Average Power present
        case averagePower = 0b1000000000
        
        /// Expended Energy present
        case expendedEnergy = 0b10000000000
        
        /// Heart Rate present
        case heartRate = 0b100000000000
        
        /// Metabolic Equivalent present
        case metabolicEquivalent = 0b1000000000000
        
        // Elapsed Time present
        case elapsedTime = 0b10000000000000
        
        // Remaining Time present
        case remainingTime = 0b100000000000000
        
        // Movement Direction
        case movementDirection = 0b1000000000000000
        
        public static let allCases: [Flag] = [
            .moreData,
            .averageSpeed,
            .totalDistance,
            .stepCount,
            .strideCount,
            .elevationGain,
            .inclinationAndRampAngleSetting,
            .resistanceLevel,
            .instantaneousPower,
            .averagePower,
            .expendedEnergy,
            .heartRate,
            .metabolicEquivalent,
            .elapsedTime,
            .remainingTime,
            .movementDirection
        ]
    }
}

extension GATTCrossTrainerData {
    
    public struct KilometerPerHour: BluetoothUnit {
        
        internal static let length = MemoryLayout<UInt16>.size
        
        public static var unitType: UnitIdentifier { return .kilometrePerHour }
        
        public var rawValue: UInt16
        
        public init(rawValue: UInt16) {
            
            self.rawValue = rawValue
        }
    }
    
    public enum Metre {
        
        public struct Bit24: BluetoothUnit {
            
            internal static let length = MemoryLayout<UInt24>.size
            
            public static var unitType: UnitIdentifier { return .metre }
            
            public var rawValue: UInt24
            
            public init(rawValue: UInt24) {
                
                self.rawValue = rawValue
            }
        }
        
        public struct Bits16: BluetoothUnit {
            
            internal static let length = MemoryLayout<UInt16>.size
            
            public static var unitType: UnitIdentifier { return .metre }
            
            public var rawValue: UInt16
            
            public init(rawValue: UInt16) {
                
                self.rawValue = rawValue
            }
        }
        
    }
    
    public struct StepPerMinute: BluetoothUnit {
        
        internal static let length = MemoryLayout<UInt16>.size
        
        public static var unitType: UnitIdentifier { return .step }
        
        public var rawValue: UInt16
        
        public init(rawValue: UInt16) {
            
            self.rawValue = rawValue
        }
    }
    
    public enum Unitless {
        
        public struct Unsigned: BluetoothUnit {
            
            internal static let length = MemoryLayout<UInt16>.size
            
            public static var unitType: UnitIdentifier { return .unitless }
            
            public var rawValue: UInt16
            
            public init(rawValue: UInt16) {
                
                self.rawValue = rawValue
            }
        }
        
        public struct Signed: BluetoothUnit {
            
            internal static let length = MemoryLayout<Int16>.size
            
            public static var unitType: UnitIdentifier { return .unitless }
            
            public var rawValue: Int16
            
            public init(rawValue: Int16) {
                
                self.rawValue = rawValue
            }
        }
    }
    
    public struct Percentage: BluetoothUnit {
        
        internal static let length = MemoryLayout<Int16>.size
        
        public static var unitType: UnitIdentifier { return .percentage }
        
        public var rawValue: Int16
        
        public init(rawValue: Int16) {
            
            self.rawValue = rawValue
        }
    }
    
    public struct PlainAngleDegree: BluetoothUnit {
        
        internal static let length = MemoryLayout<Int16>.size
        
        public static var unitType: UnitIdentifier { return .degree }
        
        public var rawValue: Int16
        
        public init(rawValue: Int16) {
            
            self.rawValue = rawValue
        }
    }
    
    public struct Power: BluetoothUnit {
        
        internal static let length = MemoryLayout<Int16>.size
        
        public static var unitType: UnitIdentifier { return .power }
        
        public var rawValue: Int16
        
        public init(rawValue: Int16) {
            
            self.rawValue = rawValue
        }
    }
    
    public struct MetabolicEquivalent: BluetoothUnit {
        
        internal static let length = MemoryLayout<UInt8>.size
        
        public static var unitType: UnitIdentifier { return .metabolicEquivalent }
        
        public var rawValue: UInt8
        
        public init(rawValue: UInt8) {
            
            self.rawValue = rawValue
        }
    }
    
    public struct Time: BluetoothUnit {
        
        internal static let length = MemoryLayout<UInt16>.size
        
        public static var unitType: UnitIdentifier { return .second }
        
        public var rawValue: UInt16
        
        public init(rawValue: UInt16) {
            
            self.rawValue = rawValue
        }
    }
}

extension GATTCrossTrainerData: Equatable {
    
    public static func == (lhs: GATTCrossTrainerData,
                           rhs: GATTCrossTrainerData) -> Bool {
        
        return lhs.instantaneousSpeed == rhs.instantaneousSpeed &&
        lhs.averageSpeed == rhs.averageSpeed &&
        lhs.totalDistance == rhs.totalDistance &&
        lhs.stepPerMinute == rhs.stepPerMinute &&
        lhs.averageStepRate == rhs.averageStepRate &&
        lhs.strideCount == rhs.strideCount &&
        lhs.positiveElevationGain == rhs.positiveElevationGain &&
        lhs.negativeElevationGain == rhs.negativeElevationGain &&
        lhs.inclination == rhs.inclination &&
        lhs.rampAngleSetting == rhs.rampAngleSetting &&
        lhs.resistanceLevel == rhs.resistanceLevel &&
        lhs.instantaneousPower == rhs.instantaneousPower &&
        lhs.averagePower == rhs.averagePower &&
        lhs.totalEnergy == rhs.totalEnergy &&
        lhs.energyPerHour == rhs.energyPerHour &&
        lhs.energyPerMinute == rhs.energyPerMinute &&
        lhs.heartRate == rhs.heartRate &&
        lhs.metabolicEquivalent == rhs.metabolicEquivalent &&
        lhs.elapsedTime == rhs.elapsedTime &&
        lhs.remainingTime == rhs.remainingTime
    }
}

extension GATTCrossTrainerData.KilometerPerHour: Equatable {
    
    public static func == (lhs: GATTCrossTrainerData.KilometerPerHour,
                           rhs: GATTCrossTrainerData.KilometerPerHour) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

extension GATTCrossTrainerData.KilometerPerHour: CustomStringConvertible {
    
    public var description: String {
        
        return rawValue.description
    }
}

extension GATTCrossTrainerData.KilometerPerHour: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt16) {
        
        self.init(rawValue: value)
    }
}

extension GATTCrossTrainerData.Metre.Bit24: Equatable {
    
    public static func == (lhs: GATTCrossTrainerData.Metre.Bit24,
                           rhs: GATTCrossTrainerData.Metre.Bit24) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

extension GATTCrossTrainerData.Metre.Bit24: CustomStringConvertible {
    
    public var description: String {
        
        return rawValue.description
    }
}

extension GATTCrossTrainerData.Metre.Bits16: Equatable {
    
    public static func == (lhs: GATTCrossTrainerData.Metre.Bits16,
                           rhs: GATTCrossTrainerData.Metre.Bits16) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

extension GATTCrossTrainerData.Metre.Bits16: CustomStringConvertible {
    
    public var description: String {
        
        return rawValue.description
    }
}

extension GATTCrossTrainerData.Metre.Bits16: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt16) {
        
        self.init(rawValue: value)
    }
}

extension GATTCrossTrainerData.StepPerMinute: Equatable {
    
    public static func == (lhs: GATTCrossTrainerData.StepPerMinute,
                           rhs: GATTCrossTrainerData.StepPerMinute) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

extension GATTCrossTrainerData.StepPerMinute: CustomStringConvertible {
    
    public var description: String {
        
        return rawValue.description
    }
}

extension GATTCrossTrainerData.StepPerMinute: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt16) {
        
        self.init(rawValue: value)
    }
}

extension GATTCrossTrainerData.Unitless.Unsigned: Equatable {
    
    public static func == (lhs: GATTCrossTrainerData.Unitless.Unsigned,
                           rhs: GATTCrossTrainerData.Unitless.Unsigned) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

extension GATTCrossTrainerData.Unitless.Unsigned: CustomStringConvertible {
    
    public var description: String {
        
        return rawValue.description
    }
}

extension GATTCrossTrainerData.Unitless.Unsigned: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt16) {
        
        self.init(rawValue: value)
    }
}

extension GATTCrossTrainerData.Unitless.Signed: Equatable {
    
    public static func == (lhs: GATTCrossTrainerData.Unitless.Signed,
                           rhs: GATTCrossTrainerData.Unitless.Signed) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

extension GATTCrossTrainerData.Unitless.Signed: CustomStringConvertible {
    
    public var description: String {
        
        return rawValue.description
    }
}

extension GATTCrossTrainerData.Unitless.Signed: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: Int16) {
        
        self.init(rawValue: value)
    }
}

extension GATTCrossTrainerData.Percentage: Equatable {
    
    public static func == (lhs: GATTCrossTrainerData.Percentage,
                           rhs: GATTCrossTrainerData.Percentage) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

extension GATTCrossTrainerData.Percentage: CustomStringConvertible {
    
    public var description: String {
        
        return rawValue.description
    }
}

extension GATTCrossTrainerData.Percentage: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: Int16) {
        
        self.init(rawValue: value)
    }
}

extension GATTCrossTrainerData.PlainAngleDegree: Equatable {
    
    public static func == (lhs: GATTCrossTrainerData.PlainAngleDegree,
                           rhs: GATTCrossTrainerData.PlainAngleDegree) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

extension GATTCrossTrainerData.PlainAngleDegree: CustomStringConvertible {
    
    public var description: String {
        
        return rawValue.description
    }
}

extension GATTCrossTrainerData.PlainAngleDegree: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: Int16) {
        
        self.init(rawValue: value)
    }
}

extension GATTCrossTrainerData.Power: Equatable {
    
    public static func == (lhs: GATTCrossTrainerData.Power,
                           rhs: GATTCrossTrainerData.Power) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

extension GATTCrossTrainerData.Power: CustomStringConvertible {
    
    public var description: String {
        
        return rawValue.description
    }
}

extension GATTCrossTrainerData.Power: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: Int16) {
        
        self.init(rawValue: value)
    }
}

extension GATTCrossTrainerData.MetabolicEquivalent: Equatable {
    
    public static func == (lhs: GATTCrossTrainerData.MetabolicEquivalent,
                           rhs: GATTCrossTrainerData.MetabolicEquivalent) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

extension GATTCrossTrainerData.MetabolicEquivalent: CustomStringConvertible {
    
    public var description: String {
        
        return rawValue.description
    }
}

extension GATTCrossTrainerData.MetabolicEquivalent: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt8) {
        
        self.init(rawValue: value)
    }
}

extension GATTCrossTrainerData.Time: Equatable {
    
    public static func == (lhs: GATTCrossTrainerData.Time,
                           rhs: GATTCrossTrainerData.Time) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

extension GATTCrossTrainerData.Time: CustomStringConvertible {
    
    public var description: String {
        
        return rawValue.description
    }
}

extension GATTCrossTrainerData.Time: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt16) {
        
        self.init(rawValue: value)
    }
}
