//
//  GAPCompleteListOf128BitServiceClassUUIDs.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// GAP Complete List of 128-bit Service Class UUIDs
public struct GAPCompleteListOf128BitServiceClassUUIDs: GAPData {
    
    public static let dataType: GAPDataType = .completeListOf128BitServiceClassUUIDs
    
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

extension GAPCompleteListOf128BitServiceClassUUIDs: ExpressibleByArrayLiteral {
    
    public init(arrayLiteral elements: UUID...) {
        
        self.init(uuids: elements)
    }
}

extension GAPCompleteListOf128BitServiceClassUUIDs: Equatable {
    
    public static func == (lhs: GAPCompleteListOf128BitServiceClassUUIDs, rhs: GAPCompleteListOf128BitServiceClassUUIDs) -> Bool {
        
        return lhs.uuids == rhs.uuids
    }
}

extension GAPCompleteListOf128BitServiceClassUUIDs: CustomStringConvertible {
    
    public var description: String {
        
        return uuids.description
    }
}
