//
//  HCICreateConnectionCancel.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 8/2/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// Create Connection Command
    ///
    /// This command is used to request cancellation of the ongoing connection creation process, which was started by a Create_Connection command of the local BR/EDR Controller.
    func cancelConnection(address: BluetoothAddress,
                          timeout: HCICommandTimeout = .default) async throws {
        
        let createConnectionCancel = HCICreateConnectionCancel(address: address)
        
        try await deviceRequest(createConnectionCancel, timeout: timeout)
    }
}

// MARK: - Command

/// Create Connection Command
///
/// This command is used to request cancellation of the ongoing connection creation process, which was started by a Create_Connection command of the local BR/EDR Controller.
@frozen
public struct HCICreateConnectionCancel: HCICommandParameter {
    
    public static let command = LinkControlCommand.createConnectionCancel
    
    /// BD_ADDR of the Create Connection command request that was issued before and is subject of this cancellation request
    public var address: BluetoothAddress
    
    public init(address: BluetoothAddress) {
        
        self.address = address
    }
    
    public var data: Data {
        
        let addressBytes = address.littleEndian.bytes
        
        return Data([addressBytes.0, addressBytes.1, addressBytes.2, addressBytes.3, addressBytes.4, addressBytes.5])
    }
}

// MARK: - Return parameter

@frozen
public struct HCICreateConnectionCancelReturn: HCICommandReturnParameter {
    
    public static let command = LinkControlCommand.createConnectionCancel
    
    public static let length: Int = 7
    
    public let status: HCIStatus
    
    public var address: BluetoothAddress
    
    public init?(data: Data) {
        
        guard let status = HCIStatus(rawValue: data[0])
            else { return nil }
        
        let address = BluetoothAddress(littleEndian: BluetoothAddress(bytes: (data[1], data[2], data[3], data[4], data[5], data[6])))
        
        self.status = status
        self.address = address
    }
}
