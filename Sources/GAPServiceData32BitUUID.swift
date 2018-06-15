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
public struct GAPServiceData32BitUUID: GAPData {
    
    internal static let uuidLength = MemoryLayout<UInt32>.size
    
    public static let dataType: GAPDataType = .serviceData32BitUUID
    
    public let uuid: UInt32
    public private(set) var serviceData: Data
    
    public init(uuid: UInt32, serviceData: Data = Data()) {
        
        self.uuid = uuid
        self.serviceData = serviceData
    }
    
    public init?(data: Data) {
        
        guard data.count >= type(of: self).uuidLength
            else { return nil }
        
        let uuid = UInt32(littleEndian: UInt32(bytes: (data[0], data[1], data[2], data[3])))
        let serviceData = data.subdata(in: (type(of: self).uuidLength..<data.count))
        
        self.init(uuid: uuid, serviceData: serviceData)
    }
    
    public var data: Data {
        
        let bytes = UInt32(littleEndian: uuid).bytes
        let data = Data([bytes.0, bytes.1, bytes.2, bytes.3])
        
        return serviceData.reduce(data, { $0.0 + [$0.1] })
    }
}

extension GAPServiceData32BitUUID: Equatable {
    
    public static func == (lhs: GAPServiceData32BitUUID, rhs: GAPServiceData32BitUUID) -> Bool {
        
        return lhs.uuid == rhs.uuid && lhs.serviceData == rhs.serviceData
    }
}

extension GAPServiceData32BitUUID: CustomStringConvertible {
    
    public var description: String {
        
        return uuid.description + serviceData.map { String($0) }.description
    }
}
