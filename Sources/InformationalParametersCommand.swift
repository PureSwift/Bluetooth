//
//  InformationalParametersCommand.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 3/23/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

public enum InformationalParametersCommand: UInt16, HCICommand {
    
     public static let opcodeGroupField = HCIOpcodeGroupField.informationalParameters
    
    /// Read Local Version Information
    case readLocalVersionInformation = 0x01
}

// MARK: - Name

public extension InformationalParametersCommand {
    
    public var name: String {
        
        return type(of: self).names[Int(rawValue)]
    }
    
    private static let names = [
        "Unknown",
        "Read Local Version Information",
        "Read Local Supported Commands",
        "Read Local Supported Features",
        "Read Local Extended Features",
        "Read Buffer Size",
        "Unknown",
        "Read Country Code",
        "Unknown",
        "Read BD ADDR",
        "Read Data Block Size"
    ]
}
