//
//  GAPUUIDList.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 8/25/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

#if canImport(Foundation)
import Foundation
#endif
import Bluetooth

/// GAP UUID List
internal struct GAPUUIDList <Element: GAPUUIDElement> {
    
    internal var uuids: [Element]
    
    internal init(uuids: [Element]) {
        
        self.uuids = uuids
    }
}

extension GAPUUIDList: DataConvertible {
    
    init?<Data: DataContainer>(data: Data) {
        
        let elementSize = MemoryLayout<Element>.size
        
        var uuids = [Element]()
        uuids.reserveCapacity(data.count / elementSize)
        
        var index = 0
        while index < data.count {
            
            guard index + elementSize <= data.count
                else { return nil }
            
            let valueData = data.subdata(in: data.startIndex + index ..< data.startIndex + index + elementSize)
            
            let value = Element(littleEndian: Element(data: valueData)!)
            
            index += elementSize
            
            uuids.append(value)
        }
        
        self.uuids = uuids
    }
    
    func append<Data: DataContainer>(to data: inout Data) {
        forEach { data += $0.littleEndian }
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

internal protocol GAPUUIDElement: DataConvertible {
        
    init(littleEndian: Self)
    
    var littleEndian: Self { get }
}

extension UInt16: GAPUUIDElement { }
extension UInt32: GAPUUIDElement { }
extension UInt128: GAPUUIDElement { }
