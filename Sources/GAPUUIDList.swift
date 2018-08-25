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
        
        var uuids = [Element]()
        uuids.reserveCapacity(data.count / MemoryLayout<Element>.size)
        
        var index = 0
        while index < data.count {
            
            guard index + MemoryLayout<Element>.size <= data.count
                else { return nil }
            
            let value = Element(littleEndian: Element(gapData: data.subdataNoCopy(in: index ..< index + MemoryLayout<Element>.size))!)
            
            index += MemoryLayout<Element>.size
            
            uuids.append(value)
        }
        
        self.uuids = uuids
    }
    
    internal var data: Data {
        
        var data = Data(capacity: MemoryLayout<Element>.size * uuids.count)
        uuids.forEach { data += $0.littleEndian }
        return data
    }
}

internal protocol GAPUUIDElement: UnsafeDataConvertible {
    
    init?(gapData: Data)
    
    init(littleEndian: Self)
    
    var littleEndian: Self { get }
}

extension UInt16: GAPUUIDElement {
    
    init?(gapData: Data) {
        
        guard gapData.count == MemoryLayout<UInt16>.size
            else { return nil }
        
        self.init(bytes: (gapData[0], gapData[1]))
    }
}

extension UInt32: GAPUUIDElement {
    
    init?(gapData: Data) {
        
        guard gapData.count == MemoryLayout<UInt32>.size
            else { return nil }
        
        self.init(bytes: (gapData[0], gapData[1], gapData[2], gapData[3]))
    }
}

extension UInt128: GAPUUIDElement {
    
    init?(gapData: Data) {
        
        guard gapData.count == MemoryLayout<UInt128>.size
            else { return nil }
        
        self.init(bytes: (gapData[0], gapData[1], gapData[2], gapData[3], gapData[4], gapData[5], gapData[6], gapData[7], gapData[8], gapData[9], gapData[10], gapData[11], gapData[12], gapData[13], gapData[14], gapData[15]))
    }
}
