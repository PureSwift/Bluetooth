//
//  GATTAnalogOutput.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/15/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation
import Bluetooth

/**
 Analog Output
 
 The Analog Output characteristic represents the value of an analog output as a 16-bit integer (uint16). The format of the analog value depends on the implementation.
 
 - SeeAlso: [Analog Output](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.analog_output.xml)
 */
@frozen
public struct GATTAnalogOutput: GATTCharacteristic, Equatable, Hashable {
    
    internal static let length = MemoryLayout<UInt16>.size
    
    public static var uuid: BluetoothUUID { return .analogOutput}
    
    public var output: UInt16
    
    public init(output: UInt16) {
        
        self.output = output
    }
    
    public init?<Data: DataContainer>(data: Data) {
        
        guard data.count == Self.length
            else { return nil }
        
        self.init(output: UInt16(littleEndian: UInt16(bytes: (data[0], data[1]))))
    }
    
    public var data: Data {
        
        let bytes = output.littleEndian.bytes
        return Data([bytes.0, bytes.1])
    }
}

extension GATTAnalogOutput: CustomStringConvertible {
    
    public var description: String {
        
        return output.description
    }
}
