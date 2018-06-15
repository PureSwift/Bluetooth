//
//  HCIHoldMode.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/15/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 Hold Mode Command
 
 The Hold_Mode command is used to alter the behavior of the Link Manager, and have it place the ACL baseband connection associated by the specified Connection_Handle into the hold mode. The Hold_Mode_Max_Interval and Hold_Mode_Min_Interval command parameters specify the length of time the Host wants to put the connection into the hold mode. The local and remote devices will negotiate the length in the hold mode. The Hold_Mode_Max_ Interval parameter is used to specify the maximum length of the Hold interval for which the Host may actually enter into the hold mode after negotiation with the remote device. The Hold interval defines the amount of time between when the Hold Mode begins and when the Hold Mode is completed. The Hold_ Mode_Min_Interval parameter is used to specify the minimum length of the Hold interval for which the Host may actually enter into the hold mode after the negotiation with the remote device. Therefore the Hold_Mode_Min_Interval cannot be greater than the Hold_Mode_Max_Interval. The BR/EDR Controller will return the actual Hold interval in the Interval parameter of the Mode Change event, if the command is successful. This command enables the Host to support a low-power policy for itself or several other BR/EDR Controllers, and allows the devices to enter Inquiry Scan, Page Scan, and a number of other possible actions.
 
 - Note: The Connection_Handle cannot be of the SCO or eSCO link type
 If the Host sends data to the BR/EDR Controller with a Connection_Handle corresponding to a connection in hold mode, the BR/EDR Controller will keep the data in its buffers until either the data can be transmitted (the hold mode has ended) or a flush, a flush timeout or a disconnection occurs. This is valid even if the Host has not yet been notified of the hold mode through a Mode Change event when it sends the data.
 
 - Note: The above is not valid for an HCI Data Packet sent from the Host to the BR/EDR Controller on the master side where the Connection_Handle is a Connection_Handle used for broadcast and the Broadcast_Flag is set to Active Broadcast. The broadcast data will then never be received by slaves in hold mode.
 
 The Hold_Mode_Max_Interval shall be less than the Link Supervision Timeout configuration parameter.
 */
public struct HCIHoldMode: HCICommandParameter {
    
    public static let command = LinkPolicyCommand.holdMode
    
    public static let length = MemoryLayout<UInt16>.size + Interval.length
    
    /// Connection Handle
    public var connectionHandle: UInt16
    
    /// Acceptable number of Baseband slots to wait in Hold Mode.
    public var interval: Interval
    
    public init(connectionHandle: UInt16, interval: Interval = .full) {
        
        self.connectionHandle = connectionHandle
        self.interval = interval
    }
    
    public var data: Data {
        
        // Connection_Handle
        let handleBytes = connectionHandle.littleEndian.bytes
        
        // Hold_Mode_Max_Interval
        let intervalMaxBytes = interval.rawValue.upperBound.littleEndian.bytes
        
        // Hold_Mode_Min_Interval
        let intervalMinBytes = interval.rawValue.lowerBound.littleEndian.bytes
        
        return Data([handleBytes.0,
                     handleBytes.1,
                     intervalMaxBytes.0,
                     intervalMaxBytes.1,
                     intervalMinBytes.0,
                     intervalMinBytes.1])
    }
}

// MARK: - Supporting Types

public extension HCIHoldMode {
    
    /**
     Hold Mode Max Interval
     
     Maximum / Minimum acceptable number of Baseband slots to wait in Hold Mode.
     Time Length of the Hold = N * 0.625 ms (1 Baseband slot)
     
     Range for N: 0x0002-0xFFFE; only even values are valid.
     
     Time Range: 1.25ms - 40.9 s
     
     Mandatory Range: 0x0014 to 0x8000
     */
    public struct Interval: RawRepresentable, Equatable {
        
        public static let length = MemoryLayout<UInt16>.size + MemoryLayout<UInt16>.size
        
        public typealias RawValue = CountableClosedRange<UInt16>
        
        public static let min: UInt16 = 0x0014
        
        public static let max: UInt16 = 0x8000
        
        /// Maximum interval range.
        public static let full = Interval(Interval.min ... Interval.max)
        
        public let rawValue: RawValue
        
        public init?(rawValue: RawValue) {
            
            assert(Interval.full.rawValue.lowerBound == Interval.min)
            assert(Interval.full.rawValue.upperBound == Interval.max)
            
            guard rawValue.lowerBound >= Interval.min,
                rawValue.upperBound <= Interval.max
                else { return nil }
            
            assert(rawValue.clamped(to: Interval.full.rawValue) == rawValue)
            assert(rawValue.overlaps(Interval.full.rawValue))
            
            self.rawValue = rawValue
        }
        
        // private API, unsafe
        private init(_ unchecked: RawValue) {
            
            self.rawValue = unchecked
        }
        
        /// Time = N * 0.625 ms
        /// N * 1.25ms - 40.9 s
        public var miliseconds: ClosedRange<Double> {
            
            func toMiliseconds(_ value: UInt16) -> Double {
                
                return Double(value) * Double(0.625)
            }
            
            let min = toMiliseconds(rawValue.lowerBound)
            
            let max = toMiliseconds(rawValue.upperBound)
            
            return min ... max
        }
        
        // Equatable
        public static func == (lhs: Interval, rhs: Interval) -> Bool {
            
            return lhs.rawValue == rhs.rawValue
        }
    }
}
