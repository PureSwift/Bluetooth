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
    internal let data: Data?
    
    @_versioned
    internal let offset: Int
    
    public let count: Int
    
    // MARK: - Initialization
    
    public init(_ data: Data) {
        
        self.data = data
        self.offset = 0
        self.count = data.count
    }
    
    public init() {
        
        self.data = nil
        self.offset = 0
        self.count = 0
    }
    
    fileprivate init(data: Data, offset: Int, count: Int) {
        
        self.data = data
        self.offset = offset
        self.count = count
    }
}

internal extension DataReference {
    
    subscript (range: CountableRange<Int>) -> DataReference {
        
        guard let data = self.data
            else { fatalError("Empty data") }
        
        let offset = self.offset + range.lowerBound
        
        return DataReference(data: data, offset: offset, count: range.count)
    }
    
    func suffix(from index: Int) -> DataReference {
        
        return self[index ..< count]
    }
    
    subscript (index: Int) -> UInt8 {
        
        @inline(__always)
        get { return data![offset + index] }
    }
}

internal extension Data {
    
    init(_ reference: DataReference) {
        
        if let data = reference.data {
            
            // reference is the same as the original data
            if reference.offset == 0, reference.count == data.count {
                
                self = data // no need for copy
                
            } else {
                
                // return copy of slice
                self = data.subdata(in: reference.offset ..< reference.offset + reference.count)
            }
            
        } else {
            
            self = Data()
        }
    }
}
