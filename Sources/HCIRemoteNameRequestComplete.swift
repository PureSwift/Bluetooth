//
//  HCIRemoteNameRequestComplete.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// HCI Remote Name Request Complete Event
public struct HCIRemoteNameRequestComplete: HCIEventParameter {
    
    public static let event = HCIGeneralEvent.remoteNameRequestComplete
    public static let length = 255
    
    public var status: HCIStatus
    public var address: Address
    public var name: String
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let statusByte = data[0]
        
        guard let status = HCIStatus(rawValue: statusByte)
            else { return nil }
        
        self.status = status
        self.address = Address(bytes: (data[1], data[2], data[3], data[4], data[5], data[6]))
        
        let nameBytes = Array(data[7 ..< HCI.maximumNameLength])
        
        guard let name = String(data: Data(bytes: nameBytes), encoding: .utf8)
            else { return nil }
        
        self.name = name
    }
}
