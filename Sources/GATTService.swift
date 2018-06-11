//
//  GATTService.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/10/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 Alert Notification service exposes:
 
 • The different types of alerts with the short text messages.
 • The information how many count of new alert messages.
 • The information how many count of unread alerts.
 
 The Alert Notification service exposes alert information in a device. This information includes the following:
 
 - Type of alert occuring in a device.
 - Additional text information such as caller ID or sender ID
 - Count of new alerts.
 - Count of unread alert items.
 */
public struct GATTAlertNotificationService: GATTProfileService {
    
    public static var uuid: BluetoothUUID { return .alertNotificationService }
}

/**
 The Battery Service exposes the state of a battery within a device.
 
 The Battery Service exposes the Battery State and Battery Level of a single battery or set of batteries in a device.
 
 This service has no dependencies on other GATT-based services.
 */
public struct GATTBatteryService: GATTProfileService {
    
    public static var uuid: BluetoothUUID { return .batteryService }
}

/**
 Blood Pressure Service
 
 This service exposes blood pressure and other data from a blood pressure monitor for use in consumer and professional healthcare applications.
 */
public struct GATTBloodPressureService: GATTProfileService {
    
    public static var uuid: BluetoothUUID { return .bloodPressure }
}
