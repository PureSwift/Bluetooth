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
 
 [Cross Trainer Data](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.cross_trainer_data.xml)
 */
public struct GATTCrossTrainerData {
    
    internal static let minimumLength = MemoryLayout<UInt32>.size
    
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
        
        if averagePower != nil {
            
            flags.insert(.averagePower)
        }
        
        if  totalEnergy != nil &&
            energyPerHour != nil &&
            energyPerMinute != nil {
            
            flags.insert(.expendedEnergy)
        }
        
        if hearRate != nil {
            
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
    
    public var instantaneousSpeed: SpeedUnit?
    
    public var averageSpeed: SpeedUnit?
    
    public var totalDistance: LengthUnit.Bit24?
    
    public var stepPerMinute: StepPerMinute?
    
    public var averageStepRate: StepPerMinute?
    
    public var strideCount: Unitless?
    
    public var positiveElevationGain: LengthUnit.Bit16?
    
    public var negativeElevationGain: LengthUnit.Bit16?
    
    public var inclination: Percentage?
    
    public var rampAngleSetting: PlainAngle?
    
    public var resistanceLevel: Unitless?
    
    public var instantaneousPower: Power?
    
    public var averagePower: Power?
    
    public var totalEnergy: Energy?
    
    public var energyPerHour: Energy?
    
    public var energyPerMinute: Energy?
    
    public var hearRate: GATTBeatsPerMinute.Byte?
    
    public var metabolicEquivalent: MetabolicEquivalent?
    
    public var elapsedTime: Time?
    
    public var remainingTime: Time?
    
    // swiftlint:disable:next cyclomatic_complexity
    public init?(data: Data) {
        
        guard data.count >= type(of: self).minimumLength
            else { return nil }
        
        let flags = BitMaskOptionSet<Flag>(rawValue: UInt32(littleEndian: UInt32(bytes: (data[0], data[1], data[2], 0))))
        
        var index = 4 // flags size
        
        if flags.contains(.moreData) {
            
            guard index + SpeedUnit.length < data.count
                else { return nil }
            
            self.instantaneousSpeed = SpeedUnit(rawValue: UInt16(littleEndian: UInt16(bytes: (data[index + 1], data[index + 2]))))
            
            index += SpeedUnit.length
        } else {
            
            self.instantaneousSpeed = nil
        }
        
        if flags.contains(.averageSpeed) {
            
            guard index + SpeedUnit.length < data.count
                else { return nil }
            
            self.averageSpeed = SpeedUnit(rawValue: UInt16(littleEndian: UInt16(bytes: (data[index + 1], data[index + 2]))))
            
            index += SpeedUnit.length
        } else {
            
            self.averageSpeed = nil
        }
        
        if flags.contains(.totalDistance) {
            
            guard index + MemoryLayout<UInt16>.size + MemoryLayout<UInt8>.size < data.count
                else { return nil }
            
            self.totalDistance = LengthUnit.Bit24(rawValue: UInt32(littleEndian: UInt32(bytes: (data[index + 1], data[index + 2], data[index + 3], 0))))
            
            index += MemoryLayout<UInt16>.size + MemoryLayout<UInt8>.size
        } else {
            
            self.totalDistance = nil
        }
        
        if flags.contains(.stepCount) {
            
            guard index + StepPerMinute.length + StepPerMinute.length < data.count
                else { return nil }
            
            self.stepPerMinute = StepPerMinute(rawValue: UInt16(littleEndian: UInt16(bytes: (data[index + 1], data[index + 2]))))
            
            self.averageStepRate = StepPerMinute(rawValue: UInt16(littleEndian: UInt16(bytes: (data[index + 3], data[index + 4]))))
            
            index += StepPerMinute.length + StepPerMinute.length
        } else {
            
            self.stepPerMinute = nil
            self.averageStepRate = nil
        }
        
        if flags.contains(.strideCount) {
            
            guard index + Unitless.length < data.count
                else { return nil }
            
            self.strideCount = Unitless(rawValue: UInt16(littleEndian: UInt16(bytes: (data[index + 1], data[index + 2]))))
            
            index += Unitless.length
        } else {
            
            self.strideCount = nil
        }
        
        if flags.contains(.elevationGain) {
            
            guard index + LengthUnit.Bit16.length + LengthUnit.Bit16.length < data.count
                else { return nil }
            
            self.positiveElevationGain = LengthUnit.Bit16.init(rawValue: UInt16(littleEndian: UInt16(bytes: (data[index + 1], data[index + 2]))))
            
            self.negativeElevationGain = LengthUnit.Bit16.init(rawValue: UInt16(littleEndian: UInt16(bytes: (data[index + 3], data[index + 4]))))
            
            index += LengthUnit.Bit16.length + LengthUnit.Bit16.length
        } else {
            
            self.positiveElevationGain = nil
            self.negativeElevationGain = nil
        }
        
        if flags.contains(.inclinationAndRampAngleSetting) {
            
            guard index + Percentage.length + PlainAngle.length < data.count
                else { return nil }
            
            self.inclination = Percentage(rawValue: UInt16(bytes: (data[index + 1], data[index + 2])))
            
            self.rampAngleSetting = PlainAngle(rawValue: UInt16(bytes: (data[index + 3], data[index + 4])))
            
            index += Percentage.length + PlainAngle.length
        } else {
            
            self.inclination = nil
            self.rampAngleSetting = nil
        }
        
        if flags.contains(.resistanceLevel) {
            
            guard index + Unitless.length < data.count
                else { return nil }
            
            self.resistanceLevel = Unitless(rawValue: UInt16(littleEndian: UInt16(bytes: (data[index + 1], data[index + 2]))))
            
            index += Unitless.length
        } else {
            
            self.resistanceLevel = nil
        }
        
        if flags.contains(.instantaneousPower) {
            
            guard index + Power.length < data.count
                else { return nil }
            
            self.instantaneousPower = Power(rawValue: UInt16(littleEndian: UInt16(bytes: (data[index + 1], data[index + 2]))))
            
            index += Power.length
        } else {
            
            self.instantaneousPower = nil
        }
        
        if flags.contains(.averagePower) {
            
            guard index + Power.length < data.count
                else { return nil }
            
            self.averagePower = Power(rawValue: UInt16(littleEndian: UInt16(bytes: (data[index + 1], data[index + 2]))))
            
            index += Power.length
        } else {
            
            self.averagePower = nil
        }
        
        if flags.contains(.expendedEnergy) {
            
            guard index + Energy.length + Energy.length + Energy.length < data.count
                else { return nil }
            
            self.totalEnergy = Energy(rawValue: UInt16(littleEndian: UInt16(bytes: (data[index + 1], data[index + 2]))))
            
            self.energyPerHour = Energy(rawValue: UInt16(littleEndian: UInt16(bytes: (data[index + 3], data[index + 4]))))
            
            self.energyPerMinute = Energy(rawValue: UInt16(littleEndian: UInt16(bytes: (data[index + 5], data[index + 6]))))
            
            index += Energy.length + Energy.length + Energy.length
        } else {
            
            self.averageSpeed = nil
            self.energyPerHour = nil
            self.energyPerMinute = nil
        }
        
        if flags.contains(.heartRate) {
            
            guard index + GATTBeatsPerMinute.Byte.length < data.count
                else { return nil }
            
            self.hearRate = GATTBeatsPerMinute.Byte(rawValue: data[index + 1])
            
            index += GATTBeatsPerMinute.Byte.length
        } else {
            
            self.hearRate = nil
        }
        
        if flags.contains(.metabolicEquivalent) {
            
            guard index + MetabolicEquivalent.length < data.count
                else { return nil }
            
            self.metabolicEquivalent = MetabolicEquivalent(rawValue: UInt16(littleEndian: UInt16(bytes: (data[index + 1], data[index + 2]))))
            
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
        
        var totalBytes = MemoryLayout<UInt32>.size //flag size
        
        if flags.contains(.moreData) {
            
            totalBytes += SpeedUnit.length
        }
        
        if flags.contains(.averageSpeed) {
            
            totalBytes += SpeedUnit.length
        }
        
        if flags.contains(.totalDistance) {
            
            totalBytes += MemoryLayout<UInt16>.size + MemoryLayout<UInt8>.size
        }
        
        if flags.contains(.stepCount) {
            
            totalBytes += StepPerMinute.length + StepPerMinute.length
        }
        
        if flags.contains(.strideCount) {
            
            totalBytes += Unitless.length
        }
        
        if flags.contains(.elevationGain) {
            
            totalBytes += LengthUnit.Bit16.length + LengthUnit.Bit16.length
        }
        
        if flags.contains(.inclinationAndRampAngleSetting) {
            
            totalBytes += Percentage.length + PlainAngle.length
        }
        
        if flags.contains(.resistanceLevel) {
            
            totalBytes += Unitless.length
        }
        
        if flags.contains(.instantaneousPower) {
            
            totalBytes += Power.length
        }
        
        if flags.contains(.averagePower) {
            
            totalBytes += Power.length
        }
        
        if flags.contains(.expendedEnergy) {
            
            totalBytes += Energy.length + Energy.length + Energy.length
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
            flagBytes.2,
            flagBytes.3
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
            
            let bytes = inclination.rawValue.littleEndian.bytes
            
            data += [bytes.0, bytes.1]
        }
        
        if let rampAngleSetting = self.rampAngleSetting {
            
            let bytes = rampAngleSetting.rawValue.littleEndian.bytes
            
            data += [bytes.0, bytes.1]
        }
        
        if let resistanceLevel = self.resistanceLevel {
            
            let bytes = resistanceLevel.rawValue.littleEndian.bytes
            
            data += [bytes.0, bytes.1]
        }
        
        if let instantaneousPower = self.instantaneousPower {
            
            let bytes = instantaneousPower.rawValue.littleEndian.bytes
            
            data += [bytes.0, bytes.1]
        }
        
        if let averagePower = self.averagePower {
            
            let bytes = averagePower.rawValue.littleEndian.bytes
            
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
            
            let bytes = energyPerMinute.rawValue.littleEndian.bytes
            
            data += [bytes.0, bytes.1]
        }
        
        if let hearRate = self.hearRate {
            
            data.append(hearRate.rawValue)
        }
        
        if let metabolicEquivalent = self.metabolicEquivalent {
            
            let bytes = metabolicEquivalent.rawValue.littleEndian.bytes
            
            data += [bytes.0, bytes.1]
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
        
        #if swift(>=3.2)
        #elseif swift(>=3.0)
        public typealias RawValue = UInt32 //we use 24
        #endif
        
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
        
        public static var all: Set<Flag> = [
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
    
    public struct SpeedUnit: BluetoothUnit {
        
        internal static let length = MemoryLayout<UInt16>.size
        
        public static var unitType: UnitIdentifier { return .kilometrePerHour }
        
        public var rawValue: UInt16
        
        public init(rawValue: UInt16) {
            
            self.rawValue = rawValue
        }
    }
    
    public enum LengthUnit {
    
        public struct Bit24: BluetoothUnit {
            
            internal static let length = MemoryLayout<UInt32>.size
            
            public static var unitType: UnitIdentifier { return .metre }
            
            public var rawValue: UInt32
            
            public init(rawValue: UInt32) {
                
                self.rawValue = rawValue
            }
        }
        
        public struct Bit16: BluetoothUnit {
            
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
    
    public struct Unitless: BluetoothUnit {
        
        internal static let length = MemoryLayout<UInt16>.size
        
        public static var unitType: UnitIdentifier { return .unitless }
        
        public var rawValue: UInt16
        
        public init(rawValue: UInt16) {
            
            self.rawValue = rawValue
        }
    }
    
    public struct Percentage: BluetoothUnit {
        
        internal static let length = MemoryLayout<UInt16>.size
        
        public static var unitType: UnitIdentifier { return .percentage }
        
        public var rawValue: UInt16
        
        public init(rawValue: UInt16) {
            
            self.rawValue = rawValue
        }
    }
    
    public struct PlainAngle: BluetoothUnit {
        
        internal static let length = MemoryLayout<UInt16>.size
        
        public static var unitType: UnitIdentifier { return .degree }
        
        public var rawValue: UInt16
        
        public init(rawValue: UInt16) {
            
            self.rawValue = rawValue
        }
    }
    
    public struct Power: BluetoothUnit {
        
        internal static let length = MemoryLayout<UInt16>.size
        
        public static var unitType: UnitIdentifier { return .power }
        
        public var rawValue: UInt16
        
        public init(rawValue: UInt16) {
            
            self.rawValue = rawValue
        }
    }
    
    public struct Energy: BluetoothUnit {
        
        internal static let length = MemoryLayout<UInt16>.size
        
        public static var unitType: UnitIdentifier { return .kilogramCalorie }
        
        public var rawValue: UInt16
        
        public init(rawValue: UInt16) {
            
            self.rawValue = rawValue
        }
    }
    
    public struct MetabolicEquivalent: BluetoothUnit {
        
        internal static let length = MemoryLayout<UInt16>.size
        
        public static var unitType: UnitIdentifier { return .metabolicEquivalent }
        
        public var rawValue: UInt16
        
        public init(rawValue: UInt16) {
            
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



extension GATTCrossTrainerData.SpeedUnit: Equatable {
    
    public static func == (lhs: GATTCrossTrainerData.SpeedUnit, rhs: GATTCrossTrainerData.SpeedUnit) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

extension GATTCrossTrainerData.SpeedUnit: CustomStringConvertible {
    
    public var description: String {
        
        return rawValue.description
    }
}
