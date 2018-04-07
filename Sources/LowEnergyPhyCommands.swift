//
//  LowEnergyPhyCommands.swift
//  Bluetooth-macOS
//
//  Created by Marco Estrella on 4/7/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

public extension BluetoothHostControllerInterface {
    
    /// LE Read PHY Command
    ///
    /// This ommand is used to read the current transmitter PHY and receiver PHY
    /// on the connection identified by the Connection_Handle.
    func lowEnergyReadPhy(connectionHandle: UInt16, timeout: HCICommandTimeout = .default) throws -> (TxPhy, RxPhy) {
        
        let parameters = LowEnergyCommand.ReadPHYParameter(connectionHandle: connectionHandle)
        
        let value = try deviceRequest(parameters, LowEnergyCommand.ReadPHYReturnParameter.self, timeout: timeout)
        
        return (value.txPhy, value.rxPhy)
    }
}
