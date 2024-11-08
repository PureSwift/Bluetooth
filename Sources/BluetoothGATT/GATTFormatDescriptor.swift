//
//  GATTFormatDescriptor.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Bluetooth

/// GATT Characteristic Presentation Format Descriptor
///
/// The Characteristic Presentation Format descriptor defines the format of the Characteristic Value.
///
/// One or more Characteristic Presentation Format descriptors may be present.
/// If multiple of these descriptors are present, then a Aggregate Formate descriptor is present.
/// This descriptor is read only and does not require authentication or authorization to read.
/// This descriptor is composed of five parts: format, exponent, unit, name space and description.
/// The Format field determines how a single value contained in the Characteristic Value is formatted.
/// The Exponent field is used with interger data types to determine how the Characteristic Value is furhter formatted.
/// The actual value = Characteristic Value * 10^Exponent.
///
/// Examples:
/// When encoding an IPv4 address, the uint32 Format type is used.
/// When encoding an IPv6 address, the uint128 Format type is used.
/// When encoding a Bluetooth address (BD_ADDR), the uint48 Format type is used.
/// For a Characteristic Value of 23 and an Exponent of 2, the actual value is 2300
/// For a Characteristic Value of 3892 and an Exponent of -3, the actual value is 3.892
@frozen
public struct GATTFormatDescriptor: GATTDescriptor, Hashable, Sendable {
    
    public static var uuid: BluetoothUUID { .characteristicFormat }
        
    public let format: GATTCharacteristicFormatType
    
    public let exponent: Int8
    
    public let unit: UInt16
    
    public let namespace: UInt8
    
    public let description: UInt16
    
    public init(format: GATTCharacteristicFormatType,
                exponent: Int8,
                unit: UInt16,
                namespace: UInt8,
                description: UInt16) {
        
        self.format = format
        self.exponent = exponent
        self.unit = unit
        self.namespace = namespace
        self.description = description
    }
}

extension GATTFormatDescriptor: DataConvertible {
    
    public static var length: Int { 7 }
    
    public init?<Data: DataContainer>(data: Data) {
        
        guard data.count == Self.length
            else { return nil }
        
        guard let format = GATTCharacteristicFormatType(rawValue: data[0])
            else { return nil }
        
        self.init(format: format,
                  exponent: Int8(bitPattern: data[1]),
                  unit: UInt16(littleEndian: UInt16(bytes: (data[2], data[3]))),
                  namespace: data[4],
                  description: UInt16(littleEndian: UInt16(bytes: (data[5], data[6]))))
    }
    
    public func append<Data>(to data: inout Data) where Data : DataContainer {
        data += format.rawValue
        data += UInt8(bitPattern: exponent)
        data += unit.littleEndian
        data += namespace
        data += description.littleEndian
    }
    
    public var dataLength: Int {
        Self.length
    }
}
