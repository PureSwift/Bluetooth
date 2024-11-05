//
//  GAPServiceData32BitUUID.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

#if canImport(Foundation)
import Foundation
#endif
import Bluetooth

/// The Service Data data type consists of a service UUID with the data associated with that service.
///
/// Size: 4 or more octets
/// The first 4 octets contain the 32 bit Service UUID followed by additional service data
@frozen
public struct GAPServiceData32BitUUID<ServiceData: DataContainer>: GAPData, Equatable, Hashable, Sendable {
    
    public static var dataType: GAPDataType { .serviceData32BitUUID }
    
    /// UUID
    public let uuid: UInt32
    
    /// Service Data
    public let serviceData: ServiceData
    
    public init(uuid: UInt32,
                serviceData: ServiceData) {
        
        self.uuid = uuid
        self.serviceData = serviceData
    }
}

public extension GAPServiceData32BitUUID {
    
    init?<Data: DataContainer>(data: Data) {
        
        guard data.count >= 2
            else { return nil }
        
        let uuid = UInt32(littleEndian: UInt32(bytes: (data[0],
                                                       data[1],
                                                       data[2],
                                                       data[3])))
        
        let serviceData = data.subdata(in: 4 ..< data.startIndex + data.count)
        
        self.init(uuid: uuid, serviceData: ServiceData(serviceData))
    }
    
    func append<Data: DataContainer>(to data: inout Data) {
        
        data += uuid.littleEndian
        data += serviceData
    }
    
    var dataLength: Int {
        
        return MemoryLayout<UInt32>.size + serviceData.count
    }
}
