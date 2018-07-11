//
//  GATTScanRefresh.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 7/11/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 Scan Refresh
 
 The Scan Refresh characteristic is used to notify the Client that the Server requires the Scan Interval Window characteristic to be written with the latest values upon notification.
 
 - SeeAlso: [Scan Refresh](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.scan_refresh.xml)
 */
public enum GATTScanRefresh: UInt8, GATTCharacteristic {
    
    internal static let length = MemoryLayout<UInt8>.size
    
    public static var uuid: BluetoothUUID { return .scanRefresh }
    
    case serverRequiredRefresh = 0
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        self.init(rawValue: data[0])
    }
    
    public var data: Data {
        
        return Data([rawValue])
    }
    
}

extension GATTScanRefresh: Equatable {
    
    public static func == (lhs: GATTScanRefresh, rhs: GATTScanRefresh) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

extension GATTScanRefresh: CustomStringConvertible {
    
    public var description: String {
        
        return rawValue.description
    }
}
