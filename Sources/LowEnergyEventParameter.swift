//
//  LowEnergyEventParameter.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 3/2/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

public extension LowEnergyEvent {
    
    /// LE Connection Complete
    public struct ConnectionCompleteParameter: HCIEventParameter {
        
        public static let event = LowEnergyEvent.connectionComplete
        public static let length = 18
        
        public var status: UInt8 = 0
        public var handle: UInt16 = 0
        public var role: UInt8 = 0
        public var peerAddressType: LowEnergyAddressType = LowEnergyAddressType()
        public var peerAddress: Address = Address()
        public var interval: UInt16 = 0
        public var latency: UInt16 = 0
        public var supervisionTimeout: UInt16 = 0
        public var masterClockAccuracy: UInt8 = 0
        
        public init?(byteValue: [UInt8]) {
            
            fatalError("Not implemented")
        }
    }
}

