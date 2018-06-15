//
//  HCILEAdvertisingSetTerminated.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/15/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// LE Advertising Set Terminated Event
///
/// The event indicates that the Controller has terminated advertising in the advertising sets specified by the Advertising_Handle parameter.
public struct HCILEAdvertisingSetTerminated: HCIEventParameter {
    
    public static let event = LowEnergyEvent.advertisingSetTerminated // 0x12
    
    public static let length: Int = 5
    
    public let status: HCIStatus
    
    public let advertisingHandle: UInt8
    
    public let connectionHandle: UInt16 // Connection_Handle
    
    public let numCompletedExtendedAdvertisingEvents: UInt8
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        guard let status = HCIStatus(rawValue: data[0])
            else { return nil }
        
        let advertisingHandle =  data[1]
        
        let connectionHandle = UInt16(littleEndian: UInt16(bytes: (data[2], data[3])))
        
        let numCompletedExtendedAdvertisingEvents = data[4]
        
        self.status = status
        self.advertisingHandle = advertisingHandle
        self.connectionHandle = connectionHandle
        self.numCompletedExtendedAdvertisingEvents = numCompletedExtendedAdvertisingEvents
    }
}
