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
@frozen
public struct GAPServiceData16BitUUID: GAPData, Equatable, Hashable {
    
    public static let dataType: GAPDataType = .serviceData16BitUUID
    
    /// UUID
    public let uuid: UInt16
    
    /// Service Data
    public let serviceData: Data
    
    public init(uuid: UInt16,
                serviceData: Data) {
        
        self.uuid = uuid
        self.serviceData = serviceData
    }
}

public extension GAPServiceData16BitUUID {
    
    init?(data: Data) {
        
        guard data.count >= 2
            else { return nil }
        
        let uuid = UInt16(littleEndian: UInt16(bytes: (data[0],
                                                       data[1])))
        
        let serviceData = data.subdata(in: 2 ..< data.startIndex + data.count)
        
        self.init(uuid: uuid, serviceData: serviceData)
    }
    
    func append(to data: inout Data) {
        
        data += uuid.littleEndian
        data += serviceData
    }
    
    var dataLength: Int {
        
        return MemoryLayout<UInt16>.size + serviceData.count
    }
}
