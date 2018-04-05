//
//  GATTDatabase.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 2/29/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

import Foundation

/// GATT Database
public struct GATTDatabase {
    
    // MARK: - Internal Properties
    
    internal private(set) var attributeGroups = [AttributeGroup]()
    
    /// Do not access directly, use `newHandle()`
    private var lastHandle: UInt16 = 0x0000
    
    // MARK: - Initialization
    
    public init() { }
    
    // MARK: - Dynamic Properties
    
    /// Whether the database contains any attributes. 
    public var isEmpty: Bool {
        
        return attributeGroups.isEmpty
    }
    
    /// Attribute representation of the database.
    public var attributes: [Attribute] {
        
        var attributes = [Attribute]()
        
        for group in attributeGroups {
            
            attributes += group.attributes
        }
        
        return attributes
    }
    
    // MARK: - Methods
    
    public mutating func add(service: Service) -> UInt16 {
        
        let newHandle = self.newHandle()
        
        let serviceAttribute = Attribute(service: service, handle: newHandle)
        
        var attributes = [serviceAttribute]
        
        for characteristic in service.characteristics {

            let newHandle = self.newHandle()
            
            attributes += Attribute.from(characteristic: characteristic, handle: newHandle)
            
            lastHandle = attributes.last!.handle
        }
        
        let group = AttributeGroup(attributes: attributes)
        
        attributeGroups.append(group)
        
        return serviceAttribute.handle
    }
    
    /// Clear the database.
    public mutating func clear() {
        
        self.attributeGroups = []
    }
    
    /// Remove the Service at the specified index.
    public mutating func remove(service handle: UInt16) {
        
        guard let serviceIndex = attributeGroups.index(where: { $0.service.handle == handle })
            else { fatalError("Service with handle \(handle) doesnt exist") }
        
        attributeGroups.remove(at: serviceIndex)
    }
    
    /// Write the value to attribute specified by the handle.
    public mutating func write(_ value: Data, forAttribute handle: UInt16) {
        
        self[handle].value = value
    }
    
    /// The handle of the service at the specified index.
    public func serviceHandles(ofService index: Int) -> (start: UInt16, end: UInt16) {
        
        let service = attributeGroups[index]
        
        return (service.startHandle, service.endHandle)
    }
    
    // MARK: - Subscripting
    
    /// The attribute with the specified handle.
    public private(set) subscript(handle: UInt16) -> Attribute {
        
        get {
            
            for group in attributeGroups {
                
                for attribute in group.attributes {
                    
                    guard attribute.handle != handle
                        else { return attribute }
                }
            }
            
            fatalError("Invalid handle \(handle)")
        }
        
        mutating set {
            
            for (groupIndex, group) in attributeGroups.enumerated() {
                
                for (attributeIndex, attribute) in group.attributes.enumerated() {
                    
                    guard attribute.handle != handle else {
                        
                        attributeGroups[groupIndex].attributes[attributeIndex] = newValue
                        
                        return
                    }
                }
            }
            
            fatalError("Invalid handle \(handle)")
        }
    }
    
    // MARK: - Private Methods
    
    private mutating func newHandle() -> UInt16 {
        
        // starts at 0x0001
        lastHandle += 1
        
        return lastHandle
    }
}

// MARK: - Supporting Types

public extension GATTDatabase {
    
    /// GATT Include Declaration
    public struct Include {
        
        /// Included service handle
        public var serviceHandle: UInt16
        
        /// End group handle
        public var endGroupHandle: UInt16
        
        /// Included Service UUID
        public var serviceUUID: BluetoothUUID
        
        public init(serviceHandle: UInt16, endGroupHandle: UInt16, serviceUUID: BluetoothUUID) {
            
            self.serviceHandle = serviceHandle
            self.endGroupHandle = endGroupHandle
            self.serviceUUID = serviceUUID
        }
        
        /// ATT Attribute Value
        fileprivate var littleEndian: [UInt8] {
            
            let handleBytes = serviceHandle.littleEndian.bytes
            
            let endGroupBytes = endGroupHandle.littleEndian.bytes
            
            return [handleBytes.0, handleBytes.1, endGroupBytes.0, endGroupBytes.1] + [UInt8](serviceUUID.littleEndian.data)
        }
    }
    
    /// ATT Attribute
    public struct Attribute {
        
        public let handle: UInt16
        
        public let uuid: BluetoothUUID
        
        public let permissions: BitMaskOptionSet<Permission>
        
        public var value: Data
        
        /// Defualt initializer
        fileprivate init(handle: UInt16,
                         uuid: BluetoothUUID,
                         value: Data = Data(),
                         permissions: BitMaskOptionSet<Permission> = []) {
            
            self.handle = handle
            self.uuid = uuid
            self.value = value
            self.permissions = permissions
        }
        
        /// Initialize attribute with a `Service`.
        fileprivate init(service: GATT.Service, handle: UInt16) {
            
            self.handle = handle
            self.uuid = GATT.UUID(primaryService: service.primary).uuid
            self.value = service.uuid.littleEndian.data
            self.permissions = [.read] // Read only
        }
        
        /// Initialize attribute with an `Include Declaration`.
        fileprivate init(include: Include, handle: UInt16) {
            
            self.handle = handle
            self.uuid = GATT.UUID.include.uuid
            self.value = Data(bytes: include.littleEndian)
            self.permissions = [.read] // Read only
        }
        
        /// Initialize attributes from a `Characteristic`.
        fileprivate static func from(characteristic: Characteristic, handle: UInt16) -> [Attribute] {
            
            var currentHandle = handle
            
            let declarationAttribute: Attribute = {
                
                let propertiesMask = characteristic.properties.rawValue
                let valueHandleBytes = (handle + 1).littleEndian.bytes
                let value: Data = [propertiesMask, valueHandleBytes.0, valueHandleBytes.1] + characteristic.uuid.littleEndian.data
                
                return Attribute(handle: currentHandle,
                                 uuid: GATT.UUID.characteristic.uuid,
                                 value: value,
                                 permissions: [.read])
            }()
            
            currentHandle += 1
            
            let valueAttribute = Attribute(handle: currentHandle, uuid: characteristic.uuid, value: characteristic.value, permissions: characteristic.permissions)
            
            var attributes = [declarationAttribute, valueAttribute]
            
            // add descriptors
            if characteristic.descriptors.isEmpty == false {
                
                var descriptorAttributes = [Attribute]()
                
                for descriptor in characteristic.descriptors {
                    
                    currentHandle += 1
                    
                    let attribute = Attribute(descriptor: descriptor, handle: currentHandle)
                    
                    descriptorAttributes.append(attribute)
                }
                
                attributes += descriptorAttributes
            }
            
            return attributes
        }
        
        /// Initialize attribute with a `Characteristic Descriptor`.
        private init(descriptor: Descriptor, handle: UInt16) {
            
            self.handle = handle
            self.uuid = descriptor.uuid
            self.value = descriptor.value
            self.permissions = descriptor.permissions
        }
    }
}

// MARK: - Private Supporting Types

internal extension GATTDatabase {
    
    /// Internal Representation of a GATT Service. 
    ///
    ///- Note: For use with `GATTDatabase` only.
    internal struct AttributeGroup {
        
        var attributes: [Attribute] {
            
            willSet {
                
                assert(attributes.count == newValue.count, "Cannot modify Service structure")
            }
        }
        
        var startHandle: UInt16 {
            
            return attributes[0].handle
        }
        
        var endHandle: UInt16 {
            
            return attributes.last!.handle
        }
        
        var service: Attribute {
            
            return attributes[0]
        }
    }
}

// MARK: - Typealiases

public extension GATT {
    
    public typealias Database = GATTDatabase
}

public extension GATTDatabase {
    
    public typealias Service = GATT.Service
    public typealias Characteristic = GATT.Characteristic
    public typealias Descriptor = GATT.Descriptor
    public typealias Permission = GATT.Permission
}
