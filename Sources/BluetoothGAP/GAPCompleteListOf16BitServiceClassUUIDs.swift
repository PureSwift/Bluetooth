//
//  GAPCompleteListOf16BitServiceClassUUIDs.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// GAP Complete List of 16-bit Service Class UUIDs
@frozen
public struct GAPCompleteListOf16BitServiceClassUUIDs: GAPData, Equatable {
    
    public static let dataType: GAPDataType = .completeListOf16CitServiceClassUUIDs
    
    public var uuids: [UInt16]
    
    public init(uuids: [UInt16] = []) {
        
        self.uuids = uuids
    }
}

public extension GAPCompleteListOf16BitServiceClassUUIDs {
    
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

extension GAPCompleteListOf16BitServiceClassUUIDs: ExpressibleByArrayLiteral {
    
    public init(arrayLiteral elements: UInt16...) {
        
        self.init(uuids: elements)
    }
}

// MARK: - CustomStringConvertible

extension GAPCompleteListOf16BitServiceClassUUIDs: CustomStringConvertible {
    
    public var description: String {
        
        return uuids.map { BluetoothUUID.bit16($0) }.description
    }
}
