//
//  GAPIncompleteListOf32BitServiceClassUUIDs.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// GAP Incomplete List of 32-bit Service Class UUIDs
public struct GAPIncompleteListOf32BitServiceClassUUIDs: GAPData {
    
    public static let dataType: GAPDataType = .incompleteListOf32BitServiceClassUUIDs
    
    public var uuids: [UInt32]
    
    public init(uuids: [UInt32] = []) {
        
        self.uuids = uuids
    }
    
    public init?(data: Data) {
        
        guard let list = Bit32UUIDList(data: data)
            else { return nil }
        
        self.uuids = list.uuids
    }
    
    public var data: Data {
        
        return Bit32UUIDList(uuids: uuids).data
    }
}

extension GAPIncompleteListOf32BitServiceClassUUIDs: ExpressibleByArrayLiteral {
    
    public init(arrayLiteral elements: UInt32...) {
        
        self.init(uuids: elements)
    }
}

extension GAPIncompleteListOf32BitServiceClassUUIDs: Equatable {
    
    public static func == (lhs: GAPIncompleteListOf32BitServiceClassUUIDs, rhs: GAPIncompleteListOf32BitServiceClassUUIDs) -> Bool {
        
        return lhs.uuids == rhs.uuids
    }
}

extension GAPIncompleteListOf32BitServiceClassUUIDs: CustomStringConvertible {
    
    public var description: String {
        
        return uuids.description
    }
}
