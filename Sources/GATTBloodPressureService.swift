//
//  GATTBloodPressureService.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/6/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

public struct GATTBloodPressureService: GATTProfileService {
    
    public static let UUID: BluetoothUUID = .bloodPressure
    
    public struct BloodPressureMeasurement: GATTProfileCharacteristic {
        
        public static var UUID: BluetoothUUID { return .bloodPressureMeasurement }
        
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
                
                guard let meanArterialPressure = MilimetreOfMercuryUnit(rawValue: UInt16(littleEndian: UInt16(bytes: (data[index+5], data[index+6]))))
                    else { return nil }
                
                compoundField = .mmHg(systolic, diastolic, meanArterialPressure)
                
            } else {
                
                guard let systolic = PascalUnit(rawValue: UInt16(littleEndian: UInt16(bytes: (data[index+1], data[index+2]))))
                    else { return nil }
                
                guard let diastolic = PascalUnit(rawValue: UInt16(littleEndian: UInt16(bytes: (data[index+3], data[index+4]))))
                    else { return nil }
                
                guard let meanArterialPressure = PascalUnit(rawValue: UInt16(littleEndian: UInt16(bytes: (data[index+5], data[index+6]))))
                    else { return nil }
                
                compoundField = .kPa(systolic, diastolic, meanArterialPressure)
            }
            
            index += 6
            
            if flags.contains(.timestamp) {
                
                // TODO: change this to timestamp
                let diatolic = UInt16(littleEndian: UInt16(bytes: (data[index+1], data[index+2])))
                fields.append(.timestamp(diatolic))
                
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
                fields.append(.measurementStatus(measurementStatus))
            }
        }
        
       public var data: Data {
            
            let data = Data([flags.rawValue]) + compoundField.data
            
            return fields.reduce(data, { $0.0 + $0.1.data })
        }
        
        public enum Flag: UInt8, BitMaskOption, CustomStringConvertible {
            
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
            
            case timestamp(UInt16)
            
            case pulseRate(UInt16)
            
            case userID(UInt8)
            
            case measurementStatus(UInt16)
            
            var data: Data {
                
                switch self {
                    
                case .timestamp(let datetime):
                    
                    return Data([datetime.bytes.0, datetime.bytes.1])
                    
                case .pulseRate(let rate):
                    
                    let bytes = rate.littleEndian.bytes
                    
                    return Data([bytes.0, bytes.1])
                    
                case .userID(let userid):
                    
                    return Data([userid])
                    
                case .measurementStatus(let status):
                    
                    let bytes = status.littleEndian.bytes
                    
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
        
    }
    
}
