//
//  GATTScanIntervalWindow.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 7/11/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 Scan Interval Window
 
 The Scan Interval Window characteristic is used to store the scan parameters of the GATT Client. Included in this characteristic are the Scan Interval and Scan Window of the GATT Client device.
 
 The Scan Interval Window characteristic is used to store the scan parameters of the GATT Client. The GATT Server can use these values to optimize its own advertisement rate and to minimize the rate of its own advertisements while also minimizing the latency of reconnections.
 
 - SeeAlso: [Scan Interval Window](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.scan_interval_window.xml)
 */
public struct GATTScanIntervalWindow: GATTCharacteristic {
    
    internal static let length = MemoryLayout<UInt16>.size * 2
    
    public static var uuid: BluetoothUUID { return .scanIntervalWindow }
    
    public var scanInterval: UInt16
    
    public var scanWindow: UInt16
    
    public init(scanInterval: UInt16, scanWindow: UInt16) {
        
        self.scanInterval = scanInterval
        self.scanWindow = scanWindow
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let scanInterval = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
        
        let scanWindow = UInt16(littleEndian: UInt16(bytes: (data[2], data[3])))
        
        self.init(scanInterval: scanInterval, scanWindow: scanWindow)
    }
    
    public var data: Data {
        
        let scanIntervalBytes = scanInterval.littleEndian.bytes
        let scanWindowBytes = scanWindow.littleEndian.bytes
        
        return Data([scanIntervalBytes.0, scanIntervalBytes.1, scanWindowBytes.0, scanWindowBytes.1])
    }
}

extension GATTScanIntervalWindow: Equatable {
    
    public static func == (lhs: GATTScanIntervalWindow, rhs: GATTScanIntervalWindow) -> Bool {
        
        return lhs.scanInterval == rhs.scanInterval && lhs.scanWindow == rhs.scanWindow
    }
}
