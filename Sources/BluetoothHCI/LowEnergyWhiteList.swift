//
//  LowEnergyWhiteList.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 11/29/17.
//  Copyright © 2017 PureSwift. All rights reserved.
//

public extension BluetoothHostControllerInterface {
    
    /// LE Clear White List Command
    ///
    /// Used to clear the White List stored in the Controller.
    func lowEnergyClearWhiteList(timeout: HCICommandTimeout = .default) async throws {
        
        // clear white list
        try await deviceRequest(HCILowEnergyCommand.clearWhiteList, timeout: timeout)
    }
    
}
