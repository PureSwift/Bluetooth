//
//  GATTExternalReportReference.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Bluetooth

/// GATT External Report Reference Descriptor
///
/// The External Report Reference characteristic descriptor allows a HID Host to map information from the Report Map characteristic value for Input Report, Output Report or Feature Report data to the Characteristic UUID of external service characteristics used to transfer the associated data.
@frozen
public struct GATTExternalReportReference: GATTDescriptor, Hashable, Sendable {

    public static var uuid: BluetoothUUID { BluetoothUUID.Descriptor.externalReportReference }

    public var uuid: BluetoothUUID

    public init(uuid: BluetoothUUID) {
        self.uuid = uuid
    }
}

extension GATTExternalReportReference: DataConvertible {

    public init?<Data: DataContainer>(data: Data) {
        guard let uuid = BluetoothUUID(data: data)
        else { return nil }
        self.init(uuid: BluetoothUUID(littleEndian: uuid))
    }

    public func append<Data>(to data: inout Data) where Data: DataContainer {
        data += uuid
    }

    public var dataLength: Int {
        uuid.dataLength
    }
}
