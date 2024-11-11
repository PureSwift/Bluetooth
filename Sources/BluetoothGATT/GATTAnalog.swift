//
//  GATTAnalog.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation
import Bluetooth

/**
 Analog
 
 The Analog characteristic is used to read or write the value of one of the IO Module’s analog signals.
 
 - SeeAlso: [Analog](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.analog.xml)
 */
@frozen
public struct GATTAnalog: GATTCharacteristic, Equatable, Hashable {
    
    internal static let length = MemoryLayout<UInt16>.size
    
    public static var uuid: BluetoothUUID { return .analog}
    
    public var analog: UInt16
    
    public init(analog: UInt16) {
        
        self.analog = analog
    }
    
    public init?<Data: DataContainer>(data: Data) {
        
        guard data.count == Self.length
            else { return nil }
        
        self.init(analog: UInt16(littleEndian: UInt16(bytes: (data[0], data[1]))))
    }
    
    public var data: Data {
        
        let bytes = analog.littleEndian.bytes
        return Data([bytes.0, bytes.1])
    }
}

extension GATTAnalog: CustomStringConvertible {
    
    public var description: String {
        
        return analog.description
    }
}
