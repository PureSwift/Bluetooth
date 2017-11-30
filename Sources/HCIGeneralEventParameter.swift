//
//  HCIGeneralEventParameter.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 3/3/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

import Foundation

public extension HCIGeneralEvent {
    
    // TODO: Complete all command parameters
    
    public struct CommandCompleteParameter: HCIEventParameter {
        
        public static let event = HCIGeneralEvent.CommandComplete
        public static let length = 3
        
        /// The Number of HCI command packets which are allowed to be sent to the Controller from the Host.
        public var numberOfCommandPackets: UInt8 = 0
        public var opcode: UInt16 = 0
        
        public init() { }
        
        public init?(byteValue: [UInt8]) {
            
            guard byteValue.count == CommandCompleteParameter.length
                else { return nil }
            
            self.numberOfCommandPackets = byteValue[0]
            self.opcode = UInt16(bytes: (byteValue[1], byteValue[2])).littleEndian
        }
    }
    
    public struct CommandStatusParameter: HCIEventParameter {
        
        public static let event = HCIGeneralEvent.CommandStatus
        public static let length = 4
        
        public var status: UInt8 = 0
        public var ncmd: UInt8 = 0
        public var opcode: UInt16 = 0
        
        public init() { }
        
        public init?(byteValue: [UInt8]) {
            
            guard byteValue.count == CommandStatusParameter.length
                else { return nil }
            
            self.status = byteValue[0]
            self.ncmd = byteValue[1]
            self.opcode = UInt16(bytes: (byteValue[2], byteValue[3])).littleEndian
        }
    }
    
    public struct RemoteNameRequestCompleteParameter: HCIEventParameter {
        
        public static let event = HCIGeneralEvent.RemoteNameRequestComplete
        public static let length = 255
        
        public var status: UInt8 = 0
        public var address: Address = Address()
        public var name: String = ""
        
        public init() { }
        
        public init?(byteValue: [UInt8]) {
            
            guard byteValue.count == RemoteNameRequestCompleteParameter.length
                else { return nil }
            
            self.status = byteValue[0]
            self.address = Address(bytes: (byteValue[1], byteValue[2], byteValue[3], byteValue[4], byteValue[5], byteValue[6]))
            
            let nameBytes = Array(byteValue[7 ..< HCI.maximumNameLength])
            
            guard let name = String(UTF8Data: Data(bytes: nameBytes))
                else { return nil }
            
            self.name = name
        }
    }
    
    public struct LowEnergyMetaParameter: HCIEventParameter {
        
        public static let event = HCIGeneralEvent.LowEnergyMeta
        public static let length = 1 // 1 ... HCI.maximumEventSize
        
        public let subevent: LowEnergyEvent
        public let data: [UInt8]
        
        public init?(byteValue: [UInt8]) {
            
            guard byteValue.count >= LowEnergyMetaParameter.length,
                let subevent = LowEnergyEvent(rawValue: byteValue[0])
                else { return nil }
            
            self.subevent = subevent
            
            if byteValue.count > 1 {
                
                self.data = Array(byteValue.suffix(from: 1))
                
            } else {
                
                self.data = []
            }
        }
    }
}
