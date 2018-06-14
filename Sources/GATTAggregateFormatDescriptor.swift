//
//  GATTAggregateFormatDescriptor.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Characteristic Aggregate Format
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
public struct GATTAggregateFormatDescriptor: GATTDescriptor {
    
    public static let uuid: BluetoothUUID = .characteristicAggregateFormat
    
    public var handles: [UInt16]
    
    public init(handles: [UInt16] = []) {
        
        self.handles = handles
    }
    
    public init?(data: Data) {
        
        // this is not actually UInt16 UUID, but handles
        // since the binary format is the same we can reuse code
        guard let list = Bit16UUIDList(data: data)
            else { return nil }
        
        self.handles = list.uuids
    }
    
    public var data: Data {
        
        return (Bit16UUIDList(uuids: handles)).data
    }
    
    public var descriptor: GATT.Descriptor {
        
        return GATT.Descriptor(uuid: type(of: self).uuid,
                               value: data,
                               permissions: [.read])
    }
    
}
