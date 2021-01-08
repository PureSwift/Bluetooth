//
//  HCIReadRemoteFeaturesComplete.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 8/6/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// Read Remote Supported Features Complete Event
///
/// The Read Remote Supported Features Complete event is used to indicate the completion of the process of the Link Manager obtaining the supported features of the remote BR/EDR Controller specified by the Connection_Handle event parameter. The Connection_Handle will be a Connection_Handle for an ACL connection. The event parameters include a list of LMP features
@frozen
public struct HCIReadRemoteSupportedFeaturesComplete: HCIEventParameter {
    
    public static let event = HCIGeneralEvent.readRemoteSupportedFeaturesComplete
    
    public static let length: Int = 11
    
    public let status: HCIStatus
    
    public let handle: UInt16
    
    public let features: BitMaskOptionSet<LMPFeature>
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        guard let status = HCIStatus(rawValue: data[0])
            else { return nil }
        
        let handle = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))
        
        let featuresValue = UInt64(littleEndian: UInt64(bytes: (data[3], data[4], data[5], data[6], data[7], data[8], data[9], data[10])))
        
        let features = BitMaskOptionSet<LMPFeature>(rawValue: featuresValue)
        
        self.status = status
        self.handle = handle
        self.features = features
    }
}
