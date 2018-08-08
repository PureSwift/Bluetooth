//
//  HCIReadRemoteVersionInformationComplete.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 8/7/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

public struct HCIReadRemoteVersionInformationComplete: HCIEventParameter {
    
    public static let event = HCIGeneralEvent.readRemoteVersionInformationCompleteEvent
    
    public static let length: Int = 8
    
    public let status: HCIStatus
    
    public let handle: UInt16
    
    public let version: UInt8
    
    public let companyId: UInt16
    
    public let subversion: UInt16
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        guard let status = HCIStatus(rawValue: data[0])
            else { return nil }
        
        let handle = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))
        
        self.version = data[3]
        
        self.companyId = UInt16(littleEndian: UInt16(bytes: (data[4], data[5])))
        
        self.subversion = UInt16(littleEndian: UInt16(bytes: (data[6], data[7])))
        
        self.status = status
        
        self.handle = handle
    }
}
