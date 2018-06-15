//
//  GATTExternalReportReference.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - External Report Reference
/// GATT External Report Reference Descriptor
///
/// The External Report Reference characteristic descriptor allows a HID Host to map information from the Report Map characteristic value for Input Report, Output Report or Feature Report data to the Characteristic UUID of external service characteristics used to transfer the associated data.
public struct GATTExternalReportReference: GATTDescriptor {
    
    public static let uuid: BluetoothUUID = .externalReportReference
    
    public let uuid: BluetoothUUID
    
    public init(uuid: BluetoothUUID) {
        
        self.uuid = uuid
    }
    
    public init?(data: Data) {
        
        guard let uuid = BluetoothUUID(data: data)
            else { return nil }
        
        self.init(uuid: BluetoothUUID(littleEndian: uuid))
    }
    
    public var data: Data {
        
        return uuid.data
    }
    
    public var descriptor: GATT.Descriptor {
        
        return GATT.Descriptor(uuid: type(of: self).uuid,
                               value: data,
                               permissions: [.read])
    }
}
