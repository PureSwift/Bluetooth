//
//  GAPListOf128BitServiceSolicitationUUIDs.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// GAP List of 128 bit Service Solicitation UUIDs
@frozen
public struct GAPListOf128BitServiceSolicitationUUIDs: GAPData, Equatable {
    
    public static let dataType: GAPDataType = .listOf128BitServiceSolicitationUUIDs
    
    public let uuids: [UUID]
    
    public init(uuids: [UUID] = []) {
        
        self.uuids = uuids
    }
}

public extension GAPListOf128BitServiceSolicitationUUIDs {
    
    init?(data: Data) {
        
        guard let list = GAPUUIDList<UInt128>(data: data)
            else { return nil }
        
        self.uuids = list.uuids.map(UUID.init)
    }
    
    func append(to data: inout Data) {
        
        data += GAPUUIDList(uuids: uuids.map(UInt128.init))
    }
    
    var dataLength: Int {
        
        return UInt128.length * uuids.count
    }
}

// MARK: - ExpressibleByArrayLiteral

extension GAPListOf128BitServiceSolicitationUUIDs: ExpressibleByArrayLiteral {
    
    public init(arrayLiteral elements: UUID...) {
        
        self.init(uuids: elements)
    }
}

// MARK: - CustomStringConvertible

extension GAPListOf128BitServiceSolicitationUUIDs: CustomStringConvertible {
    
    public var description: String {
        
        return uuids.description
    }
}
