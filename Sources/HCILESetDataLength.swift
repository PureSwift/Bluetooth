//
//  HCILESetDataLength.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {

    /// LE Set Data Length Command
    ///
    /// This command allows the Host to suggest maximum transmission packet size and maximum packet transmission time
    /// to be used for a given connection. The Controller may use smaller or larger values based on local information.
    func lowEnergySetDataLength(connectionHandle: UInt16,
                                txOctets: LowEnergyMaxTxOctets,
                                txTime: LowEnergyMaxTxTime,
                                timeout: HCICommandTimeout = .default) throws -> UInt16 {
        
        let parameters = HCILESetDataLength(connectionHandle: connectionHandle,
                                                                txOctets: txOctets,
                                                                txTime: txTime)
        
        let returnParameters = try deviceRequest(parameters, HCILESetDataLengthReturn.self, timeout: timeout)
        
        return returnParameters.connectionHandle
    }
}

// MARK: - Command

/// LE Set Data Length Command
///
/// This command allows the Host to suggest maximum transmission packet size and maximum packet transmission time
/// to be used for a given connection. The Controller may use smaller or larger values based on local information.
public struct HCILESetDataLength: HCICommandParameter {
    
    public static let command = HCILowEnergyCommand.setDataLengthCommand //0x0022
    
    public var connectionHandle: UInt16
    
    public var txOctets: LowEnergyMaxTxOctets
    
    public var txTime: LowEnergyMaxTxTime
    
    public init(connectionHandle: UInt16,
                txOctets: LowEnergyMaxTxOctets,
                txTime: LowEnergyMaxTxTime) {
        
        self.connectionHandle = connectionHandle
        self.txOctets = txOctets
        self.txTime = txTime
    }
    
    public var data: Data {
        
        let connectionHandleBytes = connectionHandle.littleEndian.bytes
        let txOctetsBytes = txOctets.rawValue.littleEndian.bytes
        let txTimeBytes = txTime.rawValue.littleEndian.bytes
        
        return Data([
            connectionHandleBytes.0,
            connectionHandleBytes.1,
            txOctetsBytes.0,
            txOctetsBytes.1,
            txTimeBytes.0,
            txTimeBytes.1
            ])
    }
}

// MARK: - Return parameter

/// The LE_Set_Data_Length command allows the Host to suggest maximum transmission packet size and maximum packet transmission time
/// to be used for a given connection. The Controller may use smaller or larger values based on local information.
public struct HCILESetDataLengthReturn: HCICommandReturnParameter {
    
    public static let command = HCILowEnergyCommand.setDataLengthCommand //0x0022
    
    public static let length: Int = 2
    
    /// Connection_Handle
    /// Range 0x0000-0x0EFF (all other values reserved for future use)
    public let connectionHandle: UInt16 // Connection_Handle
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        connectionHandle = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
    }
}
