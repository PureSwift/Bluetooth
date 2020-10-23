//
//  GATTAlertNotificationService.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

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
public struct GATTAlertNotificationService: GATTService {
    
    public static var uuid: BluetoothUUID { return .alertNotificationService }
}
