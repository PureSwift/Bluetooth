//
//  GAPIncompleteListOf32BitServiceClassUUIDs.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// GAP Incomplete List of 32-bit Service Class UUIDs
public struct GAPIncompleteListOf32BitServiceClassUUIDs: GAPData, Equatable {
    
    public static let dataType: GAPDataType = .incompleteListOf32BitServiceClassUUIDs
    
    public var uuids: [UInt32]
    
    public init(uuids: [UInt32] = []) {
        
        self.uuids = uuids
    }
}

public extension GAPIncompleteListOf32BitServiceClassUUIDs {
    
    public init?(data: Data) {
        
        guard let list = GAPUUIDList<UInt32>(data: data)
            else { return nil }
        
        self.uuids = list.uuids
    }
    
    public var dataLength: Int {
        
        return uuids.count * 4
    }
    
    public func append(to data: inout Data) {
        
        data += GAPUUIDList<UInt32>(uuids: uuids)
    }
}

// MARK: - ExpressibleByArrayLiteral

extension GAPIncompleteListOf32BitServiceClassUUIDs: ExpressibleByArrayLiteral {
    
    public init(arrayLiteral elements: UInt32...) {
        
        self.init(uuids: elements)
    }
}

extension GAPIncompleteListOf32BitServiceClassUUIDs: CustomStringConvertible {
    
    public var description: String {
        
        return uuids.description
    }
}
