//
//  HCICommand.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 1/13/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

/// HCI Command.
public protocol HCICommand: RawRepresentable {
    
    static var opcodeGroupField: HCIOpcodeGroupField { get }
    
    init?(rawValue: HCIOpcodeCommandField)
    
    var rawValue: HCIOpcodeCommandField { get }
}

public typealias HCIOpcodeCommandField = UInt16

/// HCI Command Parameter.
public protocol HCICommandParameter {
    
    associatedtype HCICommandType: HCICommand
    
    static var command: HCICommandType { get }
    
    /// Length of the command when encoded to data.
    static var length: Int { get }
    
    /// Converts command parameter to raw bytes.
    var byteValue: [UInt8] { get }
}

/// The return value (not event) returned by an HCI command. 
public protocol HCICommandReturnParameter {
    
    associatedtype HCICommandType: HCICommand
    
    static var command: HCICommandType { get }
    
    // The return parameter status code.
    var status: HCIStatus { get }
    
    /// Length of the command return parameter when encoded to data.
    static var length: Int { get }
    
    // Attempt to initialize command return parameter from data.
    init?(byteValue: [UInt8])
}
