//
//  GAPCompleteListOf32BitServiceClassUUIDs.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// GAP Complete List of 32-bit Service Class UUIDs
public struct GAPCompleteListOf32BitServiceClassUUIDs: GAPData, Equatable {
    
    public static let dataType: GAPDataType = .completeListOf32BitServiceClassUUIDs
    
    public var uuids: [UInt32]
    
    public init(uuids: [UInt32] = []) {
        
        self.uuids = uuids
    }
}

public extension GAPCompleteListOf32BitServiceClassUUIDs {
    
    public init?(data: Slice<LowEnergyAdvertisingData>) {
        
        guard let list = GAPUUIDList<ArrayLiteralElement>(data: data)
            else { return nil }
        
        self.uuids = list.uuids
    }
    
    func append(to data: inout LowEnergyAdvertisingData) {
        
        GAPUUIDList(uuids: uuids).append(to: &data)
    }
}

// MARK: - ExpressibleByArrayLiteral

extension GAPCompleteListOf32BitServiceClassUUIDs: ExpressibleByArrayLiteral {
    
    public init(arrayLiteral elements: UInt32...) {
        
        self.init(uuids: elements)
    }
}

// MARK: - CustomStringConvertible

extension GAPCompleteListOf32BitServiceClassUUIDs: CustomStringConvertible {
    
    public var description: String {
        
        return uuids.description
    }
}
