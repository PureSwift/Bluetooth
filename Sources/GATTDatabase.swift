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
    @_versioned
    internal private(set) var lastHandle: UInt16 = 0x0000
    
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
    
    /// Returns the last attribute in the database.
    public var first: Attribute? {
        
        return attributeGroups.first?.attributes.first
    }
    
    /// Returns the last attribute in the database.
    public var last: Attribute? {
        
        return attributeGroups.last?.attributes.last
    }
    
    /// Whether the database contains an attribute with the specified handle.
    public func contains(handle: UInt16) -> Bool {
        
        for group in attributeGroups {
            
            for attribute in group.attributes {
                
                guard attribute.handle == handle
                    else { continue }
                
                return true
            }
        }
        
        return false
    }
    
    // MARK: - Methods
    
    @discardableResult
    public mutating func add(service: GATT.Service) -> UInt16 {
        
        let serviceAttribute = ServiceAttribute(handle: self.newHandle(),
                                                uuid: service.uuid,
                                                isPrimary: service.primary)
        
        var attributes = [serviceAttribute.attribute]
        
        attributes += service.includedServices.map {
            IncludedServiceAttribute(include: $0, handle: self.newHandle()).attribute
        }
        
        for characteristic in service.characteristics {
            
            let declarationHandle = self.newHandle()
            
            let valueHandle = self.newHandle()

            let declarationAttribute = CharacteristicDeclarationAttribute(handle: declarationHandle,
                                                                          valueHandle: valueHandle,
                                                                          uuid: characteristic.uuid,
                                                                          properties: characteristic.properties)
            
            let valueAttribute = CharacteristicValueAttribute(handle: valueHandle,
                                                              value: characteristic.value,
                                                              uuid: characteristic.uuid,
                                                              permissions: characteristic.permissions)
            
            attributes += [declarationAttribute.attribute, valueAttribute.attribute]
            
            attributes += characteristic.descriptors.map {
                CharacteristicDescriptorAttribute(descriptor: $0, handle: self.newHandle()).attribute
            }
        }
        
        attributeGroups.append(AttributeGroup(attributes: attributes))
        
        return serviceAttribute.handle
    }
    
    /// Clear the database.
    public mutating func removeAll() {
        
        self.attributeGroups = []
    }
    
    /// Remove the Service at the specified index.
    public mutating func remove(service handle: UInt16) {
        
        guard let serviceIndex = attributeGroups.index(where: { $0.serviceAttribute.handle == handle })
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

// MARK: - Collection

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

// MARK: - RandomAccessCollection

#if swift(>=3.3)
#elseif swift(>=3.0)
public extension GATTDatabase {

    public typealias Slice = Swift.RandomAccessSlice
}
#endif

#if swift(>=3.1)
extension GATTDatabase: RandomAccessCollection {
    
    public subscript(bounds: Range<Int>) -> Slice<GATTDatabase> {
        
        return Slice<GATTDatabase>(base: self, bounds: bounds)
    }
    
    public func makeIterator() -> IndexingIterator<GATTDatabase> {
        return IndexingIterator(_elements: self)
    }
}
#endif

// MARK: - Supporting Types

public extension GATTDatabase {
    
    /// ATT Attribute
    public struct Attribute {
        
        public let handle: UInt16
        
        public let uuid: BluetoothUUID
        
        public let permissions: BitMaskOptionSet<GATT.Permission>
        
        public var value: Data
        
        /// Defualt initializer
        public init(handle: UInt16,
                    uuid: BluetoothUUID,
                    value: Data = Data(),
                    permissions: BitMaskOptionSet<GATT.Permission> = []) {
            
            self.handle = handle
            self.uuid = uuid
            self.value = value
            self.permissions = permissions
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
        
        var serviceAttribute: Attribute {
            
            return attributes[0]
        }
        
        var service: GATT.Service? {
            
            guard let serviceAttribute = ServiceAttribute(attribute: self.serviceAttribute)
                else { return nil }
            
            var service = GATT.Service(uuid: serviceAttribute.uuid,
                                       primary: serviceAttribute.isPrimary)
            
            guard attributes.count > 1
                else { return service }
            
            var characteristicValueHandles = Set<UInt16>()
            
            for attribute in attributes.suffix(from: 1) {
                
                if attribute.uuid == .include {
                    
                    guard let includeAttribute = IncludedServiceAttribute(attribute: attribute)
                        else { return nil }
                    
                    let include = GATT.Include(serviceHandle: includeAttribute.serviceHandle,
                                               endGroupHandle: includeAttribute.endGroupHandle,
                                               serviceUUID: includeAttribute.uuid)
                    
                    service.includedServices.append(include)
                    
                } else if attribute.uuid == .characteristic {
                    
                    guard let characteristicAttribute = CharacteristicDeclarationAttribute(attribute: attribute)
                        else { return nil }
                    
                    let valueHandle = characteristicAttribute.valueHandle
                    
                    characteristicValueHandles.insert(valueHandle)
                    
                    guard let valueAttribute = attributes.first(where: { $0.handle == valueHandle })
                        else { return nil }
                    
                    let characteristicValueAttribute = CharacteristicValueAttribute(attribute: valueAttribute)
                    
                    let characteristic = GATT.Characteristic(uuid: characteristicAttribute.uuid,
                                                             value: characteristicValueAttribute.value,
                                                             permissions: characteristicValueAttribute.permissions, properties: characteristicAttribute.properties, descriptors: [])
                    
                    service.characteristics.append(characteristic)
                    
                } else if characteristicValueHandles.contains(attribute.handle) {
                    
                    continue
                    
                } else {
                    
                    guard let descriptorAttribute = CharacteristicDescriptorAttribute(attribute: attribute)
                        else { return nil }
                    
                    let descriptor = GATT.Descriptor(uuid: descriptorAttribute.uuid,
                                                     value: descriptorAttribute.value,
                                                     permissions: descriptorAttribute.permissions)
                    
                    guard service.characteristics.isEmpty == false
                        else { return nil }
                    
                    let lastIndex = service.characteristics.count - 1
                    service.characteristics[lastIndex].descriptors.append(descriptor)
                }
            }
            
            return service
        }
    }
    
    internal struct ServiceAttribute {
        
        static let uuids: [BluetoothUUID] = [.primaryService, .secondaryService]
        
        /// Attribute Handle
        var handle: UInt16
        
        /// Service UUID
        var uuid: BluetoothUUID
        
        /// Primary or Secondary Service
        var isPrimary: Bool
        
        init(handle: UInt16, uuid: BluetoothUUID, isPrimary: Bool) {
            
            self.handle = handle
            self.uuid = uuid
            self.isPrimary = isPrimary
        }
        
        init?(attribute: Attribute) {
            
            assert(attribute.permissions == [.read], "Invalid attribute permissions")
            
            guard let serviceUUIDLittleEndian = BluetoothUUID(data: attribute.value)
                else { return nil }
            
            let serviceUUID = BluetoothUUID(littleEndian: serviceUUIDLittleEndian)
            
            let isPrimary: Bool
            
            switch attribute.uuid {
            case BluetoothUUID.primaryService:
                isPrimary = true
            case BluetoothUUID.secondaryService:
                isPrimary = false
            default:
                return nil // invalid uuid
            }
            
            self.handle = attribute.handle
            self.uuid = serviceUUID
            self.isPrimary = isPrimary
        }
        
        var attribute: Attribute {
            
            let serviceUUID: BluetoothUUID = isPrimary ? .primaryService : .secondaryService
            
            return Attribute(handle: handle,
                             uuid: serviceUUID,
                             value: self.uuid.littleEndian.data,
                             permissions: [.read])
        }
    }
    
    internal struct IncludedServiceAttribute {
        
        static let uuid: BluetoothUUID = .include
        
        /// Attribute Handle
        var handle: UInt16
        
        /// Included Service UUID
        var uuid: BluetoothUUID
        
        /// Included service handle
        var serviceHandle: UInt16
        
        /// End group handle
        var endGroupHandle: UInt16
        
        init(handle: UInt16, uuid: BluetoothUUID, serviceHandle: UInt16, endGroupHandle: UInt16) {
            
            self.handle = handle
            self.uuid = uuid
            self.serviceHandle = serviceHandle
            self.endGroupHandle = endGroupHandle
        }
        
        init(include: GATT.Include, handle: UInt16) {
            
            self.handle = handle
            self.serviceHandle = include.serviceHandle
            self.endGroupHandle = include.endGroupHandle
            self.uuid = include.serviceUUID
        }
        
        init?(attribute: Attribute) {
            
            guard attribute.uuid == type(of: self).uuid,
                let length = Length(rawValue: attribute.value.count)
                else { return nil }
            
            assert(attribute.permissions == [.read], "Invalid attribute permissions")
            
            let serviceHandle = UInt16(littleEndian: UInt16(bytes: (attribute.value[0], attribute.value[1])))
            let endGroupHandle = UInt16(littleEndian: UInt16(bytes: (attribute.value[2], attribute.value[3])))
            let uuid = BluetoothUUID(littleEndian: BluetoothUUID(data: Data(attribute.value[4 ..< length.rawValue]))!)
            
            self.serviceHandle = serviceHandle
            self.endGroupHandle = endGroupHandle
            self.uuid = uuid
            self.handle = attribute.handle
        }
        
        var attribute: Attribute {
            
            let handleBytes = serviceHandle.littleEndian.bytes
            
            let endGroupBytes = endGroupHandle.littleEndian.bytes
            
            let value: Data = [handleBytes.0,
                               handleBytes.1,
                               endGroupBytes.0,
                               endGroupBytes.1] + uuid.littleEndian.data
            
            return Attribute(handle: handle,
                             uuid: type(of: self).uuid,
                             value: value,
                             permissions: [.read])
        }
        
        enum Length: Int {
            
            case bit16 = 6
            case bit128 = 20
        }
    }
    
    internal struct CharacteristicDeclarationAttribute {
        
        static let uuid: BluetoothUUID = .characteristic
        
        /// Characteristic UUID
        var uuid: BluetoothUUID
        
        /// Characteristic Properties
        var properties: BitMaskOptionSet<GATT.Characteristic.Property>
        
        /// Attribute Handle
        var handle: UInt16
        
        /// Characteristic Value Handle
        var valueHandle: UInt16
        
        init(handle: UInt16,
             valueHandle: UInt16,
             uuid: BluetoothUUID,
             properties: BitMaskOptionSet<GATT.Characteristic.Property>) {
            
            self.handle = handle
            self.valueHandle = valueHandle
            self.uuid = uuid
            self.properties = properties
        }
        
        init?(attribute: Attribute) {
            
            guard attribute.uuid == type(of: self).uuid,
                let length = Length(rawValue: attribute.value.count)
                else { return nil }
            
            assert(attribute.permissions == [.read], "Invalid attribute permissions")
            
            let properties = BitMaskOptionSet<GATT.Characteristic.Property>(rawValue: attribute.value[0])
            let valueHandle = UInt16(littleEndian: UInt16(bytes: (attribute.value[1], attribute.value[2])))
            let uuid = BluetoothUUID(littleEndian: BluetoothUUID(data: Data(attribute.value[3 ..< length.rawValue]))!)
            
            self.uuid = uuid
            self.properties = properties
            self.valueHandle = valueHandle
            self.handle = attribute.handle
        }
        
        var attribute: Attribute {
            
            let propertiesMask = properties.rawValue
            let valueHandleBytes = valueHandle.littleEndian.bytes
            let value: Data = [propertiesMask, valueHandleBytes.0, valueHandleBytes.1] + uuid.littleEndian.data
            
            return Attribute(handle: handle,
                             uuid: type(of: self).uuid,
                             value: value,
                             permissions: [.read])
        }
        
        private enum Length: Int {
            
            case bit16 = 5
            case bit128 = 19
        }
    }
    
    internal struct CharacteristicValueAttribute {
        
        /// Characteristic UUID
        var uuid: BluetoothUUID
        
        /// Characteristic Value Data
        var value: Data
        
        /// Characteristic Value Permissions
        var permissions: BitMaskOptionSet<GATT.Permission>
        
        /// Attribute Handle
        var handle: UInt16
        
        init(handle: UInt16,
             value: Data,
             uuid: BluetoothUUID,
             permissions: BitMaskOptionSet<GATT.Permission>) {
            
            self.handle = handle
            self.value = value
            self.uuid = uuid
            self.permissions = permissions
        }
        
        init(attribute: Attribute) {
            
            self.uuid = attribute.uuid
            self.value = attribute.value
            self.permissions = attribute.permissions
            self.handle = attribute.handle
        }
        
        var attribute: Attribute {
            
            return Attribute(handle: handle,
                             uuid: uuid,
                             value: value,
                             permissions: permissions)
        }
    }
    
    internal struct CharacteristicDescriptorAttribute {
        
        /// Attribute Handle
        var handle: UInt16
        
        /// Descriptor UUID
        var uuid: BluetoothUUID
        
        /// Descriptor Value
        var value: Data
        
        /// Descriptor Permissions
        var permissions: BitMaskOptionSet<GATT.Permission>
        
        init(descriptor: GATT.Descriptor, handle: UInt16) {
            
            self.handle = handle
            self.uuid = descriptor.uuid
            self.value = descriptor.value
            self.permissions = descriptor.permissions
        }
        
        init?(attribute: Attribute) {
            
            self.uuid = attribute.uuid
            self.value = attribute.value
            self.permissions = attribute.permissions
            self.handle = attribute.handle
        }
        
        var attribute: Attribute {
            
            return Attribute(handle: handle,
                             uuid: uuid,
                             value: value,
                             permissions: permissions)
        }
    }
}

// MARK: - Typealiases

public extension GATT {
    
    public typealias Database = GATTDatabase
}
