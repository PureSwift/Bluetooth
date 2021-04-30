//
//  GATTBloodPressureManagement.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation
import Bluetooth

/**
 Blood Pressure Measurement
 
 The Blood Pressure Measurement characteristic shall be used to send Blood Pressure measurements. Included in the characteristic are a Flags field (containing units of Blood Pressure and used to show presence of optional fields), the Blood Pressure Measurement Compound Value field and, depending upon the contents of the Flags field, Time Stamp (time of the measurement), Pulse Rate, User ID and Measurement Status fields.
 
 - SeeAlso: [Blood Pressure Measurement](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.blood_pressure_measurement.xml)
 */
@frozen
public struct GATTBloodPressureMeasurement: GATTCharacteristic {
    
    public static var uuid: BluetoothUUID { return .bloodPressureMeasurement }
    
    internal static let length = MemoryLayout<UInt8>.size
    
    /// The Flags field is included in the Blood Pressure Measurement characteristic.
    /// Reserved for Future Use (RFU) bits in the Flags field shall be set to 0.
    internal var flags: BitMaskOptionSet<Flag> {
        
        var flags = BitMaskOptionSet<Flag>()
        
        if case .kPa = compoundValue.unit {
            
            flags.insert(.bloodPressureUnits)
        }
        
        if timestamp != nil {
            
            flags.insert(.timestamp)
        }
        
        if pulseRate != nil {
            
            flags.insert(.pulseRate)
        }
        
        if userIdentifier != nil {
            
            flags.insert(.userID)
        }
        
        if measurementStatus != nil {
            
            flags.insert(.measurementStatus)
        }
        
        return flags
    }
    
    /// Blood Pressure Measurement Compound Value
    public var compoundValue: CompoundValue
    
    /// Time Stamp
    public var timestamp: GATTDateTime?
    
    /// Pulse Rate
    public var pulseRate: SFloat?
    
    /// User ID
    public var userIdentifier: UInt8?
    
    /// Measurement Status
    public var measurementStatus: BitMaskOptionSet<MeasurementStatus>?
    
    public init(compoundValue: CompoundValue,
                timestamp: GATTDateTime? = nil,
                pulseRate: SFloat? = nil,
                userIdentifier: UInt8? = nil,
                measurementStatus: BitMaskOptionSet<MeasurementStatus>? = nil) {
        
        self.compoundValue = compoundValue
        self.timestamp = timestamp
        self.pulseRate = pulseRate
        self.userIdentifier = userIdentifier
        self.measurementStatus = measurementStatus
    }
    
    public init?(data: Data) {
        
        guard data.count >= type(of: self).length
            else { return nil }
        
        let flags = BitMaskOptionSet<Flag>(rawValue: data[0])
        
        let unit: Unit = flags.contains(.bloodPressureUnits) ? .kPa : .mmHg
        let systolic = SFloat(bitPattern: UInt16(littleEndian: UInt16(bytes: (data[1], data[2]))))
        let diastolic = SFloat(bitPattern: UInt16(littleEndian: UInt16(bytes: (data[3], data[4]))))
        let meanArterialPressure = SFloat(bitPattern: UInt16(littleEndian: UInt16(bytes: (data[5], data[6]))))
        self.compoundValue = CompoundValue(unit: unit, systolic: systolic, diastolic: diastolic, meanArterialPressure: meanArterialPressure)
        
        var index = 6 // last accessed index
        
        if flags.contains(.timestamp) {
            
            guard index + GATTDateTime.length < data.count
                else { return nil }
            
            let timestampData = data.subdataNoCopy(in: index + 1 ..< index + 1 + GATTDateTime.length)
            
            assert(timestampData.count == GATTDateTime.length)
            
            guard let timestamp = GATTDateTime(data: timestampData)
                else { return nil }
            
            self.timestamp = timestamp
            
            index += GATTDateTime.length
            
        } else {
            
            self.timestamp = nil
        }
        
        if flags.contains(.pulseRate) {
            
            guard index + MemoryLayout<UInt16>.size < data.count
                else { return nil }
            
            self.pulseRate = SFloat(bitPattern: UInt16(littleEndian: UInt16(bytes: (data[index + 1], data[index + 2]))))
            
            index += MemoryLayout<UInt16>.size
            
        } else {
            
            self.pulseRate = nil
        }
        
        if flags.contains(.userID) {
            
            guard index + 1 < data.count
                else { return nil }
            
            self.userIdentifier = data[index + 1]
            
            index += 1
            
        } else {
            
            self.pulseRate = nil
        }
        
        if flags.contains(.measurementStatus) {
            
            guard index + MemoryLayout<MeasurementStatus.RawValue>.size < data.count
                else { return nil }
            
            self.measurementStatus = BitMaskOptionSet<MeasurementStatus>(rawValue: UInt16(littleEndian: UInt16(bytes: (data[index + 1], data[index + 2]))))
            
            index += MemoryLayout<MeasurementStatus.RawValue>.size
            
        } else {
            
            self.pulseRate = nil
        }
    }
    
    public var data: Data {
        
        let flags = self.flags
        
        var totalBytes = 7 // flags + compound value
        
        if flags.contains(.timestamp) {
            
            totalBytes += GATTDateTime.length // 7
        }
        
        if flags.contains(.pulseRate) {
            
            totalBytes += MemoryLayout<SFloat>.size // 2
        }
        
        if flags.contains(.userID) {
            
            totalBytes += MemoryLayout<UInt8>.size // 1
        }
        
        if flags.contains(.measurementStatus) {
            
            totalBytes += MemoryLayout<MeasurementStatus.RawValue>.size // 2
        }
        
        let systolicBytes = compoundValue.systolic.littleEndian.bitPattern.bytes
        let distolicBytes = compoundValue.diastolic.littleEndian.bitPattern.bytes
        let meanArterialPressureBytes = compoundValue.meanArterialPressure.bitPattern.bytes
        
        var data = Data([
            flags.rawValue,
            systolicBytes.0,
            systolicBytes.1,
            distolicBytes.0,
            distolicBytes.1,
            meanArterialPressureBytes.0,
            meanArterialPressureBytes.1
            ])
        
        data.reserveCapacity(totalBytes)
        
        if let timestamp = self.timestamp {
            
            data.append(timestamp.data)
        }
        
        if let pulseRate = self.pulseRate {
            
            let bytes = pulseRate.littleEndian.bitPattern.bytes
            
            data += [bytes.0, bytes.1]
        }
        
        if let userIdentifier = self.userIdentifier {
            
            data.append(userIdentifier)
        }
        
        if let measurementStatus = self.measurementStatus {
            
            let bytes = measurementStatus.rawValue.littleEndian.bytes
            
            data += [bytes.0, bytes.1]
        }
        
        assert(data.count == totalBytes, "Encoded data is \(data.count), expected is \(totalBytes)")
        
        return data
    }
    
    /// These flags define which data fields are present in the Characteristic value.
    internal enum Flag: UInt8, BitMaskOption {
        
        /// Blood pressure for Systolic, Diastolic and MAP in units of kPa
        case bloodPressureUnits = 0b01
        
        /// Time Stamp present
        case timestamp = 0b10
        
        /// Pulse Rate present
        case pulseRate = 0b100
        
        /// User ID present
        case userID = 0b1000
        
        /// Measurement Status present
        case measurementStatus = 0b10000
        
        public static let allCases: [Flag] = [.bloodPressureUnits, .timestamp, .pulseRate, .userID, .measurementStatus]
    }
    
    /// Unit of measurement
    public enum Unit: UInt16 {
        
        /// Millimetre of Mercury
        case mmHg = 0x2781
        
        /// Kilo Pascal
        case kPa = 0x2724
        
        public init?(unit: UnitIdentifier) {
            
            self.init(rawValue: unit.rawValue)
        }
        
        public var unit: UnitIdentifier {
            
            return UnitIdentifier(rawValue: rawValue)
        }
    }
    
    /**
     Blood Pressure Measurement Compound Value Field
     
     This Blood Pressure Measurement Compound Value field is composed of three subfields: Systolic, Diastolic and Mean Arterial Pressure (MAP) and is included in the Blood Pressure Measurement characteristic.
     
     If a value for Systolic, Diastolic or MAP subfields is unavailable (e.g. due to an invalid result from a computation step or missing data due to the hardware’s inability to provide a valid measurement), the special short float value NaN (see Section 4) defined in ISO/IEEE 11073-20601a [4] shall be used in each of the unavailable subfields.
     
     If the unit of the Blood Pressure Measurement is in mmHg, bit 0 of the Flags field is set to 0. Otherwise, the unit is kPa and bit 0 of the Flags field is set to 1.
     */
    public struct CompoundValue {
        
        /// Unit of measurement for compound value.
        public var unit: Unit
        
        /// Systolic
        public var systolic: SFloat
        
        /// Diastolic
        public var diastolic: SFloat
        
        /// Mean Arterial Pressure
        public var meanArterialPressure: SFloat
    }
    
    public enum MeasurementStatus: UInt16, BitMaskOption {
        
        case bodyMovement = 0b01
        
        case cuffFit = 0b10
        
        case irregularPulse = 0b100
        
        case pulseRate = 0b1000
        
        case measurementPosition = 0b10000
        
        public static let allCases: [MeasurementStatus] = [
            .bodyMovement,
            .cuffFit,
            .irregularPulse,
            .pulseRate,
            .measurementPosition
        ]
    }
}
