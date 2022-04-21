//
//  HCILinkKeyRequestReply.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 8/3/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// Link Key Request Reply Command
    ///
    /// The Link_Key_Request_Reply command is used to reply to a Link Key Request event from the Controller, and specifies the Link Key stored on the Host to be used as the link key for the connection with the other BR/EDR Controller specified by BD_ADDR. The Link Key Request event will be generated when the BR/EDR Controller needs a Link Key for a connection.
    /// When the BR/EDR Controller generates a Link Key Request event in order for the local Link Manager to respond to the request from the remote Link Manager (as a result of a Create_Connection or Authentication_Requested com- mand from the remote Host), the local Host must respond with either a Link_Key_Request_Reply or Link_Key_Request_Negative_Reply command before the remote Link Manager detects LMP response timeout.
    func linkKeyRequestReply(address: BluetoothAddress,
                             linkKey: UInt128,
                             timeout: HCICommandTimeout = .default) async throws {
        
        let linkKeyRequestReply = HCILinkKeyRequestReply(address: address, linkKey: linkKey)
        
        try await deviceRequest(linkKeyRequestReply, timeout: timeout)
    }
}

// MARK: - Command

/// Link Key Request Reply Command
///
/// The Link_Key_Request_Reply command is used to reply to a Link Key Request event from the Controller, and specifies the Link Key stored on the Host to be used as the link key for the connection with the other BR/EDR Controller specified by BD_ADDR. The Link Key Request event will be generated when the BR/EDR Controller needs a Link Key for a connection.
/// When the BR/EDR Controller generates a Link Key Request event in order for the local Link Manager to respond to the request from the remote Link Manager (as a result of a Create_Connection or Authentication_Requested com- mand from the remote Host), the local Host must respond with either a Link_Key_Request_Reply or Link_Key_Request_Negative_Reply command before the remote Link Manager detects LMP response timeout.
@frozen
public struct HCILinkKeyRequestReply: HCICommandParameter {
    
    public static let command = LinkControlCommand.linkKeyReply
    
    /// BD_ADDR of the Device to reject the connection from.
    public var address: BluetoothAddress
    
    /// Link Key for the associated BD_ADDR.
    public var linkKey: UInt128
    
    public init(address: BluetoothAddress, linkKey: UInt128) {
        
        self.address = address
        self.linkKey = linkKey
    }
    
    public var data: Data {
        
        let addressBytes = address.littleEndian.bytes
        
        let linkKeyBytes = linkKey.littleEndian.bytes
        
        return Data([addressBytes.0,
                     addressBytes.1,
                     addressBytes.2,
                     addressBytes.3,
                     addressBytes.4,
                     addressBytes.5,
                     linkKeyBytes.0,
                     linkKeyBytes.1,
                     linkKeyBytes.2,
                     linkKeyBytes.3,
                     linkKeyBytes.4,
                     linkKeyBytes.5,
                     linkKeyBytes.6,
                     linkKeyBytes.7,
                     linkKeyBytes.8,
                     linkKeyBytes.9,
                     linkKeyBytes.10,
                     linkKeyBytes.11,
                     linkKeyBytes.12,
                     linkKeyBytes.13,
                     linkKeyBytes.14,
                     linkKeyBytes.15])
    }
}

// MARK: - Return Parameters

@frozen
public struct HCILinkKeyRequestReplyReturn: HCICommandReturnParameter {
    
    public static let command = LinkControlCommand.linkKeyReply
    
    public static let length: Int = 7
    
    /// BD_ADDR of the Device of which the Link Key request reply has completed.
    public var address: BluetoothAddress
    
    public init?(data: Data) {
        
        guard data.count == HCILinkKeyRequestReplyReturn.length
            else { return nil }
        
        let address = BluetoothAddress(littleEndian: BluetoothAddress(bytes: (data[0], data[1], data[2], data[3], data[4], data[5])))
        
        self.address = address
    }
}
