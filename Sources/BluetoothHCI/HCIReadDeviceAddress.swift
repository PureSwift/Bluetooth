//
//  HCIReadDeviceAddress.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {

    /// Read Device Address
    func readDeviceAddress(timeout: HCICommandTimeout = .default) async throws -> BluetoothAddress {

        return try await deviceRequest(HCIReadDeviceAddress.self, timeout: timeout).address
    }
}

// MARK: - Return Parameter

/// Read Device Address
///
/// On a BR/EDR Controller, this command reads the Bluetooth Controller address (BD_ADDR).
///
/// On an LE Controller, this command shall read the Public Device Address.
/// If this Controller does not have a Public Device Address, the value 0x000000000000 shall be returned.
///
/// - Note: On a BR/EDR/LE Controller, the public address shall be the same as the `BD_ADDR`.
@frozen
public struct HCIReadDeviceAddress: HCICommandReturnParameter {

    public static let command = InformationalCommand.readDeviceAddress

    public static let length = 6

    /// The Bluetooth address of the device.
    public let address: BluetoothAddress

    public init?<Data: DataContainer>(data: Data) {

        guard data.count == Self.length
        else { return nil }

        self.address = BluetoothAddress(littleEndian: BluetoothAddress(bytes: (data[0], data[1], data[2], data[3], data[4], data[5])))
    }
}
