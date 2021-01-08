//
//  GATTAge.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 Age
 
 Age of the User.
 
 - SeeAlso: [ Age](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.age.xml)
 */
@frozen
public struct GATTAge: GATTCharacteristic, Equatable {
    
    internal static var length: Int { return MemoryLayout<UInt8>.size }
    
    public static var uuid: BluetoothUUID { return .age }
    
    public var year: Year
    
    public init(year: Year) {
        
        self.year = year
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let year = Year(rawValue: data[0])
        
        self.init(year: year)
    }
    
    public var data: Data {
        
        return Data([year.rawValue])
    }
}

public extension GATTAge {
    
    struct Year: BluetoothUnit, Equatable {
        
        public static var unitType: UnitIdentifier { return .year }
        
        public var rawValue: UInt8
        
        public init(rawValue: UInt8) {
            
            self.rawValue = rawValue
        }
        
    }
}

extension GATTAge.Year: CustomStringConvertible {
    
    public var description: String {
        return rawValue.description
    }
}

extension GATTAge.Year: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt8) {
        self.init(rawValue: value)
    }
}

extension GATTAge: CustomStringConvertible {
    
    public var description: String {
        return year.description
    }
}
