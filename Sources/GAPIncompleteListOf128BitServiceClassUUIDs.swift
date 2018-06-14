//
//  GAPIncompleteListOf128BitServiceClassUUIDs.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// GAP Incomplete List of 128-bit Service Class UUIDs
public struct GAPIncompleteListOf128BitServiceClassUUIDs: GAPData {
    
    public static let dataType: GAPDataType = .incompleteListOf128BitServiceClassUUIDs
    
    public var uuids: [UUID]
    
    public init(uuids: [UUID] = []) {
        
        self.uuids = uuids
    }
    
    public init?(data: Data) {
        
        guard let list = Bit128UUIDList(data: data)
            else { return nil }
        
        self.uuids = list.uuids.map(UUID.init)
    }
    
    public var data: Data {
        
        return Bit128UUIDList(uuids: uuids.map(UInt128.init)).data
    }
}

extension GAPIncompleteListOf128BitServiceClassUUIDs: ExpressibleByArrayLiteral {
    
    public init(arrayLiteral elements: UUID...) {
        
        self.init(uuids: elements)
    }
}

extension GAPIncompleteListOf128BitServiceClassUUIDs: Equatable {
    
    public static func == (lhs: GAPIncompleteListOf128BitServiceClassUUIDs, rhs: GAPIncompleteListOf128BitServiceClassUUIDs) -> Bool {
        
        return lhs.uuids == rhs.uuids
    }
}

extension GAPIncompleteListOf128BitServiceClassUUIDs: CustomStringConvertible {
    
    public var description: String {
        
        return uuids.description
    }
}
