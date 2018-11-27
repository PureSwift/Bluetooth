//
//  GAPServiceData32BitUUID.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// The Service Data data type consists of a service UUID with the data associated with that service.
///
/// Size: 4 or more octets
/// The first 4 octets contain the 32 bit Service UUID followed by additional service data
public struct GAPServiceData32BitUUID: GAPData, Equatable, Hashable {
    
    public static let dataType: GAPDataType = .serviceData32BitUUID
    
    /// UUID
    public let uuid: UInt32
    
    /// Service Data
    public let serviceData: LowEnergyAdvertisingData
    
    
    public init(uuid: UInt32,
                serviceData: LowEnergyAdvertisingData) {
        
        assert(serviceData.count <= 31 - 4)
        
        self.uuid = uuid
        self.serviceData = serviceData
    }
}

public extension GAPServiceData32BitUUID {
    
    init?(data: Slice<LowEnergyAdvertisingData>) {
        
        guard data.count >= 2
            else { return nil }
        
        let uuid = UInt32(littleEndian: UInt32(bytes: (data[data.startIndex + 0],
                                                       data[data.startIndex + 1],
                                                       data[data.startIndex + 2],
                                                       data[data.startIndex + 3])))
        
        let serviceData = LowEnergyAdvertisingData(data[data.startIndex + 4 ..< data.startIndex + data.count])
        
        self.init(uuid: uuid, serviceData: serviceData)
    }
    
    func append(to data: inout LowEnergyAdvertisingData) {
        
        data += uuid.littleEndian
        data += serviceData
    }
}
