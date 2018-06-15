//
//  HCILESetPhy.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {

    /// LE Set PHY Command
    ///
    /// command is used to set the PHY preferences for the connection identified by
    /// the Connection_Handle. The Controller might not be able to make the change
    /// (e.g. because the peer does not support the requested PHY) or may decide that
    /// the current PHY is preferable.
    func lowEnergySetPhyParameter(connectionHandle: UInt16,
                                  allPhys: LowEnergyAllPhys,
                                  txPhys: LowEnergyTxPhys,
                                  rxPhys: LowEnergyRxPhys,
                                  phyOptions: LowEnergyPhyOptions,
                                  timeout: HCICommandTimeout = .default) throws -> HCILEPhyUpdateComplete {
        
        let parameters = HCILESetPhy(connectionHandle: connectionHandle,
                                                         allPhys: allPhys,
                                                         txPhys: txPhys,
                                                         rxPhys: rxPhys,
                                                         phyOptions: phyOptions)
        
        let event =  try deviceRequest(parameters,
                                       HCILEPhyUpdateComplete.self,
                                       timeout: timeout)
        
        switch event.status {
            
        case let .error(error):
            throw error
            
        case .success:
            return event
        }
    }
}

// MARK: - Command

/// LE Set PHY Command
///
/// The command is used to set the PHY preferences for the connection identified by
/// the Connection_Handle. The Controller might not be able to make the change
/// (e.g. because the peer does not support the requested PHY) or may decide that
/// the current PHY is preferable.
public struct HCILESetPhy: HCICommandParameter {
    
    public static let command = HCILowEnergyCommand.setPhy //0x0032
    
    public let connectionHandle: UInt16
    public let allPhys: LowEnergyAllPhys
    public let txPhys: LowEnergyTxPhys
    public let rxPhys: LowEnergyRxPhys
    public let phyOptions: LowEnergyPhyOptions
    
    public init(connectionHandle: UInt16,
                allPhys: LowEnergyAllPhys,
                txPhys: LowEnergyTxPhys,
                rxPhys: LowEnergyRxPhys,
                phyOptions: LowEnergyPhyOptions) {
        
        self.connectionHandle = connectionHandle
        self.allPhys = allPhys
        self.txPhys = txPhys
        self.rxPhys = rxPhys
        self.phyOptions = phyOptions
    }
    
    public var data: Data {
        
        let connectionHandleBytes = connectionHandle.littleEndian.bytes
        let phyOptionsBytes = phyOptions.rawValue.littleEndian.bytes
        
        return Data([connectionHandleBytes.0,
                     connectionHandleBytes.1,
                     allPhys.rawValue,
                     txPhys.rawValue,
                     rxPhys.rawValue,
                     phyOptionsBytes.0,
                     phyOptionsBytes.1
            ])
    }
}
