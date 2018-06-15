//
//  HCILESetDefaultPhy.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// LE Set Default PHY Command
    ///
    /// The command allows the Host to specify its preferred values for the transmitter PHY
    /// and receiver PHY to be used for all subsequent connections over the LE transport.
    func lowEnergySetDefaultPhy(allPhys: LowEnergyAllPhys,
                                txPhys: LowEnergyTxPhys,
                                rxPhys: LowEnergyRxPhys,
                                timeout: HCICommandTimeout = .default) throws {
        
        let parameters = HCILESetDefaultPhy(allPhys: allPhys, txPhys: txPhys, rxPhys: rxPhys)
        
        try deviceRequest(parameters, timeout: timeout)
    }
}

// MARK: - Command

/// LE Set Default PHY Command
///
/// command allows the Host to specify its preferred values for
/// the transmitter PHY and receiver PHY to be used for all subsequent
///connections over the LE transport.
public struct HCILESetDefaultPhy: HCICommandParameter {
    
    public static let command = HCILowEnergyCommand.readPhy //0x0031
    
    public let allPhys: LowEnergyAllPhys
    public let txPhys: LowEnergyTxPhys
    public let rxPhys: LowEnergyRxPhys
    
    public init(allPhys: LowEnergyAllPhys,
                txPhys: LowEnergyTxPhys,
                rxPhys: LowEnergyRxPhys) {
        
        self.allPhys = allPhys
        self.txPhys = txPhys
        self.rxPhys = rxPhys
    }
    
    public var data: Data {
        return Data([allPhys.rawValue, txPhys.rawValue, rxPhys.rawValue])
    }
}
