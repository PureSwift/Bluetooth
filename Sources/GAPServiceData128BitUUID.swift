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
public struct GAPServiceData128BitUUID: GAPData {
    
    internal static let uuidLength = MemoryLayout<UInt128>.size
    
    public static let dataType: GAPDataType = .serviceData128BitUUID
    
    public let uuid: UUID
    public private(set) var serviceData: Data
    
    public init(uuid: UUID, serviceData: Data = Data()) {
        
        self.uuid = uuid
        self.serviceData = serviceData
    }
    
    public init?(data: Data) {
        
        guard data.count >= type(of: self).uuidLength
            else { return nil }
        
        let uuid = UInt128(littleEndian: UInt128(bytes: (data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7], data[8], data[9], data[10], data[11], data[12], data[13], data[14], data[15])))
        let serviceData = data.subdata(in: (type(of: self).uuidLength..<data.count))
        
        self.init(uuid: UUID(uuid), serviceData: serviceData)
    }
    
    public var data: Data {
        let data = UInt128(uuid: uuid).littleEndian.data
        
        return serviceData.reduce(data, { $0.0 + [$0.1] })
    }
}

extension GAPServiceData128BitUUID: Equatable {
    
    public static func == (lhs: GAPServiceData128BitUUID, rhs: GAPServiceData128BitUUID) -> Bool {
        
        return lhs.uuid == rhs.uuid && lhs.serviceData == rhs.serviceData
    }
}

extension GAPServiceData128BitUUID: CustomStringConvertible {
    
    public var description: String {
        
        return uuid.description + serviceData.map { String($0) }.description
    }
}
