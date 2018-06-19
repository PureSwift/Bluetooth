//
//  GATTCGMMeasurement.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/19/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/*+
 CGM Measurement
 
 The CGM Measurement characteristic is a variable length structure containing one or more CGM Measurement records, each comprising a Size field, a Flags Field, a Glucose Concentration field, a Time Offset field, a Sensor Status Annunciation field (optional), a CGM Trend Information Field (optional), a CGM Quality Field (optional), and an E2E-CRC Field (mandatory if this feature is supported).
 
 [CGM Measurement](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.cgm_measurement.xml)
 
 
 - Note:
 The fields in the above table are in the order of LSO to MSO. Where LSO = Least Significant Octet and MSO = Most Significant Octet
 
 C1: Optional if device supports CGM Trend Information (Bit 15 is set in CGM Feature) otherwise excluded.
 
 C2: Optional if device supports CGM Quality (Bit 16 is set in CGM Feature) otherwise excluded.
 
 C3: Mandatory if device supports E2E-CRC (Bit 12 is set in CGM Feature) otherwise excluded.
 
 C4: Optional if bit 5 or bit 6 or bit 7 of the flgas field is set to “1”, otherwise excluded.
 */

public struct GATTCGMMeasurement: GATTCharacteristic {
    
    public static var uuid: BluetoothUUID { return .cgmMeasurement }
    
    internal static let length = MemoryLayout<UInt16>.size
    
    public var size: Size
    
    public var glucoseConcentration: MilligramPerDecilitre
    
    public var timeOffset: Minute
    
    public var trendInformationField: MilligramPerDecilitre?
    
    public var qualityField: Percentage?
    
    public var sensorStatusAnnunciationField: SFloat?
    
    public var quality: MilligramPerDecilitre?
    
    internal var flags: BitMaskOptionSet<Flag> {
        
        var flags = BitMaskOptionSet<Flag>()
        
        if trendInformationField != nil {
            
            flags.insert(.trendInformation)
        }
        
        if qualityField != nil {
            
            flags.insert(.quality)
        }
        
        if sensorStatusAnnunciationField != nil {
            
            flags.insert(.warningOctet)
            flags.insert(.tempOctet)
            flags.insert(.statusOctet)
        }
        
        return flags
    }
    
    public init(size: Size, glucoseConcentration: MilligramPerDecilitre, timeOffset: Minute) {
        
        self.size = size
        self.glucoseConcentration = glucoseConcentration
        self.timeOffset = timeOffset
    }
    
    public init?(data: Data) {
        
        guard data.count >= type(of: self).length
            else { return nil }
        
        guard let size = Size(rawValue: data[0])
            else { return nil }
        
        guard let glucoseConcentration = MilligramPerDecilitre(rawValue: SFloat(builtin: UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))))
            else { return nil }
        
        guard let timeOffset = Minute(rawValue: UInt16(littleEndian: UInt16(bytes: (data[1], data[2]))))
            else { return nil }
        
        self.init(size: size, glucoseConcentration: glucoseConcentration, timeOffset: timeOffset)
    }
    
    public var data: Data {
        
        return Data([size.rawValue])
    }
}

public extension GATTCGMMeasurement {
 
    public enum CGMSensorStatusAnnunciation: UInt32, BitMaskOption {
        
        /// Session Stopped
        case sessionStopped = 0b01
        
        /// Device Battery Low
        case deviceBatteryLow = 0b10
        
        /// Sensor type incorrect for device
        case sensorTypeIncorrectForDevice = 0b100
        
        /// Sensor malfunction
        case sensorMalfunction = 0b1000
        
        /// Device Specific Alert
        case deviceSpecificAlert = 0b10000
        
        /// General device fault has occurred in the sensor
        case generalDeviceFaultInSensor = 0b100000
        
        /// Time synchronization between sensor and collector required
        case timeSyncBetweenSensorAndCollectionRequired = 0b1_00000000
        
        /// Calibration not allowed
        case calibrationNotAllowed = 0b10_00000000
        
        /// Calibration recommended
        case calidationRecommended = 0b100_00000000
        
        /// Calibration required
        case calibrationRequired = 0b1000_00000000
        
        /// Sensor Temperature too high for valid test/result at time of measurement
        case senroTempTooHigh = 0b10000_00000000
        
        /// Sensor temperature too low for valid test/result at time of measurement
        case sensorTempTooLow = 0b100000_00000000
        
        /// Sensor result lower than the Patient Low level
        case sensorResultLowerThanPatientLowLevel = 0b1_00000000_00000000
        
        /// Sensor result higher than the Patient High level
        case sensorResultHigherThanPatientHighLevel = 0b10_00000000_00000000
        
        /// Sensor result lower than the Hypo level
        case sensorResultLowerThanHypoLevel = 0b100_00000000_00000000
        
        /// Sensor result higher than the Hyper level
        case sensorResultHigherThanHyperLevel = 0b1000_00000000_00000000
        
        /// Sensor Rate of Decrease exceeded
        case sensorRateOfDecreaseExceeded = 0b100000_0000000_00000000
        
        /// Sensor Rate of Increase exceeded
        case sensorRateOfIncreaseExceeded = 0b100000_00000000_00000000
        
        /// Sensor result lower than the device can process
        case sensorResultLowerThanDeviceCanProcess = 0b1000000_00000000_00000000
        
        /// Sensor result higher than the device can process
        case sensorResultHigherThanDeviceCanProcess = 0b1000000_00000000_000000000
        
        public static let all: Set<CGMSensorStatusAnnunciation> = [
            .sessionStopped,
            .deviceBatteryLow,
            .sensorTypeIncorrectForDevice,
            .sensorMalfunction,
            .deviceSpecificAlert,
            .generalDeviceFaultInSensor,
            .timeSyncBetweenSensorAndCollectionRequired,
            .calibrationNotAllowed,
            .calidationRecommended,
            .calibrationRequired,
            .senroTempTooHigh,
            .sensorTempTooLow,
            .sensorResultLowerThanPatientLowLevel,
            .sensorResultHigherThanPatientHighLevel,
            .sensorResultLowerThanHypoLevel,
            .sensorResultHigherThanHyperLevel,
            .sensorRateOfDecreaseExceeded,
            .sensorRateOfIncreaseExceeded,
            .sensorResultLowerThanDeviceCanProcess,
            .sensorResultHigherThanDeviceCanProcess
        ]
    }
}

public extension GATTCGMMeasurement {
    
    public struct Percentage: BluetoothUnit {
        
        internal static let length = MemoryLayout<UInt16>.size
        
        public static var unitType: UnitIdentifier { return .percentage }
        
        public var rawValue: SFloat
        
        public init(rawValue value: SFloat) {
            
            self.rawValue = value
        }
        
        private init(_ unsafe: SFloat) {
            
            self.rawValue = unsafe
        }
    }
}

public extension GATTCGMMeasurement {
    
    public enum Flag: UInt8, BitMaskOption {
        
        /// CGM Trend Information Present
        case trendInformation = 0b01
        
        /// CGM Quality Present
        case quality = 0b10
        
        /// Sensor Status Annunciation Field, Warning-Octet present
        case warningOctet = 0b10000
        
        /// Sensor Status Annunciation Field, Cal/Temp-Octet present
        case tempOctet = 0b100000
        
        /// Sensor Status Annunciation Field, Status-Octet present
        case statusOctet = 0b1000000
        
        public static let all: Set<Flag> = [
            .trendInformation,
            .quality,
            .warningOctet,
            .tempOctet,
            .statusOctet
        ]
    }
}

public extension GATTCGMMeasurement {
    
    public struct Size: RawRepresentable {
        
        internal static let min = Size(6)
        
        public var rawValue: UInt8
        
        public init?(rawValue: UInt8) {
            
            guard rawValue >= Size.min.rawValue
                else { return nil }
            
            self.rawValue = rawValue
        }
        
        private init(_ unsafe: UInt8) {
            
            self.rawValue = unsafe
        }
    }
}

extension GATTCGMMeasurement.Size: Equatable {
    
    public static func == (lhs: GATTCGMMeasurement.Size, rhs: GATTCGMMeasurement.Size) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

extension GATTCGMMeasurement.Size: CustomStringConvertible {
    
    public var description: String {
        
        return rawValue.description
    }
}

public extension GATTCGMMeasurement {
    
    public struct MilligramPerDecilitre: BluetoothUnit {
        
        public static var unitType: UnitIdentifier { return .milligramPerDecilitre }
        
        public let rawValue: SFloat
        
        public init?(rawValue: SFloat) {
            
            self.rawValue = rawValue
        }
        
        private init(_ unsafe: SFloat) {
            
            self.rawValue = unsafe
        }
    }
}

extension GATTCGMMeasurement.MilligramPerDecilitre: Equatable {
    
    public static func == (lhs: GATTCGMMeasurement.MilligramPerDecilitre, rhs: GATTCGMMeasurement.MilligramPerDecilitre) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

extension GATTCGMMeasurement.MilligramPerDecilitre: CustomStringConvertible {
    
    public var description: String {
        
        return rawValue.description
    }
}

public extension GATTCGMMeasurement {
    
    public struct Minute: BluetoothUnit {
        
        public static var unitType: UnitIdentifier { return .minute }
        
        public let rawValue: UInt16
        
        public init?(rawValue: UInt16) {
            
            self.rawValue = rawValue
        }
        
        private init(_ unsafe: UInt16) {
            
            self.rawValue = unsafe
        }
    }
}

extension GATTCGMMeasurement.Minute: Equatable {
    
    public static func == (lhs: GATTCGMMeasurement.Minute, rhs: GATTCGMMeasurement.Minute) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

extension GATTCGMMeasurement.Minute: CustomStringConvertible {
    
    public var description: String {
        
        return rawValue.description
    }
}
