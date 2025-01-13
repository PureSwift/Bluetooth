//
//  CharacteristicDescriptor.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 4/17/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Bluetooth

/// GATT Characteristic Descriptor
public protocol GATTDescriptor: DataConvertible {

    /// Bluetooth UUID of the descriptor.
    static var uuid: BluetoothUUID { get }

    /// Decode from data.
    init?<Data: DataContainer>(data: Data)

    /// Encode to data.
    func append<Data: DataContainer>(to data: inout Data)
}

public extension GATTAttribute.Descriptor {

    init<Descriptor: GATTDescriptor>(
        _ descriptor: Descriptor,
        permissions: ATTAttributePermissions = [.read]
    ) {
        self.init(
            uuid: Descriptor.uuid,
            value: Data(descriptor),
            permissions: permissions
        )
    }
}
