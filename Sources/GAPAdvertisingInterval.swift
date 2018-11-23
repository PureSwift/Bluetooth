//
//  GAPAdvertisingInterval.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// The Advertising Interval data type contains the `advInterval` value
/// as defined in the Core specification, Volume 6, Part B, Section 4.4.2.2.
///
/// Size: 2 octets (UINT16)
/// Units: 0.625 ms
public struct GAPAdvertisingInterval: GAPData, Equatable, Hashable {
    
    internal static let length = MemoryLayout<UInt16>.size
    
    public static let dataType: GAPDataType = .advertisingInterval
    
    public var interval: UInt16
    
    public init(interval: UInt16) {
        
        self.interval = interval
    }
}

public extension GAPAdvertisingInterval {
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let interval = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
        
        self.init(interval: interval)
    }
    
    public var data: Data {
        
        let value = interval.littleEndian
        
        return Data([value.bytes.0, value.bytes.1])
    }
}

public extension GAPAdvertisingInterval {
    
    internal static var units: Double { return 0.0625 }
    
    public var miliseconds: Double {
        
        return Double(interval) * type(of: self).units
    }
}

// MARK: - CustomStringConvertible

extension GAPAdvertisingInterval: CustomStringConvertible {
    
    public var description: String {
        
        return miliseconds.description + "ms"
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension GAPAdvertisingInterval: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt16) {
        
        self.init(interval: value)
    }
}
