//
//  HCIModeChange.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 8/10/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// Mode Change Event
///
/// The Mode Change event is used to indicate when the device associated with the Connection_Handle changes between Active mode, Hold mode, and Sniff mode, and Park state. The Connection_Handle will be a Connection_Handle for an ACL connection. The Connection_Handle event parameter is used to indicate which connection the Mode Change event is for. The Current_Mode event parameter is used to indicate which state the connection is currently in. The Interval parameter is used to specify a time amount specific to each state. Each Controller that is associated with the Connection_Handle which has changed Modes shall send the Mode Change event to its Host.
@frozen
public struct HCIModeChange: HCIEventParameter {
    
    public static let event = HCIGeneralEvent.modeChangeEvent
    
    public static let length: Int = 6
    
    public let status: HCIStatus
    
    public let handle: UInt16
    
    public let currentMode: Mode
    
    public let interval: Interval
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        guard let status = HCIStatus(rawValue: data[0])
            else { return nil }
        
        let handle = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))
        
        guard let mode = Mode(rawValue: data[3]) 
            else { return nil }
        
        guard let interval = Interval(rawValue: UInt16(littleEndian: UInt16(bytes: (data[4], data[5]))))
            else { return nil }
        
        self.status = status
        self.handle = handle
        self.currentMode = mode
        self.interval = interval
    }
}

extension HCIModeChange {
    
    public enum Mode: UInt8 {
        
        /// Active Mode
        case active = 0x00
        
        /// Hold Mode
        case hold = 0x01
        
        /// Sniff Mode
        case sniff = 0x02
        
        /// Park State
        case park = 0x03
    }
}

extension HCIModeChange {
    
    public struct Interval: RawRepresentable {
        
        public static let min = Interval(0x0002)
        
        public static let max = Interval(0xFFFE)
        
        public let rawValue: UInt16
        
        public var duration: Double {
            
            return Double(rawValue) * 0.625
        }
        
        public init?(rawValue: UInt16) {
            
            guard rawValue <= Interval.max.rawValue,
                rawValue >= Interval.min.rawValue
                else { return nil }
            
            self.rawValue = rawValue
        }
        
        private init(_ unsafe: UInt16) {
            
            self.rawValue = unsafe
        }
    }
}
