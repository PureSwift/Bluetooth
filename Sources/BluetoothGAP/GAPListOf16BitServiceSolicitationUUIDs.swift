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
@frozen
public struct GAPListOf16BitServiceSolicitationUUIDs: GAPData, Equatable {
    
    public static let dataType: GAPDataType = .listOf16BitServiceSolicitationUUIDs
    
    public let uuids: [UInt16]
    
    public init(uuids: [UInt16] = []) {
        
        self.uuids = uuids
    }
}

public extension GAPListOf16BitServiceSolicitationUUIDs {
    
    init?(data: Data) {
        
        guard let list = GAPUUIDList<ArrayLiteralElement>(data: data)
            else { return nil }
        
        self.uuids = list.uuids
    }
    
    func append(to data: inout Data) {
        
        data += GAPUUIDList(uuids: uuids)
    }
    
    var dataLength: Int {
        
        return MemoryLayout<UInt16>.size * uuids.count
    }
}

// MARK: - ExpressibleByArrayLiteral

extension GAPListOf16BitServiceSolicitationUUIDs: ExpressibleByArrayLiteral {
    
    public init(arrayLiteral elements: UInt16...) {
        
        self.init(uuids: elements)
    }
}

// MARK: - CustomStringConvertible

extension GAPListOf16BitServiceSolicitationUUIDs: CustomStringConvertible {
    
    public var description: String {
        
        return uuids.map { BluetoothUUID.bit16($0) }.description
    }
}
