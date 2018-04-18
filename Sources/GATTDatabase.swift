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
    
    @_versioned
    internal private(set) var attributeGroups = [AttributeGroup]()
    
    /// Do not access directly, use `newHandle()`
    private var lastHandle: UInt16 = 0x0000
    
    // MARK: - Initialization
    
    public init() { }
    
    public init(services: [GATT.Service]) {
        
        services.forEach { add(service: $0) }
    }
    
    // MARK: - Computed Properties
    
    /// Whether the database contains any attributes. 
    public var isEmpty: Bool {
        
        return attributeGroups.isEmpty
    }
    
    /// Attribute representation of the database.
    internal var attributes: [Attribute] {
        
        let attributeCount = self.count
        
        var attributes = [Attribute]()
        attributes.reserveCapacity(attributeCount)
        
        attributeGroups.forEach { attributes += $0.attributes }
        
        assert(attributes.count == attributeCount)
        
        return attributes
    }
    
    /// Number of attributes in the database.
    public var count: Int {
        
        return attributeGroups.reduce(0) { $0.0 + $0.1.attributes.count }
    }
    
    // MARK: - Methods
    
    @discardableResult
    public mutating func add(service: GATT.Service) -> UInt16 {
        
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
    public mutating func removeAll() {
        
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
        
        self[handle: handle].value = value
    }
    
    /// The handle of the service at the specified index.
    public func serviceHandles(at index: Int) -> (start: UInt16, end: UInt16) {
        
        let service = attributeGroups[index]
        
        return (service.startHandle, service.endHandle)
    }
    
    // MARK: - Subscripting
    
    /// The attribute at the specified index.
    public subscript(index: Int) -> Attribute {
        
        get { return attributes[index] }
    }
    
    /// The attribute with the specified handle.
    public private(set) subscript(handle handle: UInt16) -> Attribute {
        
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

extension GATTDatabase: Collection {
    
    public func index(after index: Int) -> Int {
        
        return index + 1
    }
    
    public var startIndex: Int {
        
        return 0
    }
    
    public var endIndex: Int {
        
        return count
    }
}

#if swift(>=3.3)
#elseif swift(>=3.0)
extension GATTDatabase {

    typealias Slice = Swift.RandomAccessSlice
}
#endif

extension GATTDatabase: RandomAccessCollection {
    
    public subscript(bounds: Range<Int>) -> Slice<GATTDatabase> {
        
        return Slice<GATTDatabase>(base: self, bounds: bounds)
    }
    
    public func makeIterator() -> IndexingIterator<GATTDatabase> {
        return IndexingIterator(_elements: self)
    }
}

// MARK: - Supporting Types

public extension GATTDatabase {
    
    /// ATT Attribute
    public struct Attribute {
        
        public let handle: UInt16
        
        public let uuid: BluetoothUUID
        
        public let permissions: BitMaskOptionSet<GATT.Permission>
        
        public var value: Data
        
        /// Defualt initializer
        fileprivate init(handle: UInt16,
                         uuid: BluetoothUUID,
                         value: Data = Data(),
                         permissions: BitMaskOptionSet<GATT.Permission> = []) {
            
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
        fileprivate init(include: GATT.Include, handle: UInt16) {
            
            self.handle = handle
            self.uuid = GATT.UUID.include.uuid
            self.value = Data(bytes: include.littleEndian)
            self.permissions = [.read] // Read only
        }
        
        /// Initialize attributes from a `Characteristic`.
        fileprivate static func from(characteristic: GATT.Characteristic, handle: UInt16) -> [Attribute] {
            
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
        private init(descriptor: GATT.Descriptor, handle: UInt16) {
            
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
        
        var attributes: [Attribute]
        
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
