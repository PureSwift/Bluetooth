//
//  HCIPINCodeRequestReply.swift
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
    func pinCodeRequestReply(address: BluetoothAddress,
                             pinCodeLength: HCIPINCodeRequestReply.PINCodeLength,
                             pinCode: UInt128,
                             timeout: HCICommandTimeout = .default) async throws -> BluetoothAddress {
        
        let command = HCIPINCodeRequestReply(address: address,
                                             pinCodeLength: pinCodeLength,
                                             pinCode: pinCode)
        
        return try await deviceRequest(command, HCIPINCodeRequestReplyReturn.self, timeout: timeout).address
    }
}

// MARK: - Command

/// PIN Code Request Reply Command
///
/// The PIN_Code_Request_Reply command is used to reply to a PIN Code request event from the BR/EDR Controller, and specifies the PIN code to use for a connection. The PIN Code Request event will be generated when a con- nection with remote initiating device has requested pairing.
///
/// When the BR/EDR Controller generates a PIN Code Request event in order for the local Link Manager to respond to the request from the remote Link Man- ager (as a result of a Create_Connection or Authentication_Requested com- mand from the remote Host), the local Host must respond with either a PIN_Code_Request_Reply or PIN_Code_Request_Negative_Reply com- mand before the remote Link Manager detects LMP response timeout
@frozen
public struct HCIPINCodeRequestReply: HCICommandParameter {
    
    public static let command = LinkControlCommand.pinCodeReply
    
    public var address: BluetoothAddress
    
    public var pinCodeLength: PINCodeLength
    
    public var pinCode: UInt128
    
    public init(address: BluetoothAddress,
                pinCodeLength: PINCodeLength,
                pinCode: UInt128) {
        
        self.address = address
        self.pinCodeLength = pinCodeLength
        self.pinCode = pinCode
    }
    
    public var data: Data {
        
        let addressBytes = address.littleEndian.bytes
        
        let pinCodeBytes = pinCode.littleEndian.bytes
        
        return Data([addressBytes.0,
                     addressBytes.1,
                     addressBytes.2,
                     addressBytes.3,
                     addressBytes.4,
                     addressBytes.5,
                     pinCodeLength.rawValue,
                     pinCodeBytes.0,
                     pinCodeBytes.1,
                     pinCodeBytes.2,
                     pinCodeBytes.3,
                     pinCodeBytes.4,
                     pinCodeBytes.5,
                     pinCodeBytes.6,
                     pinCodeBytes.7,
                     pinCodeBytes.8,
                     pinCodeBytes.9,
                     pinCodeBytes.10,
                     pinCodeBytes.11,
                     pinCodeBytes.12,
                     pinCodeBytes.13,
                     pinCodeBytes.14,
                     pinCodeBytes.15
                    ])
    }
}

extension HCIPINCodeRequestReply {
    
    public struct PINCodeLength: RawRepresentable {
        
        public static let min = PINCodeLength(0x00)
        
        public static let max = PINCodeLength(0x10)
        
        public let rawValue: UInt8
        
        public init?(rawValue: UInt8) {
            
            guard rawValue <= PINCodeLength.max.rawValue,
                rawValue >= PINCodeLength.min.rawValue
                else { return nil }
            
            self.rawValue = rawValue
        }
        
        private init(_ unsafe: UInt8) {
            
            self.rawValue = unsafe
        }
    }
}

// MARK: - Return Parameter

@frozen
public struct HCIPINCodeRequestReplyReturn: HCICommandReturnParameter {
    
    public static let command = LinkControlCommand.pinCodeReply
    
    public static let length: Int = 6
    
    public let address: BluetoothAddress
    
    public init?(data: Data) {
        
        guard data.count == HCIPINCodeRequestReplyReturn.length
            else { return nil }
        
        let address = BluetoothAddress(littleEndian: BluetoothAddress(bytes: (data[0], data[1], data[2], data[3], data[4], data[5])))
        
        self.address = address
    }
}
