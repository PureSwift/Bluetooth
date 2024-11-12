//
//  GATTCharacteristic.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/10/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation
import Bluetooth
import Foundation

/// GATT Characteristic protocol.
///
/// Describes a type that can encode / decode data to a characteristic type.
public protocol GATTCharacteristic: DeprecatedGATTCharacteristic {
    
    /// The Bluetooth UUID of the characteristic.
    static var uuid: BluetoothUUID { get }
    
    /// Initialize from data.
    init?<Data: DataContainer>(data: Data)
    
    /// Append data representation into buffer.
    func append<Data: DataContainer>(to data: inout Data)
}

public extension DataContainer {
    
    /// Initialize data with contents of value.
    init <T: GATTCharacteristic> (_ value: T) {
        self.init()
        value.append(to: &self)
    }
}

public protocol DeprecatedGATTCharacteristic {
    
    init?(data: Data)
    
    var data: Data { get }
}

public extension GATTCharacteristic {
    
    // TODO: Remove Foundation.Data Usage
    var data: Data {
        Data(self)
    }
    
    // TODO: Should implement at least one of these
    func append<Data: DataContainer>(to data: inout Data) {
        data += self.data
    }
}
