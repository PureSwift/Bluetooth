//
//  GATTBloodPressureService.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/6/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

public struct GATTBloodPressureService: GATTProfileService {
    
    public static let uuid: BluetoothUUID = .bloodPressure
    
    public struct BloodPressureFeature: GATTProfileCharacteristic {
        
        public static var uuid: BluetoothUUID { return .bloodPressureFeature }
        
        internal static let length = MemoryLayout<UInt16>.size
        
        public var flags: BitMaskOptionSet<Flag>
        
        public init(flags: BitMaskOptionSet<Flag>) {
            
            self.flags = flags
        }
        
        public init?(data: Data) {
            
            guard data.count >= type(of: self).length
                else { return nil }
            
            let flags = BitMaskOptionSet<Flag>(rawValue: UInt16(littleEndian: UInt16(bytes: (data[0], data[1]))))
            
            self.init(flags: flags)
        }
        
        public var data: Data {
            
            let bytes = flags.rawValue.littleEndian.bytes
            
            return Data([bytes.0, bytes.1])
        }
        
        public enum Flag: UInt16, BitMaskOption {
            
            internal static let length = MemoryLayout<UInt16>.size
            
            #if swift(>=3.2)
            #elseif swift(>=3.0)
            public typealias RawValue = UInt16
            #endif
            
            case bodyMovementDetectionSupport = 0b01
            
            case cuttFitDetectionSupport = 0b10
            
            case irregularPulseDetectionSupport = 0b100
            
            case pulseRateRageDetectionSupport = 0b1000
            
            case measurementPositionDetectionSupport = 0b10000
            
            case multipleBondSupport = 0b100000
            
            public static let all: Set<Flag> = [
                .bodyMovementDetectionSupport,
                .cuttFitDetectionSupport,
                .irregularPulseDetectionSupport,
                .pulseRateRageDetectionSupport,
                .measurementPositionDetectionSupport,
                .multipleBondSupport
            ]
            
        }
        
    }
    
    public struct BloodPressureMeasurement: GATTProfileCharacteristic {
        
        public static var uuid: BluetoothUUID { return .bloodPressureMeasurement }
        
        internal static let length = MemoryLayout<UInt8>.size
        
        public var flags: BitMaskOptionSet<Flag>
        
        public var compoundField: BloodPressureUnits
        
        public var fields = [BloodPressureField]()
        
        public init?(data: Data) {
            
            guard data.count >= type(of: self).length
                else { return nil }
            
            flags = BitMaskOptionSet<Flag>(rawValue: data[0])
            
            var index = 0
            
            if flags.contains(.bloodPressureUnits) {
                
                guard let systolic = MilimetreOfMercuryUnit(rawValue: UInt16(littleEndian: UInt16(bytes: (data[index+1], data[index+2]))))
                    else { return nil }
                
                guard let diastolic = MilimetreOfMercuryUnit(rawValue: UInt16(littleEndian: UInt16(bytes: (data[index+3], data[index+4]))))
                    else { return nil }
                
                guard let map = MilimetreOfMercuryUnit(rawValue: UInt16(littleEndian: UInt16(bytes: (data[index+5], data[index+6]))))
                    else { return nil }
                
                compoundField = .mmHg(systolic, diastolic, map)
                
            } else {
                
                guard let systolic = PascalUnit(rawValue: UInt16(littleEndian: UInt16(bytes: (data[index+1], data[index+2]))))
                    else { return nil }
                
                guard let diastolic = PascalUnit(rawValue: UInt16(littleEndian: UInt16(bytes: (data[index+3], data[index+4]))))
                    else { return nil }
                
                guard let map = PascalUnit(rawValue: UInt16(littleEndian: UInt16(bytes: (data[index+5], data[index+6]))))
                    else { return nil }
                
                compoundField = .kPa(systolic, diastolic, map)
            }
            
            index += 6
            
            if flags.contains(.timestamp) {
                
                guard let datetime = DateTime(data: data.subdata(in: (index..<DateTime.length)))
                    else { return nil }
                
                fields.append(.timestamp(datetime))
                
                index += 7
            }
            
            if flags.contains(.pulseRate) {
                
                let pulseRate = UInt16(littleEndian: UInt16(bytes: (data[index+1], data[index+2])))
                fields.append(.pulseRate(pulseRate))
                
                index += 2
            }
            
            if flags.contains(.userID) {
                
                let userID = data[index+1]
                fields.append(.userID(userID))
                
                index += 1
            }
            
            if flags.contains(.measurementStatus) {
                
                let measurementStatus = UInt16(littleEndian: UInt16(bytes: (data[index+1], data[index+2])))
                
                guard let flag = MeasurementStatusFlag(rawValue: measurementStatus)
                    else { return nil }
                
                fields.append(.measurementStatus(flag))
            }
        }
        
        public var data: Data {
            
            let data = Data([flags.rawValue]) + compoundField.data
            
            return fields.reduce(data, { $0.0 + $0.1.data })
        }
        
        public enum Flag: UInt8, BitMaskOption, CustomStringConvertible {
            
            #if swift(>=3.2)
            #elseif swift(>=3.0)
            public typealias RawValue = UInt8
            #endif
            
            case bloodPressureUnits = 0b01
            
            case timestamp = 0b10
            
            case pulseRate = 0b100
            
            case userID = 0b1000
            
            case measurementStatus = 0b10000
            
            public static var all: Set<Flag> = [.bloodPressureUnits, .timestamp, .pulseRate, .userID, .measurementStatus]
            
            var data: Data {
                
                return Data([rawValue])
            }
            
            public var description: String {
                
                return rawValue.description
            }
        }
        
        public enum BloodPressureField {
            
            case timestamp(DateTime)
            
            case pulseRate(UInt16)
            
            case userID(UInt8)
            
            case measurementStatus(MeasurementStatusFlag)
            
            var data: Data {
                
                switch self {
                    
                case .timestamp(let datetime):
                    
                    return datetime.data
                    
                case .pulseRate(let rate):
                    
                    let bytes = rate.littleEndian.bytes
                    
                    return Data([bytes.0, bytes.1])
                    
                case .userID(let userid):
                    
                    return Data([userid])
                    
                case .measurementStatus(let status):
                    
                    let bytes = status.rawValue.littleEndian.bytes
                    
                    return Data([bytes.0, bytes.1])
                }
            }
        }
        
        public enum BloodPressureUnits {
            
            case mmHg(MilimetreOfMercuryUnit, MilimetreOfMercuryUnit, MilimetreOfMercuryUnit)
            
            case kPa(PascalUnit, PascalUnit, PascalUnit)
            
            var data: Data {
                
                switch self {
                case .mmHg(let systolic, let diastolic, let map):
                    
                    let systolicBytes = systolic.value.littleEndian.bytes
                    let diastolicBytes = diastolic.value.littleEndian.bytes
                    let mapBytes = map.value.littleEndian.bytes
                    
                    return Data([systolicBytes.0, systolicBytes.1, diastolicBytes.0, diastolicBytes.1, mapBytes.0, mapBytes.1])
                    
                case .kPa(let systolic, let diastolic, let map):
                    
                    let systolicBytes = systolic.value.littleEndian.bytes
                    let diastolicBytes = diastolic.value.littleEndian.bytes
                    let mapBytes = map.value.littleEndian.bytes
                    
                    return Data([systolicBytes.0, systolicBytes.1, diastolicBytes.0, diastolicBytes.1, mapBytes.0, mapBytes.1])
                }
            }
        }
        
        public struct DateTime: GATTProfileCharacteristic {
            
            public static var uuid: BluetoothUUID { return .dateTime }
            
            internal static let length = 7
            
            public var year: YearUnit
            
            public var month: MonthUnit
            
            public var day: DayUnit
            
            public var hour: HourUnit
            
            public var minutes: MinuteUnit
            
            public var seconds: SecondUnit
            
            public init(year: YearUnit, month: MonthUnit, day: DayUnit, hour: HourUnit, minutes: MinuteUnit, seconds: SecondUnit) {
                
                self.year = year
                self.month = month
                self.day = day
                self.hour = hour
                self.minutes = minutes
                self.seconds = seconds
            }
            
            public init?(data: Data) {
                
                guard data.count == type(of: self).length
                    else { return nil }
                
                guard let year = YearUnit(rawValue: UInt16(littleEndian: UInt16(bytes: (data[0], data[1]))))
                    else {return nil }
                
                guard let month = MonthUnit(rawValue: data[2])
                    else { return nil }
                
                guard let day = DayUnit(rawValue: data[3])
                    else { return nil }
                
                guard let hour = HourUnit(rawValue: data[4])
                    else { return nil }
                
                guard let minutes = MinuteUnit(rawValue: data[5])
                    else { return nil }
                
                guard let seconds = SecondUnit(rawValue: data[6])
                    else { return nil }
                
                self.init(year: year, month: month, day: day, hour: hour, minutes: minutes, seconds: seconds)
            }
            
            public var data: Data {
                
                let yearBytes = year.rawValue.bytes
                
                return Data([yearBytes.0, yearBytes.1, month.rawValue, day.rawValue, hour.rawValue, minutes.rawValue, seconds.rawValue])
            }
            
        }
        
        public enum MeasurementStatusFlag: UInt16, BitMaskOption {
            
            internal static let length = MemoryLayout<UInt16>.size
            
            #if swift(>=3.2)
            #elseif swift(>=3.0)
            public typealias RawValue = UInt16
            #endif
            
            case bodyMovementDetection = 0b01
            
            case cuffFitDetection = 0b10
            
            case irregularPulseDetection = 0b100
            
            case pulseRateRageDetection = 0b1000
            
            case measurementPositionDetection = 0b10000
            
            public static let all: Set<MeasurementStatusFlag> = [
                .bodyMovementDetection,
                .cuffFitDetection,
                .irregularPulseDetection,
                .pulseRateRageDetection,
                .measurementPositionDetection
            ]
            
        }
        
    }
    
}
