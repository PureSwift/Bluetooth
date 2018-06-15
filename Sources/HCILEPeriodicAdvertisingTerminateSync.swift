//
//  HCILEPeriodicAdvertisingTerminateSync.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// LE Periodic Advertising Terminate Sync Command
    ///
    /// The command is used to stop reception of the periodic advertising identified by the Sync_Handle parameter.
    func setPeriodicAdvertisingTerminateSync(syncHandle: UInt16,
                                             timeout: HCICommandTimeout = .default)  throws {
        
        let parameters = HCILEPeriodicAdvertisingTerminateSync(syncHandle: syncHandle)
        
        try deviceRequest(parameters, timeout: timeout)
    }
}

// MARK: - Command

/// LE Periodic Advertising Terminate Sync Command
///
/// The command is used to stop reception of the periodic advertising identified by the Sync_Handle parameter.
///
/// If the Host issues this command when another LE_Periodic_Advertising_Create_Sync command is pending (see below),
/// the Controller shall return the error code Command Disallowed (0x0C).
///
/// If the periodic advertising corresponding to the Sync_Handle parameter does not exist,
/// then the Controller shall return the error code Unknown Advertising Identifier (0x42).
public struct HCILEPeriodicAdvertisingTerminateSync: HCICommandParameter {
    
    public static let command = HCILowEnergyCommand.periodicAdvertisingTerminateSync //0x0046
    
    public let syncHandle: UInt16
    
    public init(syncHandle: UInt16) {
        self.syncHandle = syncHandle
    }
    
    public var data: Data {
        let syncHandleBytes = syncHandle.littleEndian.bytes
        
        return Data([syncHandleBytes.0, syncHandleBytes.1])
    }
}
