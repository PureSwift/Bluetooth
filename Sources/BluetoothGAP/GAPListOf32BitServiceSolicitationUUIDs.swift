//
//  GAPListOf32BitServiceSolicitationUUIDs.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// GAP List of 32 bit Service Solicitation UUIDs
@frozen
public struct GAPListOf32BitServiceSolicitationUUIDs: GAPData, Equatable {
    
    public static let dataType: GAPDataType = .listOf32BitServiceSolicitationUUIDs
    
    public let uuids: [UInt32]
    
    public init(uuids: [UInt32] = []) {
        
        self.uuids = uuids
    }
}

public extension GAPListOf32BitServiceSolicitationUUIDs {
    
    init?(data: Data) {
        
        guard let list = GAPUUIDList<ArrayLiteralElement>(data: data)
            else { return nil }
        
        self.uuids = list.uuids
    }
    
    func append(to data: inout Data) {
        
        data += GAPUUIDList(uuids: uuids)
    }
    
    var dataLength: Int {
        
        return MemoryLayout<UInt32>.size * uuids.count
    }
}

// MARK: - ExpressibleByArrayLiteral

extension GAPListOf32BitServiceSolicitationUUIDs: ExpressibleByArrayLiteral {
    
    public init(arrayLiteral elements: UInt32...) {
        
        self.init(uuids: elements)
    }
}

// MARK: - CustomStringConvertible

extension GAPListOf32BitServiceSolicitationUUIDs: CustomStringConvertible {
    
    public var description: String {
        
        return uuids.map { BluetoothUUID.bit32($0) }.description
    }
}
