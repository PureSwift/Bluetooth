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
    
    public init(size: Size) {
        
        self.size = size
    }
    
    public init?(data: Data) {
        
        guard data.count >= type(of: self).length
            else { return nil }
        
        
        self.init(size: data[0])
    }
    
    
    
    public var data: Data {
        
        return Data([bytes.0, bytes.1])
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
