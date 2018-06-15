//
//  HCILEReadPeriodicAdvertisingListSize.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/15/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// LE Read Periodic Advertiser List Size Command
    ///
    /// The command is used to read the total number of Periodic Advertiser list entries that can be stored in the Controller.
    func lowEnergyReadPeriodicAdvertisingListSize(timeout: HCICommandTimeout = .default) throws -> UInt8 {
        
        let value = try deviceRequest(HCILEReadPeriodicAdvertisingListSize.self,
                                      timeout: timeout)
        
        return value.periodicAdvertiserListSize
    }
}

// MARK: - Return parameter

/// LE Read Periodic Advertiser List Size Command
///
/// The command is used to read the total number of Periodic Advertiser list entries that can be stored in the Controller.
public struct HCILEReadPeriodicAdvertisingListSize: HCICommandReturnParameter {
    
    public static let command = HCILowEnergyCommand.readPeriodicAdvertiserListSize //0x004A
    
    public static let length: Int = 1
    
    /// Total number of Periodic Advertiser list entries that can be stored in the Controller
    public let periodicAdvertiserListSize: UInt8
    
    public init?(data: Data) {
        guard data.count == type(of: self).length
            else { return nil }
        
        periodicAdvertiserListSize = data[0]
    }
}
