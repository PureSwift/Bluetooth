//
//  HCILinkKeyRequestNegativeReply.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 8/10/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// Link Key Request Reply Command
    ///
    /// The Link_Key_Request_Reply command is used to reply to a Link Key Request event from the Controller, and specifies the Link Key stored on the Host to be used as the link key for the connection with the other BR/EDR Controller specified by BD_ADDR. The Link Key Request event will be generated when the BR/EDR Controller needs a Link Key for a connection.
    /// When the BR/EDR Controller generates a Link Key Request event in order for the local Link Manager to respond to the request from the remote Link Manager (as a result of a Create_Connection or Authentication_Requested com- mand from the remote Host), the local Host must respond with either a Link_Key_Request_Reply or Link_Key_Request_Negative_Reply command before the remote Link Manager detects LMP response timeout.
    @discardableResult
    func linkKeyRequestNegativeReply(address: BluetoothAddress,
                                     timeout: HCICommandTimeout = .default) async throws -> BluetoothAddress {
        
        let command = HCILinkKeyRequestNegativeReply(address: address)
        return try await deviceRequest(command, HCILinkKeyRequestNegativeReplyReturn.self, timeout: timeout).address
    }
}

/// Link Key Request Negative Reply Command
///
/// The Link_Key_Request_Negative_Reply command is used to reply to a Link Key Request event from the BR/EDR Controller if the Host does not have a stored Link Key for the connection with the other BR/EDR Controller specified by BD_ADDR. The Link Key Request event will be generated when the BR/ EDR Controller needs a Link Key for a connection.
///
///When the Controller generates a Link Key Request event in order for the local Link Manager to respond to the request from the remote Link Manager (as a result of a Create_Connection or Authentication_Requested command from the remote Host), the local Host must respond with either a Link_Key_Request_Reply or Link_Key_Request_Negative_Reply command before the remote Link Manager detects LMP response timeout.
@frozen
public struct HCILinkKeyRequestNegativeReply: HCICommandParameter {
    
    public static let command = LinkControlCommand.linkKeyNegativeReply
    
    public var address: BluetoothAddress
    
    public init(address: BluetoothAddress) {
        
        self.address = address
    }
    
    public var data: Data {
        
        let addressBytes = address.littleEndian.bytes
        
        return Data([addressBytes.0,
                     addressBytes.1,
                     addressBytes.2,
                     addressBytes.3,
                     addressBytes.4,
                     addressBytes.5])
    }
}

// MARK: - Return Parameter

@frozen
public struct HCILinkKeyRequestNegativeReplyReturn: HCICommandReturnParameter {
    
    public static let command = LinkControlCommand.linkKeyNegativeReply
    
    public static let length: Int = 6
    
    public var address: BluetoothAddress
    
    public init?(data: Data) {
        
        guard data.count == HCILinkKeyRequestNegativeReplyReturn.length
            else { return nil }
        
        let address = BluetoothAddress(littleEndian: BluetoothAddress(bytes: (data[0], data[1], data[2], data[3], data[4], data[5])))
        
        self.address = address
    }
}
