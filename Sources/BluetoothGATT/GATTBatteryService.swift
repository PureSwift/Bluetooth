//
//  GATTBatteryService.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

/**
 The Battery Service exposes the state of a battery within a device.
 
 The Battery Service exposes the Battery State and Battery Level of a single battery or set of batteries in a device.
 
 This service has no dependencies on other GATT-based services.
 */
public struct GATTBatteryService: GATTService {
    
    public static var uuid: BluetoothUUID { return .batteryService }
}
