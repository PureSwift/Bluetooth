//
//  HCIUserConfirmationRequestReply.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 8/17/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// User Confirmation Request Reply Command
    ///
    /// The User_Confirmation_Request_Reply command is used to reply to a User Confirmation Request event and indicates that the user selected "yes". It is also used when the host has no input and no output capabilities.
    func userConfirmationRequestReply(address: Address,
                                      timeout: HCICommandTimeout = .default) throws -> Address {
        
        let command = HCIUserConfirmationRequestReply(address: address)
        
        return try deviceRequest(command, HCIUserConfirmationRequestReplyReturn.self, timeout: timeout).address
    }
}

/// User Confirmation Request Reply Command
///
/// The User_Confirmation_Request_Reply command is used to reply to a User Confirmation Request event and indicates that the user selected "yes". It is also used when the host has no input and no output capabilities.
public struct HCIUserConfirmationRequestReply: HCICommandParameter {
    
    public static let command = LinkControlCommand.userConfirmationRequestReply
    
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
                     addressBytes.5
            ])
    }
}

// MARK: - Return Parameter

public struct HCIUserConfirmationRequestReplyReturn: HCICommandReturnParameter {
    
    public static let command = LinkControlCommand.userConfirmationRequestReply
    
    public static let length: Int = 6
    
    public let address: Address
    
    public init?(data: Data) {
        
        guard data.count == HCIUserConfirmationRequestReplyReturn.length
            else { return nil }
        
        let address = Address(littleEndian: Address(bytes: (data[0], data[1], data[2], data[3], data[4], data[5])))
        
        self.address = address
    }
}
