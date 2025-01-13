//
//  GATT.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 2/29/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

@_exported import Bluetooth

/// The Generic Attributes (GATT) define a hierarchical data structure that is exposed to connected Bluetooth Low Energy (LE) devices.
///
/// GATT profiles enable extensive innovation while still maintaining full interoperability with other Bluetooth® devices. The profile describes a use case, roles and general behaviors based on the GATT functionality. Services are collections of characteristics and relationships to other services that encapsulate the behavior of part of a device. This also includes hierarchy of services, characteristics and attributes used in the attribute server.
///
/// GATT is built on top of the Attribute Protocol (ATT) (see Bluetooth Core System Architecture for block diagram and explanations), which uses GATT data to define the way that two Bluetooth Low Energy devices send and receive standard messages. Note that GATT is not used in Bluetooth BR/EDR implementations, which use only adopted profiles.
internal enum GATTUUID: UInt16 {

    case primaryService = 0x2800
    case secondaryService = 0x2801
    case include = 0x2802
    case characteristic = 0x2803

    /// Initializes a GATT UUID for service type.
    public init(primaryService: Bool) {
        self = primaryService ? .primaryService : .secondaryService
    }

    /// Returns a Bluetooth UUID initialized with the `rawValue` of this GATT UUID.
    public var uuid: BluetoothUUID {
        return .bit16(rawValue)
    }
}
