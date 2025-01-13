//
//  GATTObjectSize.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 7/11/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation
import Bluetooth

/**
 Object Size
 
 - SeeAlso: [Object Size](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.object_size.xml)
 */
@frozen
public struct GATTObjectSize: GATTCharacteristic, Equatable {
    
    internal static let length = MemoryLayout<UInt32>.size * 2
    
    public static var uuid: BluetoothUUID { BluetoothUUID.Characteristic.objectSize }
    
    public var currentSize: Size
    
    public var allocatedSize: Size
    
    public init(currentSize: Size, allocatedSize: Size) {
        
        self.currentSize = currentSize
        self.allocatedSize = allocatedSize
    }
    
    public init?<Data: DataContainer>(data: Data) {
        
        guard data.count == Self.length
            else { return nil }
        
        let currentSize = Size(rawValue: UInt32(littleEndian: UInt32(bytes: (data[0], data[1], data[2], data[3]))))
        
        let allocatedSize = Size(rawValue: UInt32(littleEndian: UInt32(bytes: (data[4], data[5], data[6], data[7]))))
        
        self.init(currentSize: currentSize, allocatedSize: allocatedSize)
    }
    
    public var data: Data {
        
        let currentSizeBytes = currentSize.rawValue.littleEndian.bytes
        let allocatedSizeBytes = allocatedSize.rawValue.littleEndian.bytes
        
        return Data([currentSizeBytes.0,
                     currentSizeBytes.1,
                     currentSizeBytes.2,
                     currentSizeBytes.3,
                     allocatedSizeBytes.0,
                     allocatedSizeBytes.1,
                     allocatedSizeBytes.2,
                     allocatedSizeBytes.3
            ])
    }
}

extension GATTObjectSize {
    
    public struct Size: RawRepresentable, Equatable, Hashable {
        
        public var rawValue: UInt32
        
        public init(rawValue: UInt32) {
            
            self.rawValue = rawValue
        }
    }
}
