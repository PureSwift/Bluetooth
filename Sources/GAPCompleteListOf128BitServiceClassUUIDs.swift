//
//  GAPCompleteListOf128BitServiceClassUUIDs.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// GAP Complete List of 128-bit Service Class UUIDs
public struct GAPCompleteListOf128BitServiceClassUUIDs: GAPData, Equatable {
    
    public static let dataType: GAPDataType = .completeListOf128BitServiceClassUUIDs
    
    public var uuids: [UUID]
    
    public init(uuids: [UUID] = []) {
        
        self.uuids = uuids
    }
}

public extension GAPCompleteListOf128BitServiceClassUUIDs {
    
    public init? <T: DataContainer> (data: T) {
        
        guard let list = GAPUUIDList<UInt128>(data: data)
            else { return nil }
        
        self.uuids = list.uuids.map(UUID.init)
    }
    
    static func += <T: DataContainer> (data: inout T, value: Self) {
        
        GAPUUIDList(uuids: uuids.map(UInt128.init)).append(to: &data)
    }
}

// MARK: - ExpressibleByArrayLiteral

extension GAPCompleteListOf128BitServiceClassUUIDs: ExpressibleByArrayLiteral {
    
    public init(arrayLiteral elements: UUID...) {
        
        self.init(uuids: elements)
    }
}

// MARK: - CustomStringConvertible

extension GAPCompleteListOf128BitServiceClassUUIDs: CustomStringConvertible {
    
    public var description: String {
        
        return uuids.description
    }
}
