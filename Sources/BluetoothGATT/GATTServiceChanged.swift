//
//  GATTServiceChanged.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 7/9/26.
//  Copyright © 2026 PureSwift. All rights reserved.
//

import Bluetooth

/// Service Changed
///
/// The Service Changed characteristic is a control-point attribute that shall be used to
/// indicate to connected devices that services have changed (i.e., added, removed, or modified).
///
/// The value is two 16-bit attribute handles indicating the beginning and ending of the
/// affected attribute handle range on the server.
///
/// - SeeAlso: [Bluetooth Core Specification](https://www.bluetooth.com/specifications/specs/) Vol 3 Part G 7.1
@frozen
public struct GATTServiceChanged: GATTCharacteristic, Equatable, Hashable, Sendable {

    internal static let length = MemoryLayout<UInt16>.size * 2

    public static var uuid: BluetoothUUID { BluetoothUUID.Characteristic.serviceChanged }

    /// Start of affected attribute handle range.
    public var start: UInt16

    /// End of affected attribute handle range.
    public var end: UInt16

    public init(start: UInt16, end: UInt16) {

        self.start = start
        self.end = end
    }

    public init?<Data: DataContainer>(data: Data) {

        guard data.count == Self.length
        else { return nil }

        self.init(
            start: UInt16(littleEndian: UInt16(bytes: (data[0], data[1]))),
            end: UInt16(littleEndian: UInt16(bytes: (data[2], data[3]))))
    }

    public func append<Data: DataContainer>(to data: inout Data) {

        let startBytes = start.littleEndian.bytes
        let endBytes = end.littleEndian.bytes

        data += [
            startBytes.0,
            startBytes.1,
            endBytes.0,
            endBytes.1
        ]
    }

    public var dataLength: Int {

        return Self.length
    }
}
