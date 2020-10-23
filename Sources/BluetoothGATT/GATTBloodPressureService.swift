//
//  GATTBloodPressureService.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

/**
 Blood Pressure Service
 
 This service exposes blood pressure and other data from a blood pressure monitor for use in consumer and professional healthcare applications.
 */
public struct GATTBloodPressureService: GATTService {
    
    public static var uuid: BluetoothUUID { return .bloodPressure }
}
