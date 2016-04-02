//
//  Attribute.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 4/1/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

import struct SwiftFoundation.UUID
import struct SwiftFoundation.Data

public extension GATT {
    
    public typealias Permission = ATT.AttributePermission
    
    /// GATT Service
    public struct Service {
        
        public var UUID: Bluetooth.UUID
        
        public var primary: Bool
        
        public var characteristics: [Characteristic]
        
        public var includedServices: [IncludedService]
        
        public init(UUID: Bluetooth.UUID, primary: Bool = true, characteristics: [Characteristic] = [], includedServices: [IncludedService] = []) {
            
            self.UUID = UUID
            self.characteristics = characteristics
            self.primary = primary
            self.includedServices = includedServices
        }
    }
    
    /// GATT Included Service Declaration
    public struct IncludedService {
        
        // TODO: Implement Included Service
    }
    
    /// GATT Characteristic
    public struct Characteristic {
        
        public typealias Descriptor = GATT.Descriptor
        public typealias Property = GATT.CharacteristicProperty
        
        public var UUID: Bluetooth.UUID
        
        public var value: Data
        
        public var descriptors: [Descriptor]
        
        public var permissions: [Permission]
        
        public var properties: [Property]
        
        public init(UUID: Bluetooth.UUID,
                    value: Data = Data(),
                    permissions: [Permission] = [],
                    properties: [Property] = [],
                    descriptors: [Descriptor] = []) {
            
            self.UUID = UUID
            self.value = value
            self.permissions = permissions
            self.descriptors = descriptors
            self.properties = properties
        }
    }
    
    /// GATT Characteristic Descriptor
    public struct Descriptor {
        
        public var UUID: Bluetooth.UUID
        
        public var permissions: [Permission]
        
        public var value: [UInt8]
        
        public init(UUID: Bluetooth.UUID, value: [UInt8] = [], permissions: [Permission] = []) {
            
            self.UUID = UUID
            self.value = value
            self.permissions = permissions
        }
    }
}
