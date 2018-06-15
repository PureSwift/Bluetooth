//
//  HCILEReadMaximumAdvertisingDataLength.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/15/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// LE Read Maximum Advertising Data Length Command
    ///
    /// The ommand is used to read the maximum length of data supported by the Controller for use
    /// as advertisement data or scan response data in an advertising event or as periodic advertisement data.
    func setReadMaximumAdvertisingDataLength(timeout: HCICommandTimeout = .default) throws -> UInt16 {
        
        let value = try deviceRequest(HCILEReadMaximumAdvertisingDataLength.self,
                                      timeout: timeout)
        
        return value.maximumAdvertisingDataLength
    }
}

// MARK: - Return parameter

/// LE Read Maximum Advertising Data Length Command
///
/// The command is used to read the maximum length of data supported by the Controller for use
/// as advertisement data or scan response data in an advertising event or as periodic advertisement data.
public struct HCILEReadMaximumAdvertisingDataLength: HCICommandReturnParameter {
    
    public static let command = HCILowEnergyCommand.readMaximumAdvertisingDataLength //0x003A
    
    public static let length: Int = 2
    
    /// Maximum supported advertising data length
    public let maximumAdvertisingDataLength: UInt16
    
    public init?(data: Data) {
        guard data.count == type(of: self).length
            else { return nil }
        
        maximumAdvertisingDataLength = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
    }
}
