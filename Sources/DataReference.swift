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
    
    @_versioned
    internal let data: Data
    
    @_versioned
    internal let offset: Int
    
    public let count: Int
    
    // MARK: - Initialization
    
    public init(_ data: Data = Data()) {
        
        self.data = data
        self.offset = 0
        self.count = data.count
    }
    
    fileprivate init(data: Data, offset: Int, count: Int) {
        
        self.data = data
        self.offset = offset
        self.count = count
    }
}

internal extension DataReference {
    
    subscript (index: Int) -> UInt8 {
        
        @inline(__always)
        get { return data[offset + index] }
    }
    
    subscript (range: CountableRange<Int>) -> DataReference {
        
        return DataReference(data: data, offset: offset + range.lowerBound, count: range.count)
    }
    
    func suffix(from index: Int) -> DataReference {
        
        return self[index ..< count]
    }
}

internal extension Data {
    
    init(_ reference: DataReference) {
        
        // reference is the same as the original data
        if reference.offset == 0, reference.count == reference.data.count {
            
            self = reference.data // no need for copy
            
        } else {
            
            // return copy of slice
            self = reference.data.subdata(in: reference.offset ..< reference.offset + reference.count)
        }
    }
}
