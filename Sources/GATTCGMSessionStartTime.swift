//
//  GATTCGMSessionStartTime.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/22/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

public struct GATTCGMSessionStartTime: GATTCharacteristic {
    
    public static var uuid: BluetoothUUID { return .cgmSessionStartTime }
    
    internal static let length = 7
    
    public var datetime: GATTDateTime?
    
    public init(datetime: GATTDateTime) {
        
        self.datetime = datetime
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
    }
    
    public var data: Data {
        
        return Data()
    }
}
