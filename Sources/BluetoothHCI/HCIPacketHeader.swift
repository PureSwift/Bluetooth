//
//  HCIPacketHeader.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 3/25/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - HCI Packet structures

public protocol HCIPacketHeader {
    
    static var length: Int { get }
    
    init?(data: Data)
    
    var data: Data { get }
}

// MARK: - Command Header

/// HCI Command Packet Header
public struct HCICommandHeader: HCIPacketHeader { // hci_command_hdr (packed)
    
    public static let length = 3
    
    /// OCF & OGF
    public var opcode: UInt16
    
    public var parameterLength: UInt8
    
    public init(opcode: UInt16 = 0,
                parameterLength: UInt8 = 0) {
        
        self.opcode = opcode
        self.parameterLength = parameterLength
    }
    
    public init <T: HCICommand> (command: T, parameterLength: UInt8 = 0) {
        
        self.opcode = command.opcode
        self.parameterLength = parameterLength
    }
    
    public static func from <T: HCICommandParameter> (_ commandParameter: T) -> (HCICommandHeader, Data) {
        
        let command = type(of: commandParameter).command
        let parameterData = commandParameter.data
        
        let header = HCICommandHeader(command: command,
                                      parameterLength: UInt8(parameterData.count))
        
        return (header, parameterData)
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        self.opcode = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
        self.parameterLength = data[2]
    }
    
    public var data: Data {
        
        let opcodeBytes = opcode.littleEndian.bytes
        
        return Data([opcodeBytes.0, opcodeBytes.1, parameterLength])
    }
}

// MARK: - Event Header

/// HCI Event Packet Header
public struct HCIEventHeader: HCIPacketHeader {
    
    public static let length = 2
    
    public var event: HCIGeneralEvent
    
    public var parameterLength: UInt8
    
    public init(event: HCIGeneralEvent, parameterLength: UInt8) {
        
        self.event = event
        self.parameterLength = parameterLength
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let eventByte = data[0]
        
        guard let event = HCIGeneralEvent(rawValue: eventByte)
            else { return nil }
        
        self.event = event
        self.parameterLength = data[1]
    }
    
    public var data: Data {
        
        return Data([event.rawValue, parameterLength])
    }
}
