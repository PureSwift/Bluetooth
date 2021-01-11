//
//  HCIQoSSetupComplete.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 8/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// QoS Setup Complete Event
///
/// The QoS Setup Complete event is used to indicate the completion of the process of the Link Manager setting up QoS with the remote BR/EDR Control- ler specified by the Connection_Handle event parameter. The Connection_Handle will be a Connection_Handle for an ACL connection.
@frozen
public struct HCIQoSSetupComplete: HCIEventParameter {
    
    public static let event = HCIGeneralEvent.qosSetupComplete
    
    public static let length: Int = 21
    
    public let status: HCIStatus
    
    public var connectionHandle: UInt16
    
    internal var flags: UInt8
    
    public var serviceType: HCIQoSSetup.ServiceType
    
    public var tokenRate: UInt32
    
    public var peakBandWidth: UInt32
    
    public var latency: UInt32
    
    public var delayVariation: UInt32
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        guard let status = HCIStatus(rawValue: data[0])
            else { return nil }
        
        let connectionHandle = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))
        
        let flags = data[3]
        
        guard let serviceType = HCIQoSSetup.ServiceType(rawValue: data[4])
            else { return nil }
        
        let tokenRate = UInt32(littleEndian: UInt32(bytes: (data[5], data[6], data[7], data[8])))
        
        let peakBandWidth = UInt32(littleEndian: UInt32(bytes: (data[9], data[10], data[11], data[12])))
        
        let latency = UInt32(littleEndian: UInt32(bytes: (data[13], data[14], data[15], data[16])))
        
        let delayVariation = UInt32(littleEndian: UInt32(bytes: (data[17], data[18], data[19], data[20])))
        
        self.status = status
        self.connectionHandle = connectionHandle
        self.flags = flags
        self.serviceType = serviceType
        self.tokenRate = tokenRate
        self.peakBandWidth = peakBandWidth
        self.latency = latency
        self.delayVariation = delayVariation
    }
}
