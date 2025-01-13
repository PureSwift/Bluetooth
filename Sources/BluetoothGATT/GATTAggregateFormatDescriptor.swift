//
//  GATTAggregateFormatDescriptor.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Bluetooth

/// GATT Characteristic Aggregate Format Descriptor
///
/// The Characteristic Aggregate Format descriptor defines the format of an aggregated Characteristic Value.
///
/// Only one Characteristic Aggregate Format descriptor exists in a characteristic definition.
/// This descriptor consists of a list of Attribute Handles pointing to Characteristic Presentation Format declarations.
/// This descriptor is read only and does not require authentication or authorization.
/// The list of Attribute Handles is the concatenation of multiple 16-bit Attribute Handle values into a single Attribute Value.
/// If more than one Characteristic Presentation Format declarations exist, then there is one Characteristic Aggregate Format declaration.
/// However, a Characteristic Aggregate Format descriptor can be present even if there aren't any Presentation Format descriptors in the characteristic definition. The order of the Attribute Handles in the list is significant.
///
/// Example:
/// If 3 Characteristic Presentation Format declarations exist at Attribute Handles 0x40, 0x50 and 0x60,
/// the Characteris Aggregate Format Value is 0x405060.
@frozen
public struct GATTAggregateFormatDescriptor: GATTDescriptor, Equatable, Hashable, Sendable {

    public static var uuid: BluetoothUUID { BluetoothUUID.Descriptor.characteristicAggregateFormat }

    public var handles: [UInt16]

    public init(handles: [UInt16] = []) {
        self.handles = handles
    }
}

// MARK: - DataConvertible

extension GATTAggregateFormatDescriptor: DataConvertible {

    public init?<Data: DataContainer>(data: Data) {

        // this is not actually UInt16 UUID, but handles
        // since the binary format is the same we can reuse code
        guard let list = GATTUUIDList<UInt16>(data: data)
        else { return nil }

        self.handles = list.uuids
    }

    public func append<Data>(to data: inout Data) where Data: DataContainer {
        data += GATTUUIDList<UInt16>(uuids: handles)
    }

    public var dataLength: Int {
        GATTUUIDList<UInt16>(uuids: handles).dataLength
    }
}
