//
//  HCIWriteClassOfDevice.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 8/15/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

// MARK: - Method

public extension BluetoothHostControllerInterface {

    /// Write Class of Device Command
    ///
    /// This command writes the value for the Class_of_Device parameter.
    func writeClassOfDevice(
        classOfDevice: ClassOfDevice,
        timeout: HCICommandTimeout = .default
    ) async throws {

        let command = HCIWriteClassOfDevice(classOfDevice: classOfDevice)

        return try await deviceRequest(command, timeout: timeout)
    }
}

// MARK: - Command

/// Write Class of Device Command
///
/// This command writes the value for the Class_of_Device parameter.
@frozen
public struct HCIWriteClassOfDevice: HCICommandParameter {

    public static let command = HostControllerBasebandCommand.writeClassOfDevice

    public var classOfDevice: ClassOfDevice

    public init(classOfDevice: ClassOfDevice) {

        self.classOfDevice = classOfDevice
    }

    public func append<Data: DataContainer>(to data: inout Data) {

        data += classOfDevice
    }
}
