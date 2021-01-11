//
//  GAPServiceData128BitUUID.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// The Service Data data type consists of a service UUID with the data associated with that service.
///
/// Size: 16 or more octets
/// The first 16 octets contain the 128 bit Service UUID followed by additional service data
@frozen
public struct GAPServiceData128BitUUID: GAPData, Equatable {
    
    public static let dataType: GAPDataType = .serviceData128BitUUID
    
    /// UUID
    public let uuid: UUID
    
    /// Service Data
    public let serviceData: Data
    
    public init(uuid: UUID,
                serviceData: Data = Data()) {
        
        self.uuid = uuid
        self.serviceData = serviceData
    }
}

public extension GAPServiceData128BitUUID {
    
    init?(data: Data) {
        
        guard data.count >= UInt128.length
            else { return nil }
        
        let uuid = UInt128(littleEndian: UInt128(bytes: (data[0],
                                                         data[1],
                                                         data[2],
                                                         data[3],
                                                         data[4],
                                                         data[5],
                                                         data[6],
                                                         data[7],
                                                         data[8],
                                                         data[9],
                                                         data[10],
                                                         data[11],
                                                         data[12],
                                                         data[13],
                                                         data[14],
                                                         data[15])))
        
        let serviceData = data.subdata(in: UInt128.length ..< data.count)
        
        self.init(uuid: UUID(uuid), serviceData: serviceData)
    }
    
    func append(to data: inout Data) {
        
        data += UInt128(uuid: uuid).littleEndian
        data += serviceData
    }
    
    var dataLength: Int {
        
        return UInt128.length + serviceData.count
    }
}
