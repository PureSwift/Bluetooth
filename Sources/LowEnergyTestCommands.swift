//
//  Test.swift
//  Bluetooth
//
//  Created by Marco Estrella on 4/3/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

public extension BluetoothHostControllerInterface {
    
    /// LE Test End Command
    ///
    /// This command is used to stop any test which is in progress.
    func lowEnergyTestEnd(timeout: HCICommandTimeout = .default) throws -> UInt16 {
        
        let value = try deviceRequest(HCILowEnergyCommand.HCILETestEnd.self,
                                      timeout: timeout)
        
        return value.numberOfPackets
    }

}
