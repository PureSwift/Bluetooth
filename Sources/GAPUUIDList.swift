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
        
        self.init(data: DataReference(data))
    }
    
    internal init?(data: DataReference) {
        
        var uuids = [Element]()
        uuids.reserveCapacity(data.count / MemoryLayout<Element>.size)
        
        var index = 0
        while index < data.count {
            
            guard index + MemoryLayout<Element>.size <= data.count
                else { return nil }
            
            let value = data.withUnsafeBytes { Element(littleEndian: $0.pointee) }
            
            index += MemoryLayout<Element>.size
            
            uuids.append(value)
        }
        
        self.uuids = uuids
    }
    
    internal var data: Data {
        
        var data = Data(capacity: MemoryLayout<UInt16>.size * uuids.count)
        uuids.forEach { data += $0 }
        return data
    }
}

internal protocol GAPUUIDElement: UnsafeDataConvertible {
    
    init(littleEndian: Self)
}

extension UInt16: GAPUUIDElement { }
extension UInt32: GAPUUIDElement { }
extension UInt128: GAPUUIDElement { }
