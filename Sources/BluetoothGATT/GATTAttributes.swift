//
//  Attribute.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 4/1/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

import Foundation

/// GATT Attribute
@frozen
public enum GATTAttribute {
    
    /// GATT Service
    public struct Service {
        
        public var uuid: BluetoothUUID
        
        public var primary: Bool
        
        public var characteristics: [Characteristic]
        
        public var includedServices: [Include]
        
        public init(uuid: BluetoothUUID = BluetoothUUID(),
                    primary: Bool = true,
                    characteristics: [Characteristic] = [],
                    includedServices: [Include] = []) {
            
            self.uuid = uuid
            self.characteristics = characteristics
            self.primary = primary
            self.includedServices = includedServices
        }
    }
    
    /// GATT Include Declaration
    public struct Include {
        
        /// Included service handle
        public var serviceHandle: UInt16
        
        /// End group handle
        public var endGroupHandle: UInt16
        
        /// Included Service UUID
        public var serviceUUID: BluetoothUUID
        
        public init(serviceHandle: UInt16,
                    endGroupHandle: UInt16,
                    serviceUUID: BluetoothUUID) {
            
            self.serviceHandle = serviceHandle
            self.endGroupHandle = endGroupHandle
            self.serviceUUID = serviceUUID
        }
    }
    
    /// GATT Characteristic
    public struct Characteristic {
        
        public typealias Property = GATTCharacteristicProperty
        public typealias Permission = ATTAttributePermission
        
        public var uuid: BluetoothUUID
        
        public var value: Data
        
        public var permissions: BitMaskOptionSet<Permission>
        
        public var properties: BitMaskOptionSet<Property>
        
        public var descriptors: [Descriptor]
        
        public init(uuid: BluetoothUUID = BluetoothUUID(),
                    value: Data = Data(),
                    permissions: BitMaskOptionSet<Permission> = [],
                    properties: BitMaskOptionSet<Property> = [],
                    descriptors: [Descriptor] = []) {
            
            self.uuid = uuid
            self.value = value
            self.permissions = permissions
            self.descriptors = descriptors
            self.properties = properties
        }
    }
    
    /// GATT Characteristic Descriptor
    public struct Descriptor {
        
        public typealias Permission = ATTAttributePermission
        
        public var uuid: BluetoothUUID
        
        public var value: Data
        
        public var permissions: BitMaskOptionSet<Permission>
        
        public init(uuid: BluetoothUUID = BluetoothUUID(),
                    value: Data = Data(),
                    permissions: BitMaskOptionSet<Permission> = []) {
            
            self.uuid = uuid
            self.value = value
            self.permissions = permissions
        }
    }
}
