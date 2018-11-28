//
//  GAPUUIDList.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 8/25/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// GAP UUID List
internal struct GAPUUIDList <Element: GAPUUIDElement> {
    
    internal var uuids: [Element]
    
    internal init(uuids: [Element]) {
        
        self.uuids = uuids
    }
    
    internal init?(data: Data) {
        
        let elementSize = MemoryLayout<Element>.size
        
        var uuids = [Element]()
        uuids.reserveCapacity(data.count / elementSize)
        
        var index = 0
        while index < data.count {
            
            guard index + elementSize <= data.count
                else { return nil }
            
            let valueData = data.subdataNoCopy(in: data.startIndex + index ..< data.startIndex + index + elementSize)
            
            let value = Element(littleEndian: Element(data: valueData)!)
            
            index += elementSize
            
            uuids.append(value)
        }
        
        self.uuids = uuids
    }
}

extension GAPUUIDList: DataConvertible {
    
    static func += <T: DataContainer> (data: inout T, value: GAPUUIDList) {
        
        value.forEach { data += $0.littleEndian }
    }
    
    var dataLength: Int {
        
        return MemoryLayout<Element>.size * uuids.count
    }
}

// MARK: - Sequence

extension GAPUUIDList: Sequence {
    
    public func makeIterator() -> IndexingIterator<GAPUUIDList<Element>> {
        
        return IndexingIterator(_elements: self)
    }
}

// MARK: - Collection

extension GAPUUIDList: Collection {
    
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

internal protocol GAPUUIDElement: UnsafeDataConvertible {
    
    init? <T: DataContainer> (data: T)
    
    init(littleEndian: Self)
    
    var littleEndian: Self { get }
    
    static func += (data: inout LowEnergyAdvertisingData, value: Self)
}

extension UInt16: GAPUUIDElement {
    
    init? <T: DataContainer> (data: T) {
        
        guard data.count == MemoryLayout<UInt16>.size
            else { return nil }
        
        self.init(bytes: (data[0],
                          data[1]))
    }
}

extension UInt32: GAPUUIDElement {
    
    init? <T: DataContainer> (data: T) {
        
        guard data.count == MemoryLayout<UInt32>.size
            else { return nil }
        
        self.init(bytes: (data[0],
                          data[1],
                          data[2],
                          data[3]))
    }
}

extension UInt128: GAPUUIDElement {
    
    init? <T: DataContainer> (data: T) {
        
        guard data.count == MemoryLayout<UInt128>.size
            else { return nil }
        
        self.init(bytes: (data[0],
                          data[1],
                          data[2],
                          data[3],
                          data[4],
                          data[5],
                          data[6],
                          data[7],
                          data[8],
                          data[9],
                          data[10],
                          data[11],
                          data[12],
                          data[13],
                          data[14],
                          data[15]))
    }
}
