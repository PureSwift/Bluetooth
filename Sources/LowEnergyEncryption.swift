//
//  LowEnergyEncryption.swift
//  Bluetooth
//
//  Created by Marco Estrella on 3/30/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

public extension BluetoothHostControllerInterface {
    
    /// LE Rand Command
    ///
    /// The command is used to request the Controller to generate 8 octets of random data to be sent to the Host.
    func lowEnergyRandom(timeout: HCICommandTimeout = .default) throws -> UInt64 {
        
        let returnParameters = try deviceRequest(HCILowEnergyCommand.RandomReturnParameter.self, timeout: timeout)
        
        return returnParameters.randomNumber
    }
}
