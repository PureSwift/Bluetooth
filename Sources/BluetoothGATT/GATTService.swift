//
//  GATTService.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/10/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

public protocol GATTService {
    
    static var uuid: BluetoothUUID { get }
}
