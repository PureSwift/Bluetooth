//
//  GAPSlaveConnectionIntervalRange.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 
 The Slave Connection Interval Range data type contains the Peripheral’s preferred connection interval range, for all logical connections. See Vol 3, Part C, Section 12.3.
 Note: The minimum value depends on the battery considerations of the Peripheral and the maximum connection interval depends on the buffers available on the Peripheral.
 The Central should use the information from the Peripheral’s Slave Connection Interval Range data type when establishing a connection.
 Note: Central and Peripheral are GAP roles as defined in Vol.3, Part C, Section 2.2.2.
 
 The first 2 octets defines the minimum value for the connection interval in the following manner:
 connIntervalmin = Conn_Interval_Min * 1.25 ms
 Conn_Interval_Min range: 0x0006 to 0x0C80
 Value of 0xFFFF indicates no specific minimum.
 Values not defined above are reserved for future use.
 
 The other 2 octets defines the maximum value for the connection interval in the following manner:
 connIntervalmax = Conn_Interval_Max * 1.25 ms Conn_Interval_Max range: 0x0006 to 0x0C80
 Conn_Interval_Max shall be equal to or greater than the Conn_Interval_Min.
 Value of 0xFFFF indicates no specific maximum.
 Values not defined above are reserved for future use.
 
 */

public struct GAPSlaveConnectionIntervalRange: GAPData {
    
    internal static let length = 4
    
    public static let min: UInt16 = 0x0006
    
    public static let max: UInt16 = 0x0C80
    
    public static let undefined: UInt16 = 0xFFFF
    
    public static let dataType: GAPDataType = .slaveConnectionIntervalRange
    
    public let intervalRange: (UInt16, UInt16)
    
    public init?(intervalRange: (UInt16, UInt16)) {
        
        guard (GAPSlaveConnectionIntervalRange.min <= intervalRange.0 && GAPSlaveConnectionIntervalRange.max >= intervalRange.0) || intervalRange.0 == GAPSlaveConnectionIntervalRange.undefined,
            (GAPSlaveConnectionIntervalRange.min <= intervalRange.1 && GAPSlaveConnectionIntervalRange.max >= intervalRange.1) || intervalRange.1 == GAPSlaveConnectionIntervalRange.undefined
            else { return nil }
        
        self.intervalRange = intervalRange
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let min = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
        let max = UInt16(littleEndian: UInt16(bytes: (data[2], data[3])))
        
        self.init(intervalRange: (min, max))
    }
    
    public var data: Data {
        
        let range = (min: intervalRange.0.littleEndian.bytes, max: intervalRange.1.littleEndian.bytes)
        
        return Data([range.min.0, range.min.1, range.max.0, range.max.1])
    }
    
}

extension GAPSlaveConnectionIntervalRange: Equatable {
    
    public static func == (lhs: GAPSlaveConnectionIntervalRange, rhs: GAPSlaveConnectionIntervalRange) -> Bool {
        
        return lhs.intervalRange == rhs.intervalRange
    }
}

extension GAPSlaveConnectionIntervalRange: CustomStringConvertible {
    
    public var description: String {
        
        return "\(intervalRange.0, intervalRange.1)"
    }
}
