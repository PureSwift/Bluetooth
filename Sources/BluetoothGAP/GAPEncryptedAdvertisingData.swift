//
//  GAPEncryptedAdvertisingData.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 7/9/26.
//  Copyright © 2026 PureSwift. All rights reserved.
//

@_exported import Bluetooth

/// Encrypted Advertising Data
///
/// The Encrypted Advertising Data (Bluetooth Core 5.4) data type contains encrypted data
/// encoded using CCM with the session key and initialization vector shared via the
/// Encrypted Data Key Material GATT characteristic.
///
/// The value consists of a 5-octet Randomizer, followed by the encrypted payload
/// (one or more encrypted AD structures) and a 4-octet MIC.
///
/// - Note: This type only carries the raw fields; CCM encryption and decryption of
/// the payload is out of scope for this library and must be performed by the consumer.
///
/// - SeeAlso: Core Specification Supplement, Part A, Section 1.23
@frozen
public struct GAPEncryptedAdvertisingData<Payload: DataContainer>: GAPData, Equatable, Hashable, Sendable {

    internal static var minimumLength: Int { 5 + 4 }  // randomizer + MIC

    /// GAP Data Type
    public static var dataType: GAPDataType { .encryptedAdvertisingData }

    /// Randomizer (5 octets)
    public var randomizer: UInt40

    /// Encrypted payload (cyphertext of one or more AD structures).
    public var encryptedPayload: Payload

    /// Message Integrity Check (4 octets)
    public var mic: UInt32

    public init(
        randomizer: UInt40,
        encryptedPayload: Payload,
        mic: UInt32
    ) {

        self.randomizer = randomizer
        self.encryptedPayload = encryptedPayload
        self.mic = mic
    }

    public init?<Data: DataContainer>(data: Data) {

        guard data.count >= Self.minimumLength
        else { return nil }

        let randomizer = UInt40(
            littleEndian: UInt40(
                bytes: (
                    data[0],
                    data[1],
                    data[2],
                    data[3],
                    data[4]
                )))

        let micOffset = data.count - 4
        let mic = UInt32(
            littleEndian: UInt32(
                bytes: (
                    data[micOffset],
                    data[micOffset + 1],
                    data[micOffset + 2],
                    data[micOffset + 3]
                )))

        let encryptedPayload = data.count > Self.minimumLength ? Payload(data[5..<micOffset]) : Payload()

        self.init(
            randomizer: randomizer,
            encryptedPayload: encryptedPayload,
            mic: mic)
    }

    public func append<Data: DataContainer>(to data: inout Data) {

        let randomizerBytes = randomizer.littleEndian.bytes
        data += [
            randomizerBytes.0,
            randomizerBytes.1,
            randomizerBytes.2,
            randomizerBytes.3,
            randomizerBytes.4
        ]

        data += encryptedPayload

        let micBytes = mic.littleEndian.bytes
        data += [micBytes.0, micBytes.1, micBytes.2, micBytes.3]
    }

    public var dataLength: Int {

        return Self.minimumLength + encryptedPayload.count
    }
}

// MARK: - CustomStringConvertible

extension GAPEncryptedAdvertisingData: CustomStringConvertible {

    public var description: String {
        return "GAPEncryptedAdvertisingData(randomizer: \(randomizer), encryptedPayload: \(encryptedPayload.toHexadecimal()), mic: \(mic))"
    }
}

// MARK: - DataConvertible

extension GAPEncryptedAdvertisingData: DataConvertible {

    static func += <T: DataContainer>(data: inout T, value: GAPEncryptedAdvertisingData) {
        value.append(to: &data)
    }
}
