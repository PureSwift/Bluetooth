//
//  HCIReadRemoteSupportedFeatures.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 8/6/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

// MARK: - Method

#if !hasFeature(Embedded)
public extension BluetoothHostControllerInterface {

    /// Read Remote Supported Features Command
    ///
    /// This command requests a list of the supported features for the remote device identified by the Connection_Handle parameter. The Connection_Handle must be a Connection_Handle for an ACL connection. The Read Remote Supported Features Complete event will return a list of the LMP features.
    func readRemoteSupportedFeatures(
        handle: UInt16,
        timeout: HCICommandTimeout = .default
    ) async throws -> LMPFeature {

        let readRemoteSupportedFeatures = HCIReadRemoteSupportedFeatures(handle: handle)

        return try await deviceRequest(
            readRemoteSupportedFeatures,
            HCIReadRemoteSupportedFeaturesComplete.self,
            timeout: timeout
        ).features
    }
}
#endif

// MARK: - Command

/// Read Remote Supported Features Command
///
/// This command requests a list of the supported features for the remote device identified by the Connection_Handle parameter. The Connection_Handle must be a Connection_Handle for an ACL connection. The Read Remote Supported Features Complete event will return a list of the LMP features.
@frozen
public struct HCIReadRemoteSupportedFeatures: HCICommandParameter {

    public static let command = LinkControlCommand.readRemoteFeatures

    /// Specifies which Connection_Handle’s LMP-supported features list to get.
    public var handle: UInt16

    public init(handle: UInt16) {

        self.handle = handle
    }

    public func append<Data: DataContainer>(to data: inout Data) {

        let handleBytes = handle.littleEndian.bytes

        data += [handleBytes.0, handleBytes.1]
    }
}
