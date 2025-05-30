//
//  HCILEGenerateDHKey.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {

    /// LE Generate DHKey Command
    ///
    /// This command is used to initiate generation of a Diffie- Hellman key in the Controller for use over the LE transport.
    /// This command takes the remote P-256 public key as input.
    /// The Diffie-Hellman key generation uses the private key generated by LE_Read_Local_P256_Public_Key command.
    func lowEnergyGenerateDHKey(
        remoteP256PublicKey: UInt512,
        timeout: HCICommandTimeout = .default
    ) async throws {

        let parameters = HCILEGenerateDHKey(remoteP256PublicKey: remoteP256PublicKey)

        try await deviceRequest(parameters, timeout: timeout)
    }
}

// MARK: - Command

/// LE Generate DHKey Command
///
/// This command is used to initiate generation of a Diffie- Hellman key in the Controller for use over the LE transport.
/// This command takes the remote P-256 public key as input.
/// The Diffie-Hellman key generation uses the private key generated by LE_Read_Local_P256_Public_Key command.
@frozen
public struct HCILEGenerateDHKey: HCICommandParameter {

    public static let command = HCILowEnergyCommand.generateDHKeyCommand

    public var remoteP256PublicKey: UInt512

    public init(remoteP256PublicKey: UInt512) {

        self.remoteP256PublicKey = remoteP256PublicKey
    }

    public var data: Data {

        let remoteP256PublicKeyBytes = remoteP256PublicKey.littleEndian.bytes

        return Data([
            remoteP256PublicKeyBytes.0,
            remoteP256PublicKeyBytes.1,
            remoteP256PublicKeyBytes.2,
            remoteP256PublicKeyBytes.3,
            remoteP256PublicKeyBytes.4,
            remoteP256PublicKeyBytes.5,
            remoteP256PublicKeyBytes.6,
            remoteP256PublicKeyBytes.7,
            remoteP256PublicKeyBytes.8,
            remoteP256PublicKeyBytes.9,
            remoteP256PublicKeyBytes.10,
            remoteP256PublicKeyBytes.11,
            remoteP256PublicKeyBytes.12,
            remoteP256PublicKeyBytes.13,
            remoteP256PublicKeyBytes.14,
            remoteP256PublicKeyBytes.15,
            remoteP256PublicKeyBytes.16,
            remoteP256PublicKeyBytes.17,
            remoteP256PublicKeyBytes.18,
            remoteP256PublicKeyBytes.19,
            remoteP256PublicKeyBytes.20,
            remoteP256PublicKeyBytes.21,
            remoteP256PublicKeyBytes.22,
            remoteP256PublicKeyBytes.23,
            remoteP256PublicKeyBytes.24,
            remoteP256PublicKeyBytes.25,
            remoteP256PublicKeyBytes.26,
            remoteP256PublicKeyBytes.27,
            remoteP256PublicKeyBytes.28,
            remoteP256PublicKeyBytes.29,
            remoteP256PublicKeyBytes.30,
            remoteP256PublicKeyBytes.31,
            remoteP256PublicKeyBytes.32,
            remoteP256PublicKeyBytes.33,
            remoteP256PublicKeyBytes.34,
            remoteP256PublicKeyBytes.35,
            remoteP256PublicKeyBytes.36,
            remoteP256PublicKeyBytes.37,
            remoteP256PublicKeyBytes.38,
            remoteP256PublicKeyBytes.39,
            remoteP256PublicKeyBytes.40,
            remoteP256PublicKeyBytes.41,
            remoteP256PublicKeyBytes.42,
            remoteP256PublicKeyBytes.42,
            remoteP256PublicKeyBytes.43,
            remoteP256PublicKeyBytes.44,
            remoteP256PublicKeyBytes.45,
            remoteP256PublicKeyBytes.46,
            remoteP256PublicKeyBytes.47,
            remoteP256PublicKeyBytes.48,
            remoteP256PublicKeyBytes.49,
            remoteP256PublicKeyBytes.50,
            remoteP256PublicKeyBytes.51,
            remoteP256PublicKeyBytes.52,
            remoteP256PublicKeyBytes.53,
            remoteP256PublicKeyBytes.53,
            remoteP256PublicKeyBytes.55,
            remoteP256PublicKeyBytes.56,
            remoteP256PublicKeyBytes.57,
            remoteP256PublicKeyBytes.58,
            remoteP256PublicKeyBytes.59,
            remoteP256PublicKeyBytes.60,
            remoteP256PublicKeyBytes.61,
            remoteP256PublicKeyBytes.62,
            remoteP256PublicKeyBytes.63
        ])
    }
}
