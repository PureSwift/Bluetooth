//
//  HCIReadRemoteExtendedFeaturesComplete.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 8/8/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// Read Remote Extended Features Complete Event
///
/// The Read Remote Extended Features Complete event is used to indicate the completion of the process of the Link Manager obtaining the remote extended LMP features of the remote device specified by the Connection_Handle event parameter. The Connection_Handle will be a Connection_Handle for an ACL connection. The event parameters include a page of the remote devices extended LMP features.
@frozen
public struct HCIReadRemoteExtendedFeaturesComplete: HCIEventParameter {
    
    public static let event = HCIGeneralEvent.readRemoteExtendedFeaturesComplete
    
    public static let length: Int = 13
    
    public let status: HCIStatus
    
    public let handle: UInt16
    
    public let pageNumber: UInt8
    
    public let maximumPageNumber: UInt8
    
    public let features: BitMaskOptionSet<LMPFeature>
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        guard let status = HCIStatus(rawValue: data[0])
            else { return nil }
        
        let handle = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))
        
        self.pageNumber = data[3]
        
        self.maximumPageNumber = data[4]
        
        let featuresValue = UInt64(littleEndian: UInt64(bytes: (data[5], data[6], data[7], data[8], data[9], data[10], data[11], data[12])))
        
        let features = BitMaskOptionSet<LMPFeature>(rawValue: featuresValue)
        
        self.status = status
        self.handle = handle
        self.features = features
    }
}
