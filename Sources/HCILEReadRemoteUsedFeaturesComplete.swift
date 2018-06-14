//
//  HCILEReadRemoteUsedFeaturesComplete.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// LE Read Remote Features Complete Event
///
/// The event is used to indicate the completion of the process of the Controller
/// obtaining the features used on the connection and the features supported by the remote Blu
public struct HCILEReadRemoteUsedFeaturesComplete: HCIEventParameter {
    
    public static let event = LowEnergyEvent.readRemoteUsedFeaturesComplete // 0x04
    
    public static let length: Int = 11
    
    public typealias Status = HCIStatus
    
    /// `0x00` if Connection successfully completed.
    /// `HCIError` value otherwise.
    public let status: Status
    
    /// Connection Handle
    ///
    /// Range: 0x0000-0x0EFF (all other values reserved for future use)
    public let handle: UInt16 // Connection_Handle
    
    /// LE features of the remote controller.
    public let features: LowEnergyFeatureSet
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let statusByte = data[0]
        
        let handle = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))
        
        let featuresRawValue = UInt64(littleEndian: UInt64(bytes: (data[3],
                                                                   data[4],
                                                                   data[5],
                                                                   data[6],
                                                                   data[7],
                                                                   data[8],
                                                                   data[9],
                                                                   data[10])))
        
        guard let status = Status(rawValue: statusByte)
            else { return nil }
        
        self.status = status
        self.handle = handle
        self.features = LowEnergyFeatureSet(rawValue: featuresRawValue)
    }
}
