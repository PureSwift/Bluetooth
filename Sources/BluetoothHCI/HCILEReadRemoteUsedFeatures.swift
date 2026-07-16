//
//  HCILEReadRemoteUsedFeatures.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

// MARK: - Method

#if !hasFeature(Embedded)
public extension BluetoothHostControllerInterface {

    /// LE Read Remote Features Command
    ///
    /// The command requests, from the remote device identified by the connection handle,
    /// the features used on the connection and the features supported by the remote device.
    func lowEnergyReadRemoteUsedFeatures(connectionHandle: UInt16, timeout: HCICommandTimeout = .default) async throws -> LowEnergyFeatureSet {

        let parameters = HCILEReadRemoteUsedFeatures(connectionHandle: connectionHandle)

        let event = try await deviceRequest(
            parameters,
            HCILEReadRemoteUsedFeaturesComplete.self,
            timeout: timeout)

        switch event.status {

        case let .error(error):
            throw error

        case .success:

            assert(event.handle == connectionHandle, "Invalid connection handle \(event.handle)")

            return event.features
        }
    }
}
#endif

// MARK: - Command

/// LE Read Remote Features Command
///
/// The command requests, from the remote device identified by the connection handle,
/// the features used on the connection and the features supported by the remote device.
///
/// This command may be issued on both the master and slave.
///
/// Note: If a connection already exists between the two devices and the features have already been fetched on that connection,
//// the Controller may use a cached copy of the features.
@frozen
public struct HCILEReadRemoteUsedFeatures: HCICommandParameter {  //HCI_LE_Read_Remote_Features

    public static let command = HCILowEnergyCommand.readRemoteUsedFeatures  //0x0016

    public let connectionHandle: UInt16  //Connection_Handle

    public init(connectionHandle: UInt16) {
        self.connectionHandle = connectionHandle
    }

    public func append<Data: DataContainer>(to data: inout Data) {

        let connectionHandleBytes = connectionHandle.littleEndian.bytes

        data += [
            connectionHandleBytes.0,
            connectionHandleBytes.1
        ]
    }
}
