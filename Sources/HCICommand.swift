//
//  HCICommand.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 1/13/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

import Foundation

/// HCI Command.
public protocol HCICommand: RawRepresentable, Hashable, CustomStringConvertible {
    
    /// The command group opcode.
    static var opcodeGroupField: HCIOpcodeGroupField { get }
    
    init?(rawValue: HCIOpcodeCommandField)
    
    var rawValue: HCIOpcodeCommandField { get }
    
    /// Human readable name of the HCI command. 
    var name: String { get }
}

public extension HCICommand {
    
    public var description: String {
        
        return name
    }
}

public extension HCICommand {
    
    /// The packed HCI command opcode.
    public var opcode: UInt16 {
        
        let commandField = self.rawValue
        let groupField = Self.opcodeGroupField.rawValue
        return (commandField & 0x03ff) | (groupField << 10)
    }
}

public typealias HCIOpcodeCommandField = UInt16

/// HCI Command Parameter.
public protocol HCICommandParameter {
    
    associatedtype HCICommandType: HCICommand
    
    static var command: HCICommandType { get }
    
    /// Converts command parameter to raw bytes.
    var data: Data { get }
}

/// The return value (not event) returned by an HCI command. 
public protocol HCICommandReturnParameter {
    
    associatedtype HCICommandType: HCICommand
    
    static var command: HCICommandType { get }
    
    /// Length of the command return parameter when encoded to data.
    static var length: Int { get }
    
    // Attempt to initialize command return parameter from data.
    init?(data: Data)
}
