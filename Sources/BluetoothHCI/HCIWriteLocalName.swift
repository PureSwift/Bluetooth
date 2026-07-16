//
//  HCIWriteLocalName.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

// MARK: - Method

#if !hasFeature(Embedded)
public extension BluetoothHostControllerInterface {

    /// Read Local Name Command
    ///
    /// Provides the ability to read the stored user-friendly name for the BR/EDR Controller.
    func writeLocalName(_ newValue: String, timeout: HCICommandTimeout = .default) async throws {

        guard let command = HCIWriteLocalName(localName: newValue)
        else { fatalError("Invalid string length \(newValue)") }

        try await deviceRequest(command, timeout: timeout)
    }
}
#endif

// MARK: - Command

/// The Write Local Name command provides the ability to modify the user-friendly name for the BR/EDR Controller.
@frozen
public struct HCIWriteLocalName: HCICommandParameter {

    public static let command = HostControllerBasebandCommand.writeLocalName

    public static let length = HCI.maximumNameLength

    public let localName: String

    public init?(localName: String) {

        guard localName.utf8.count <= Self.length
        else { return nil }

        self.localName = localName
    }

    public func append<Data: DataContainer>(to data: inout Data) {

        let maxLength = Self.length
        let utf8 = localName.utf8

        assert(utf8.count <= maxLength)

        data += utf8

        if utf8.count < maxLength {

            data += repeatElement(0x00, count: maxLength - utf8.count)
        }
    }
}
