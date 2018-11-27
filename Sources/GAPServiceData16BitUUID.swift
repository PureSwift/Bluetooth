//
//  GAPServiceData16BitUUID.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// The Service Data data type consists of a service UUID with the data associated with that service.
///
/// Size: 2 or more octets
/// The first 2 octets contain the 16 bit Service UUID followed by additional service data
public struct GAPServiceData16BitUUID: GAPData {
    
    public static let dataType: GAPDataType = .serviceData16BitUUID
    
    /// UUID
    public let uuid: UInt16
    
    /// Service Data
    public let serviceData: LowEnergyAdvertisingData
    
    public init(uuid: UInt16,
                serviceData: LowEnergyAdvertisingData) {
        
        self.uuid = uuid
        self.serviceData = serviceData
    }
}

public extension GAPServiceData16BitUUID {
    
    init?(data: Slice<LowEnergyAdvertisingData>) {
        
        guard data.count >= 2
            else { return nil }
        
        let uuid = UInt16(littleEndian: UInt16(bytes: (data[data.startIndex + 0],
                                                       data[data.startIndex + 1])))
        
        let serviceData = LowEnergyAdvertisingData(data[data.startIndex + 2 ..< data.startIndex + data.count])
        
        self.init(uuid: uuid, serviceData: serviceData)
    }
    
    func append(to data: inout LowEnergyAdvertisingData) {
        
        data += uuid.littleEndian
        data += serviceData
    }
}

// MARK: - Equatable

extension GAPServiceData16BitUUID: Equatable {
    
    public static func == (lhs: GAPServiceData16BitUUID, rhs: GAPServiceData16BitUUID) -> Bool {
        
        return lhs.uuid == rhs.uuid
            && LowEnergyAdvertisingData(lhs.serviceData) == LowEnergyAdvertisingData(rhs.serviceData)
    }
}
