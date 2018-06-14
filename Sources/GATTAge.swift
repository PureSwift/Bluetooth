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
public struct GATTAge: GATTCharacteristic {
    
    internal static let length = MemoryLayout<UInt8>.size
    
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
    
    public struct Year: BluetoothUnit {
        
        public static var unitType: UnitIdentifier { return .year }
        
        public var rawValue: UInt8
        
        public init(rawValue: UInt8) {
            
            self.rawValue = rawValue
        }
        
    }
    
}

extension GATTAge.Year: Equatable {
    
    public static func == (lhs: GATTAge.Year, rhs: GATTAge.Year) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
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

extension GATTAge: Equatable {
    
    public static func == (lhs: GATTAge,
                           rhs: GATTAge) -> Bool {
        
        return lhs.year == rhs.year
    }
}

extension GATTAge: CustomStringConvertible {
    
    public var description: String {
        
        return year.description
    }
}
