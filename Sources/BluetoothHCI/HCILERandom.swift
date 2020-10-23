//
//  HCILERandomReturn.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/15/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// LE Rand Command
    ///
    /// The command is used to request the Controller to generate 8 octets of random data to be sent to the Host.
    func lowEnergyRandom(timeout: HCICommandTimeout = .default) throws -> UInt64 {
        
        let returnParameters = try deviceRequest(HCILERandom.self, timeout: timeout)
        
        return returnParameters.randomNumber
    }
}

// MARK: - Return parameter

/// LE Rand Command
///
/// The command is used to request the Controller to generate 8 octets of random data to be sent to the Host.
public struct HCILERandom: HCICommandReturnParameter { // HCI_LE_Rand
    
    public static let command = HCILowEnergyCommand.random //0x0018
    
    public static let length: Int = 8
    
    /// Random Number
    public let randomNumber: UInt64 //Random_Number
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        self.randomNumber = UInt64(littleEndian: UInt64(bytes: ((data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7]))))
    }
}
