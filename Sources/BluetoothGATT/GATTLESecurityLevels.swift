//
//  GATTLESecurityLevels.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 7/9/26.
//  Copyright © 2026 PureSwift. All rights reserved.
//

import Bluetooth

/// LE GATT Security Levels
///
/// The LE GATT Security Levels characteristic (Bluetooth Core 5.4) allows clients to
/// determine the security conditions which must be satisfied for access to all GATT
/// server functionality to be granted, before accessing the attributes the application
/// uses. The value is an array of one or more Security Level Requirements fields, each
/// consisting of a security mode and a security level.
///
/// The characteristic allows read access to its value without further security
/// restrictions, such as the need for the link to be encrypted.
///
/// - SeeAlso: [Bluetooth Core Specification](https://www.bluetooth.com/specifications/specs/) Vol 3 Part C 12.7
@frozen
public struct GATTLESecurityLevels: GATTCharacteristic, Equatable, Hashable, Sendable {

    public static var uuid: BluetoothUUID { BluetoothUUID.Characteristic.leGattSecurityLevels }

    /// Security Level Requirements which will satisfy the security requirements
    /// of all attributes of the server.
    public var requirements: [Requirement]

    public init?(requirements: [Requirement]) {

        guard requirements.isEmpty == false
        else { return nil }

        self.requirements = requirements
    }

    public init?<Data: DataContainer>(data: Data) {

        let length = MemoryLayout<UInt8>.size * 2

        guard data.count >= length,
            data.count % length == 0
        else { return nil }

        var requirements = [Requirement]()
        requirements.reserveCapacity(data.count / length)

        var offset = 0
        while offset < data.count {
            requirements.append(
                Requirement(
                    mode: data[offset],
                    level: data[offset + 1]
                ))
            offset += length
        }

        self.init(requirements: requirements)
    }

    public func append<Data: DataContainer>(to data: inout Data) {

        for requirement in requirements {
            data += requirement.mode
            data += requirement.level
        }
    }

    public var dataLength: Int {

        return requirements.count * 2
    }

    /// Security Level Requirements field.
    ///
    /// A combination of an LE security mode (e.g. `0x01` for LE security mode 1)
    /// and a security level within that mode (e.g. `0x04` for security level 4).
    /// Raw values are stored so that values defined in future specification
    /// versions round-trip losslessly.
    public struct Requirement: Equatable, Hashable, Sendable {

        /// LE Security Mode (e.g. `0x01` for LE security mode 1)
        public var mode: UInt8

        /// Security Level (e.g. `0x04` for security level 4)
        public var level: UInt8

        public init(mode: UInt8, level: UInt8) {

            self.mode = mode
            self.level = level
        }
    }
}
