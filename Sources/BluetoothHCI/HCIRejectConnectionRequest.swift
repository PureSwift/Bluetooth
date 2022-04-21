//
//  HCIRejectConnectionRequest.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 8/2/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// Reject Connection Command
    ///
    /// The Reject_Connection_Request command is used to decline a new incoming connection request. The Reject_Connection_Request command shall only be called after a Connection Request event has occurred. The Connection Request event will return the BD_ADDR of the device that is requesting the connection. The Reason command parameter will be returned to the connecting device in the Status parameter of the Connection Complete event returned to the Host of the connection device, to indicate why the connection was declined.
    func rejectConnection(address: BluetoothAddress,
                          error: HCIError,
                          timeout: HCICommandTimeout = .default) async throws {
        
        let rejectConnectionCancel = HCIRejectConnectionRequest(address: address, error: error)
        
        try await deviceRequest(rejectConnectionCancel, timeout: timeout)
    }
}

// MARK: - Command

/// Reject Connection Command
///
/// The Reject_Connection_Request command is used to decline a new incoming connection request. The Reject_Connection_Request command shall only be called after a Connection Request event has occurred. The Connection Request event will return the BD_ADDR of the device that is requesting the connection. The Reason command parameter will be returned to the connecting device in the Status parameter of the Connection Complete event returned to the Host of the connection device, to indicate why the connection was declined.
@frozen
public struct HCIRejectConnectionRequest: HCICommandParameter {
    
    public static let command = LinkControlCommand.rejectConnection
    
    /// BD_ADDR of the Device to reject the connection from.
    public var address: BluetoothAddress
    
    public var error: HCIError
    
    public init(address: BluetoothAddress, error: HCIError) {
        
        self.address = address
        self.error = error
    }
    
    public var data: Data {
        
        let addressBytes = address.littleEndian.bytes
        
        return Data([addressBytes.0, addressBytes.1, addressBytes.2, addressBytes.3, addressBytes.4, addressBytes.5, error.rawValue])
    }
}
