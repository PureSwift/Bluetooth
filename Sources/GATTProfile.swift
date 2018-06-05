//
//  GATTProfile.swift
//  Bluetooth-macOS
//
//  Created by Carlos Duclos on 6/4/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

public protocol GATTProfileService {
    
    static var UUID: BluetoothUUID { get }
}

public protocol GATTProfileCharacteristic {
    
    static var UUID: BluetoothUUID { get }
    
    init?(data: Data)
    
    var data: Data { get }
    
    var characteristic: GATT.Characteristic { get }
}
