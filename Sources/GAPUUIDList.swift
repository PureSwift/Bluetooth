//
//  GAPUUIDList.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 8/25/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

public protocol GAPUUIDList: GAPData, RandomAccessCollection, ExpressibleByArrayLiteral, CustomStringConvertible where Element: GAPUUIDElement {
    
    var uuids: [Element] { get set }
    
    init(uuids: [Element])
}

public extension GAPUUIDList {
    
    init? <T: DataContainer> (data: T) {
        
        var uuids = [Element]()
        uuids.reserveCapacity(data.count / Element.length)
        
        var index = 0
        while index < data.count {
            
            guard index + Element.length <= data.count
                else { return nil }
            
            let value = Element(littleEndian: Element(gapData: data[data.startIndex + index ..< data.startIndex + index + Element.length])!)
            
            index += Element.length
            
            uuids.append(value)
        }
        
        self.uuids = uuids
    }
    
    func append <T: DataContainer > (to data: inout T) {
        
        uuids.forEach { data += $0.littleEndian }
    }
    
    var dataLength: Int {
        
        return MemoryLayout<ArrayLiteralElement>.size * uuids.count
    }
}

// MARK: - ExpressibleByArrayLiteral

extension GAPUUIDList: ExpressibleByArrayLiteral {
    
    public init(arrayLiteral elements: UInt16...) {
        
        self.init(uuids: elements)
    }
}

// MARK: - CustomStringConvertible

extension GAPUUIDList: CustomStringConvertible {
    
    public var description: String {
        
        return uuids.map { BluetoothUUID.bit16($0) }.description
    }
}

/// GAP UUID List
internal struct _GAPUUIDList <Element: GAPUUIDElement> {
    
    internal var uuids: [Element]
    
    internal init(uuids: [Element]) {
        
        self.uuids = uuids
    }
    
    internal init? <T: DataContainer> (data: T) {
        
        let elementSize = MemoryLayout<Element>.size
        
        var uuids = [Element]()
        uuids.reserveCapacity(data.count / elementSize)
        
        var index = 0
        while index < data.count {
            
            guard index + elementSize <= data.count
                else { return nil }
            
            let value = Element(littleEndian: Element(gapData: data[data.startIndex + index ..< data.startIndex + index + elementSize])!)
            
            index += elementSize
            
            uuids.append(value)
        }
        
        self.uuids = uuids
    }
    
    static func += <T: DataContainer> (data: inout T, value: GAPUUIDList) {
        
        value.forEach { data += $0.littleEndian }
    }
}

// MARK: - Sequence

extension GAPUUIDList {
    
    public func makeIterator() -> IndexingIterator<GAPUUIDList<Element>> {
        
        return IndexingIterator(_elements: self)
    }
}

// MARK: - Collection

extension GAPUUIDList {
    
    subscript(index: Int) -> Element {
        
        return uuids[index]
    }
    
    func index(after index: Int) -> Int {
        
        return index + 1
    }
    
    var startIndex: Int {
        
        return 0
    }
    
    var endIndex: Int {
        
        return uuids.count
    }
}

// MARK: - Supporting Types

public protocol GAPUUIDElement {
    
    static var length: Int { get }
    
    init(littleEndian: Self)
    
    var littleEndian: Self { get }
    
    init? <T: DataContainer> (data: T)
    
    static func += <T: DataContainer> (data: inout T, value: Self)
}

public extension GAPUUIDElement {
    
    static var length: Int {
        return MemoryLayout<Self>.size
    }
}

extension UInt16: GAPUUIDElement {
    
    init? <T: DataContainer> (data: T) {
        
        guard gapData.count == MemoryLayout<UInt16>.size
            else { return nil }
        
        self.init(bytes: (gapData[gapData.startIndex + 0],
                          gapData[gapData.startIndex + 1]))
    }
    
    init?(gapData: Slice<LowEnergyAdvertisingData>) {
        
        
    }
}

extension UInt32: GAPUUIDElement {
    
    init?(gapData: Slice<LowEnergyAdvertisingData>) {
        
        guard gapData.count == MemoryLayout<UInt32>.size
            else { return nil }
        
        self.init(bytes: (gapData[gapData.startIndex + 0],
                          gapData[gapData.startIndex + 1],
                          gapData[gapData.startIndex + 2],
                          gapData[gapData.startIndex + 3]))
    }
}

extension UUID: GAPUUIDElement {
    
    public init?<T>(gapData: T) where T : DataContainer {
        <#code#>
    }
    
    
    init?(gapData: Slice<LowEnergyAdvertisingData>) {
        
        guard gapData.count == MemoryLayout<UInt128>.size
            else { return nil }
        
        self.init(bytes: (gapData[gapData.startIndex + 0],
                          gapData[gapData.startIndex + 1],
                          gapData[gapData.startIndex + 2],
                          gapData[gapData.startIndex + 3],
                          gapData[gapData.startIndex + 4],
                          gapData[gapData.startIndex + 5],
                          gapData[gapData.startIndex + 6],
                          gapData[gapData.startIndex + 7],
                          gapData[gapData.startIndex + 8],
                          gapData[gapData.startIndex + 9],
                          gapData[gapData.startIndex + 10],
                          gapData[gapData.startIndex + 11],
                          gapData[gapData.startIndex + 12],
                          gapData[gapData.startIndex + 13],
                          gapData[gapData.startIndex + 14],
                          gapData[gapData.startIndex + 15]))
    }
}
