//
//  GAPCompleteListOf16BitServiceClassUUIDs.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// GAP Complete List of 16-bit Service Class UUIDs
public struct GAPCompleteListOf16BitServiceClassUUIDs: GAPData {
    
    public static let dataType: GAPDataType = .completeListOf16CitServiceClassUUIDs
    
    public var uuids: [UInt16]
    
    public init(uuids: [UInt16] = []) {
        
        self.uuids = uuids
    }
    
    public init?(data: Data) {
        
        guard let list = Bit16UUIDList(data: data)
            else { return nil }
        
        self.uuids = list.uuids
    }
    
    public var data: Data {
        
        return Bit16UUIDList(uuids: uuids).data
    }
}

// MARK: - ExpressibleByArrayLiteral

extension GAPCompleteListOf16BitServiceClassUUIDs: ExpressibleByArrayLiteral {
    
    public init(arrayLiteral elements: UInt16...) {
        
        self.init(uuids: elements)
    }
}

// MARK: - Equatable

extension GAPCompleteListOf16BitServiceClassUUIDs: Equatable {
    
    public static func == (lhs: GAPCompleteListOf16BitServiceClassUUIDs, rhs: GAPCompleteListOf16BitServiceClassUUIDs) -> Bool {
        
        return lhs.uuids == rhs.uuids
    }
}

// MARK: - CustomStringConvertible

extension GAPCompleteListOf16BitServiceClassUUIDs: CustomStringConvertible {
    
    public var description: String {
        
        return uuids.description
    }
}
