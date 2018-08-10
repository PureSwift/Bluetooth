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
    func linkKeyRequestNegativeReply(address: Address,
                                     timeout: HCICommandTimeout = .default) throws -> HCIStatus {
        
        let command = HCILinkKeyRequestNegativeReply(address: address)
        
        return try deviceRequest(command, HCILinkKeyRequestNegativeReplyReturn.self, timeout: timeout).status
    }
}

/// Link Key Request Negative Reply Command
///
/// The Link_Key_Request_Negative_Reply command is used to reply to a Link Key Request event from the BR/EDR Controller if the Host does not have a stored Link Key for the connection with the other BR/EDR Controller specified by BD_ADDR. The Link Key Request event will be generated when the BR/ EDR Controller needs a Link Key for a connection.
///
///When the Controller generates a Link Key Request event in order for the local Link Manager to respond to the request from the remote Link Manager (as a result of a Create_Connection or Authentication_Requested command from the remote Host), the local Host must respond with either a Link_Key_Request_Reply or Link_Key_Request_Negative_Reply command before the remote Link Manager detects LMP response timeout.
public struct HCILinkKeyRequestNegativeReply: HCICommandParameter {
    
    public static let command = LinkControlCommand.linkKeyNegativeReply
    
    public var address: Address
    
    public init(address: Address) {
        
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

public struct HCILinkKeyRequestNegativeReplyReturn: HCICommandReturnParameter {
    
    public static let command = LinkControlCommand.linkKeyNegativeReply
    
    public static let length: Int = 7
    
    public let status: HCIStatus
    
    public var address: Address
    
    public init?(data: Data) {
        
        guard data.count == HCIEncryptionChange.length
            else { return nil }
        
        guard let status = HCIStatus(rawValue: data[0])
            else { return nil }
        
        let address = Address(bytes: (data[1], data[2], data[3], data[4], data[5], data[6]))
        
        self.status = status
        self.address = address
    }
}
