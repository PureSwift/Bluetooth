//
//  GAPCompleteListOf32BitServiceClassUUIDs.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// GAP Complete List of 32-bit Service Class UUIDs
@frozen
public struct GAPCompleteListOf32BitServiceClassUUIDs: GAPData, Equatable {
    
    public static let dataType: GAPDataType = .completeListOf32BitServiceClassUUIDs
    
    public var uuids: [UInt32]
    
    public init(uuids: [UInt32] = []) {
        
        self.uuids = uuids
    }
}

public extension GAPCompleteListOf32BitServiceClassUUIDs {
    
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

extension GAPCompleteListOf32BitServiceClassUUIDs: ExpressibleByArrayLiteral {
    
    public init(arrayLiteral elements: UInt32...) {
        
        self.init(uuids: elements)
    }
}

// MARK: - CustomStringConvertible

extension GAPCompleteListOf32BitServiceClassUUIDs: CustomStringConvertible {
    
    public var description: String {
        
        return uuids.map { BluetoothUUID.bit32($0) }.description
    }
}
