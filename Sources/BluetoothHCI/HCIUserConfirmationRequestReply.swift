//
//  HCIUserConfirmationRequestReply.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 8/17/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

// MARK: - Method

#if !hasFeature(Embedded)
public extension BluetoothHostControllerInterface {

    /// User Confirmation Request Reply Command
    ///
    /// The User_Confirmation_Request_Reply command is used to reply to a User Confirmation Request event and indicates that the user selected "yes".
    /// It is also used when the host has no input and no output capabilities.
    @discardableResult
    func userConfirmationRequestReply(
        address: BluetoothAddress,
        timeout: HCICommandTimeout = .default
    ) async throws -> BluetoothAddress {
        let command = HCIUserConfirmationRequestReply(address: address)
        return try await deviceRequest(command, HCIUserConfirmationRequestReplyReturn.self, timeout: timeout).address
    }
}
#endif

/// User Confirmation Request Reply Command
///
/// The User_Confirmation_Request_Reply command is used to reply to a User Confirmation Request event and indicates that the user selected "yes". It is also used when the host has no input and no output capabilities.
@frozen
public struct HCIUserConfirmationRequestReply: HCICommandParameter {

    public static let command = LinkControlCommand.userConfirmationRequestReply

    public var address: BluetoothAddress

    public init(address: BluetoothAddress) {

        self.address = address
    }

    public func append<Data: DataContainer>(to data: inout Data) {

        let addressBytes = address.littleEndian.bytes

        data += [
            addressBytes.0,
            addressBytes.1,
            addressBytes.2,
            addressBytes.3,
            addressBytes.4,
            addressBytes.5
        ]
    }
}

// MARK: - Return Parameter

@frozen
public struct HCIUserConfirmationRequestReplyReturn: HCICommandReturnParameter {

    public static let command = LinkControlCommand.userConfirmationRequestReply

    public static let length: Int = 6

    public let address: BluetoothAddress

    public init?<Data: DataContainer>(data: Data) {
        guard data.count == HCIUserConfirmationRequestReplyReturn.length
        else { return nil }
        let address = BluetoothAddress(littleEndian: BluetoothAddress(bytes: (data[0], data[1], data[2], data[3], data[4], data[5])))
        self.address = address
    }
}
