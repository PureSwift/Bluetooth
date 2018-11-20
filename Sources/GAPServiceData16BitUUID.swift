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
public struct GAPServiceData16BitUUID: GAPData, Equatable {
    
    internal static let uuidLength = MemoryLayout<UInt16>.size
    
    public static let dataType: GAPDataType = .serviceData16BitUUID
    
    /// UUID
    public let uuid: UInt16
    
    /// Service Data
    public let serviceData: Data
    
    public init(uuid: UInt16, serviceData: Data = Data()) {
        
        self.uuid = uuid
        self.serviceData = serviceData
    }
    
    public init?(data: Data) {
        
        guard data.count >= type(of: self).uuidLength
            else { return nil }
        
        let uuid = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
        let serviceData = data.subdata(in: (type(of: self).uuidLength ..< data.count))
        
        self.init(uuid: uuid, serviceData: serviceData)
    }
    
    public var data: Data {
        
        var data = Data(capacity: MemoryLayout<UInt16>.size + serviceData.count)
        data += uuid.littleEndian
        data += serviceData
        
        return data
    }
}

extension GAPServiceData16BitUUID: CustomStringConvertible {
    
    public var description: String {
        
        return uuid.description + serviceData.map { String($0) }.description
    }
}
