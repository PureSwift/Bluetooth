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
    
    internal init?(data: Slice<LowEnergyAdvertisingData>) {
        
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
    
    func append(to data: inout LowEnergyAdvertisingData) {
        
        self.forEach { data += $0 }
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
    
    init?(gapData: Slice<LowEnergyAdvertisingData>)
    
    init(littleEndian: Self)
    
    var littleEndian: Self { get }
    
    static func += (data: inout LowEnergyAdvertisingData, value: Self)
}

extension UInt16: GAPUUIDElement {
    
    init?(gapData: Slice<LowEnergyAdvertisingData>) {
        
        guard gapData.count == MemoryLayout<UInt16>.size
            else { return nil }
        
        self.init(bytes: (gapData[gapData.startIndex + 0],
                          gapData[gapData.startIndex + 1]))
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

extension UInt128: GAPUUIDElement {
    
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
