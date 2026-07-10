//
//  GATTDatabaseHash.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 7/9/26.
//  Copyright © 2026 PureSwift. All rights reserved.
//

import Bluetooth

/// Database Hash
///
/// The Database Hash characteristic contains the result of a hash function applied to the
/// service definitions in the GATT database. The value is a 128-bit AES-CMAC hash which
/// clients supporting robust caching use to detect changes to the attribute database.
///
/// - Note: This type only carries the hash value; computing the AES-CMAC over the
/// database contents is out of scope for this library.
///
/// - SeeAlso: [Bluetooth Core Specification](https://www.bluetooth.com/specifications/specs/) Vol 3 Part G 7.3
@frozen
public struct GATTDatabaseHash: GATTCharacteristic, Equatable, Hashable, Sendable {

    internal static let length = MemoryLayout<UInt128>.size

    public static var uuid: BluetoothUUID { BluetoothUUID.Characteristic.databaseHash }

    /// 128-bit AES-CMAC hash of the GATT database.
    public var hash: UInt128

    public init(hash: UInt128) {

        self.hash = hash
    }

    public init?<Data: DataContainer>(data: Data) {

        guard data.count == Self.length
        else { return nil }

        guard let hash = UInt128(data: data)
        else { return nil }

        self.init(hash: UInt128(littleEndian: hash))
    }

    public func append<Data: DataContainer>(to data: inout Data) {

        data += hash.littleEndian
    }

    public var dataLength: Int {

        return Self.length
    }
}
