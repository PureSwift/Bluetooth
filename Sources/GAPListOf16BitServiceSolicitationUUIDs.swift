//
//  GAPListOf16BitServiceSolicitationUUIDs.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// A Peripheral device may send the Service Solicitation data type to invite Central devices that expose one or more of the services specified in the Service Solicitation data to connect. The Peripheral device should be in the undirected connectable mode and in one of the discoverable modes. This enables a Central device providing one or more of these services to connect to the Peripheral device, so that the Peripheral device can use the services on the Central device.

/// Note: Central and Peripheral are GAP roles as defined in Vol.3, Part C, Section 2.2.2.

/// GAP List of 16 bit Service Solicitation UUIDs
public struct GAPListOf16BitServiceSolicitationUUIDs: GAPData {
    
    public static let dataType: GAPDataType = .listOf16BitServiceSolicitationUUIDs
    
    public let uuids: [UInt16]
    
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

extension GAPListOf16BitServiceSolicitationUUIDs: ExpressibleByArrayLiteral {
    
    public init(arrayLiteral elements: UInt16...) {
        
        self.init(uuids: elements)
    }
}

extension GAPListOf16BitServiceSolicitationUUIDs: Equatable {
    
    public static func == (lhs: GAPListOf16BitServiceSolicitationUUIDs, rhs: GAPListOf16BitServiceSolicitationUUIDs) -> Bool {
        
        return lhs.uuids == rhs.uuids
    }
}

extension GAPListOf16BitServiceSolicitationUUIDs: CustomStringConvertible {
    
    public var description: String {
        
        return uuids.description
    }
}
