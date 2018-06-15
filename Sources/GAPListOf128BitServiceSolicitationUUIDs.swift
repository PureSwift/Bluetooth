//
//  GAPListOf128BitServiceSolicitationUUIDs.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// GAP List of 128 bit Service Solicitation UUIDs
public struct GAPListOf128BitServiceSolicitationUUIDs: GAPData {
    
    public static let dataType: GAPDataType = .listOf128BitServiceSolicitationUUIDs
    
    public let uuids: [UUID]
    
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

extension GAPListOf128BitServiceSolicitationUUIDs: ExpressibleByArrayLiteral {
    
    public init(arrayLiteral elements: UUID...) {
        
        self.init(uuids: elements)
    }
}

extension GAPListOf128BitServiceSolicitationUUIDs: Equatable {
    
    public static func == (lhs: GAPListOf128BitServiceSolicitationUUIDs, rhs: GAPListOf128BitServiceSolicitationUUIDs) -> Bool {
        
        return lhs.uuids == rhs.uuids
    }
}

extension GAPListOf128BitServiceSolicitationUUIDs: CustomStringConvertible {
    
    public var description: String {
        
        return uuids.description
    }
}
