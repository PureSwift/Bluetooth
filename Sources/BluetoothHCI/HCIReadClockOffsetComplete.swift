//
//  HCIReadClockOffsetComplete.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 8/8/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// Read Clock Offset Complete Event
///
/// The Read Clock Offset Complete event is used to indicate the completion of the process of the Link Manager obtaining the Clock Offset information of the BR/EDR Controller specified by the Connection_Handle event parameter. The Connection_Handle will be a Connection_Handle for an ACL connection.
@frozen
public struct HCIReadClockOffsetComplete: HCIEventParameter {
    
    public static let event = HCIGeneralEvent.readClockOffsetComplete
    
    public static let length: Int = 5
    
    public let status: HCIStatus
    
    public let handle: UInt16
    
    public let clockOffset: ClockOffset
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        guard let status = HCIStatus(rawValue: data[0])
            else { return nil }
        
        let handle = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))
        
        let clockOffset = ClockOffset(rawValue: UInt16(littleEndian: UInt16(bytes: (data[3], data[4]))))
        
        self.status = status
        self.handle = handle
        self.clockOffset = clockOffset
    }
}

extension HCIReadClockOffsetComplete {
    
    public struct ClockOffset: RawRepresentable {
        
        public static let length = MemoryLayout<UInt16>.size
        
        public let rawValue: UInt16
        
        public init(rawValue: UInt16) {
            
            self.rawValue = rawValue
        }
    }
}
