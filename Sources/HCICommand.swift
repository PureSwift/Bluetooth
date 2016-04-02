//
//  HCICommand.swift
//  BluetoothLinux
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


