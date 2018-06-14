//
//  HCILEReadPHY.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// LE Read PHY Command
    ///
    /// This ommand is used to read the current transmitter PHY and receiver PHY
    /// on the connection identified by the Connection_Handle.
    func lowEnergyReadPhy(connectionHandle: UInt16, timeout: HCICommandTimeout = .default) throws -> HCILowEnergyCommand.ReadPHYReturnParameter {
        
        let parameters = HCILEReadPHY(connectionHandle: connectionHandle)
        
        let value = try deviceRequest(parameters, HCILowEnergyCommand.ReadPHYReturnParameter.self, timeout: timeout)
        
        return value
    }
}

// MARK: - Command

/// LE Read PHY Command
///
/// The command is used to read the current transmitter PHY and receiver PHY
/// on the connection identified by the Connection_Handle.
public struct HCILEReadPHY: HCICommandParameter {
    
    public static let command = HCILowEnergyCommand.readPhy //0x0030
    
    /// Range 0x0000-0x0EFF (all other values reserved for future use)
    public let connectionHandle: UInt16 //Connection_Handle
    
    public init(connectionHandle: UInt16) {
        
        self.connectionHandle = connectionHandle
    }
    
    public var data: Data {
        
        let connectionHandleBytes = connectionHandle.littleEndian.bytes
        
        return Data([
            connectionHandleBytes.0,
            connectionHandleBytes.1
            ])
    }
}
