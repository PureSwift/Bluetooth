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
    
    internal static let uuidLength = MemoryLayout<UInt16>.size
    
    public static let dataType: GAPDataType = .serviceData16BitUUID
    
    public let uuid: UInt16
    public private(set) var serviceData: Data
    
    public init(uuid: UInt16, serviceData: Data = Data()) {
        
        self.uuid = uuid
        self.serviceData = serviceData
    }
    
    public init?(data: Data) {
        
        guard data.count >= type(of: self).uuidLength
            else { return nil }
        
        let uuid = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
        let serviceData = data.subdata(in: (type(of: self).uuidLength..<data.count))
        
        self.init(uuid: uuid, serviceData: serviceData)
    }
    
    public var data: Data {
        
        let bytes = UInt16(littleEndian: uuid).bytes
        let data = Data([bytes.0, bytes.1])
        
        return serviceData.reduce(data, { $0.0 + [$0.1] })
    }
}

extension GAPServiceData16BitUUID: Equatable {
    
    public static func == (lhs: GAPServiceData16BitUUID, rhs: GAPServiceData16BitUUID) -> Bool {
        
        return lhs.uuid == rhs.uuid && lhs.serviceData == rhs.serviceData
    }
}

extension GAPServiceData16BitUUID: CustomStringConvertible {
    
    public var description: String {
        
        return uuid.description + serviceData.map { String($0) }.description
    }
}
