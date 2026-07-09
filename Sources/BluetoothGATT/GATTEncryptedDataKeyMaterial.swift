//
//  GATTEncryptedDataKeyMaterial.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 7/9/26.
//  Copyright © 2026 PureSwift. All rights reserved.
//

import Bluetooth

/// Encrypted Data Key Material
///
/// The Encrypted Data Key Material characteristic provides the key material used
/// with the Encrypted Advertising Data feature (Bluetooth Core 5.4): a 16-octet
/// session key and an 8-octet initialization vector.
///
/// A GATT client may read this value over an encrypted and authenticated connection only,
/// and the characteristic may support indications to notify clients when the key material
/// changes. Enforcing those security requirements is the responsibility of the GATT server
/// configuration, not this type.
///
/// - Note: This type only carries the key material; encryption and decryption of
/// advertising payloads (CCM) is out of scope for this library.
///
/// - SeeAlso: [Bluetooth Core Specification](https://www.bluetooth.com/specifications/specs/) Vol 3 Part C 12.6
@frozen
public struct GATTEncryptedDataKeyMaterial: GATTCharacteristic, Equatable, Hashable, Sendable {

    internal static let length = MemoryLayout<UInt128>.size + MemoryLayout<UInt64>.size

    public static var uuid: BluetoothUUID { BluetoothUUID.Characteristic.encryptedDataKeyMaterial }

    /// Session Key (16 octets)
    public var sessionKey: UInt128

    /// Initialization Vector (8 octets)
    public var initializationVector: UInt64

    public init(sessionKey: UInt128, initializationVector: UInt64) {

        self.sessionKey = sessionKey
        self.initializationVector = initializationVector
    }

    public init?<Data: DataContainer>(data: Data) {

        guard data.count == Self.length
        else { return nil }

        guard let sessionKey = UInt128(data: data.subdata(in: 0..<MemoryLayout<UInt128>.size))
        else { return nil }

        let ivOffset = MemoryLayout<UInt128>.size
        let initializationVector = UInt64(
            littleEndian: UInt64(
                bytes: (
                    data[ivOffset],
                    data[ivOffset + 1],
                    data[ivOffset + 2],
                    data[ivOffset + 3],
                    data[ivOffset + 4],
                    data[ivOffset + 5],
                    data[ivOffset + 6],
                    data[ivOffset + 7]
                )))

        self.init(
            sessionKey: UInt128(littleEndian: sessionKey),
            initializationVector: initializationVector)
    }

    public func append<Data: DataContainer>(to data: inout Data) {

        data += sessionKey.littleEndian
        data += initializationVector.littleEndian
    }

    public var dataLength: Int {

        return Self.length
    }
}
