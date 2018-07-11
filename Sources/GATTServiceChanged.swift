//
//  GATTServiceChanged.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 7/11/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

public struct GATTServiceChanged: GATTCharacteristic {
    
    internal static let length = MemoryLayout<UInt16>.size * 2
    
    public static var uuid: BluetoothUUID { return .serviceChanged }
    
    public var start: AttributeHandleRange
    
    public var end: AttributeHandleRange
    
    public init(start: AttributeHandleRange, end: AttributeHandleRange) {
        
        self.start = start
        self.end = end
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        guard let start = AttributeHandleRange(rawValue: UInt16(littleEndian: UInt16(bytes: (data[0], data[1]))))
            else { return nil }
        
        guard let end = AttributeHandleRange(rawValue: UInt16(littleEndian: UInt16(bytes: (data[2], data[3]))))
            else { return nil }
        
        self.init(start: start, end: end)
    }
    
    public var data: Data {
        
        let startBytes = start.rawValue.littleEndian.bytes
        let endBytes = end.rawValue.littleEndian.bytes
        
        return Data([startBytes.0, startBytes.1, endBytes.0, endBytes.1])
    }
}

extension GATTServiceChanged {
    
    public struct AttributeHandleRange: RawRepresentable {
        
        public static let min = AttributeHandleRange(1)
        
        public static let max = AttributeHandleRange(65535)
        
        public var rawValue: UInt16
        
        public init?(rawValue: UInt16) {
            
            guard (AttributeHandleRange.min.rawValue <= rawValue
                && AttributeHandleRange.max.rawValue >= rawValue)
                else { return nil }
            
            self.rawValue = rawValue
        }
        
        fileprivate init(_ unsafe: UInt16) {
            
            self.rawValue = unsafe
        }
    }
    
}
