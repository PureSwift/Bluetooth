//
//  HCILEReadSupportedStates.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/15/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// LE Read Supported States
    ///
    /// The LE_Read_Supported_States command reads the states and state combinations that the link layer supports.
    func readSupportedStates(timeout: HCICommandTimeout = .default) throws -> LowEnergyStateSet {
        
        let returValue = try deviceRequest(HCILEReadSupportedStates.self, timeout: timeout)
        
        return returValue.state
    }
}

// MARK: - Return parameter

/// LE Read Supported States
///
/// The LE_Read_Supported_States command reads the states and state combinations that the link layer supports.
public struct HCILEReadSupportedStates: HCICommandReturnParameter {
    
    public static let command = HCILowEnergyCommand.readSupportedStates //0x001C
    
    public static let length: Int = 8
    
    public let state: LowEnergyStateSet
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let stateRawValue = UInt64(littleEndian: UInt64(bytes: (data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7])))
        
        guard let state = LowEnergyStateSet(rawValue: stateRawValue)
            else { return nil }
        
        self.state = state
    }
}
