//
//  DataReference.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 8/24/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// Immutable Data type, used only for data parsing.
internal struct DataReference {
    
    // MARK: - Properties
    
    fileprivate let data: Data
    
    fileprivate let offset: Int
    
    public let count: Int
    
    // MARK: - Initialization
    
    public init(data: Data) {
        
        self.init(data: data, offset: 0, count: data.count)
    }
    
    fileprivate init(data: Data, offset: Int, count: Int) {
        
        self.data = data
        self.offset = offset
        self.count = count
    }
}

internal extension DataReference {
    
    subscript (range: CountableRange<Int>) -> DataReference {
        
        let offset = self.offset + range.lowerBound
        
        return DataReference(data: data, offset: offset, count: range.count)
    }
    
    subscript (index: Int) -> UInt8 {
        
        let actualIndex = offset + index
        
        return data[actualIndex]
    }
}
