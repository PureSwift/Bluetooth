//
//  GATTBootMouseInputReport.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/19/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 Boot Mouse Input Report
 
 [Boot Mouse Input Report](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.boot_mouse_input_report.xml)
 
 The Boot Mouse Input Report characteristic is used to transfer fixed format and length Input Report data between a HID Host operating in Boot Protocol Mode and a HID Service corresponding to a boot mouse.
 */
public struct GATTBootMouseInputReport: RawRepresentable, GATTCharacteristic {
    
    internal static let length = MemoryLayout<UInt8>.size
    
    public static var uuid: BluetoothUUID { return .bootMouseInputReport }
    
    public var rawValue: UInt8
    
    public init(rawValue: UInt8) {
        
        self.rawValue = rawValue
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        self.init(rawValue: data[0])
    }
    
    public var data: Data {
        
        return Data([rawValue])
    }
}

extension GATTBootMouseInputReport: Equatable {
    
    public static func == (lhs: GATTBootMouseInputReport, rhs: GATTBootMouseInputReport) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

extension GATTBootMouseInputReport: CustomStringConvertible {
    
    public var description: String {
        
        return rawValue.description
    }
}

extension GATTBootMouseInputReport: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt8) {
        
        self.init(rawValue: value)
    }
}
