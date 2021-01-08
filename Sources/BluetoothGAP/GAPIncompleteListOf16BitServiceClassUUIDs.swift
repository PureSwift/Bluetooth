//
//  GAPIncompleteListOf16BitServiceClassUUIDs.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// GAP Incomplete List of 16-bit Service Class UUIDs
@frozen
public struct GAPIncompleteListOf16BitServiceClassUUIDs: GAPData, Equatable {
    
    public static var dataType: GAPDataType { return .incompleteListOf16BitServiceClassUUIDs }
    
    public var uuids: [UInt16]
    
    public init(uuids: [UInt16] = []) {
        
        self.uuids = uuids
    }
}

public extension GAPIncompleteListOf16BitServiceClassUUIDs {
    
    init?(data: Data) {
        
        guard let list = GAPUUIDList<ArrayLiteralElement>(data: data)
            else { return nil }
        
        self.uuids = list.uuids
    }
    
    func append(to data: inout Data) {
        
        data += GAPUUIDList(uuids: uuids)
    }
    
    var dataLength: Int {
        
        return MemoryLayout<ArrayLiteralElement>.size * uuids.count
    }
}

// MARK: - ExpressibleByArrayLiteral

extension GAPIncompleteListOf16BitServiceClassUUIDs: ExpressibleByArrayLiteral {
    
    public init(arrayLiteral elements: UInt16...) {
        
        self.init(uuids: elements)
    }
}

// MARK: - CustomStringConvertible

extension GAPIncompleteListOf16BitServiceClassUUIDs: CustomStringConvertible {
    
    public var description: String {
        
        return uuids.map { BluetoothUUID.bit16($0) }.description
    }
}
