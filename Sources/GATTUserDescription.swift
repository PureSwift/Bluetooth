//
//  GATTUserDescription.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Characteristic User Description
/// GATT Characteristic User Description Descriptor
///
/// The Characteristic User Description descriptor provides a textual user description for a characteristic value.
///
/// If the Writable Auxiliary bit of the Characteristics Properties is set then this descriptor is written.
/// Only one User Description descriptor exists in a characteristic definition.
public struct GATTUserDescription: GATTDescriptor {
    
    public static let uuid: BluetoothUUID = .characteristicUserDescription
    
    public var userDescription: String
    
    public init(userDescription: String) {
        
        self.userDescription = userDescription
    }
    
    public init?(data: Data) {
        
        guard let rawValue = String(data: data, encoding: .utf8)
            else { return nil }
        
        self.init(userDescription: rawValue)
    }
    
    public var data: Data {
        
        return Data(userDescription.utf8)
    }
    
    public var descriptor: GATT.Descriptor {
        return GATT.Descriptor(uuid: type(of: self).uuid,
                               value: data,
                               permissions: [])
    }
}
