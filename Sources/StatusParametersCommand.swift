//
//  StatusParametersCommand.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 3/23/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

public enum StatusParametersCommand: UInt16, HCICommand {
    
    public static let opcodeGroupField = HCIOpcodeGroupField.statusParameters
    
    /// Read Failed Contact Counter
    case readFailedContactCounter = 0x01
}

// MARK: - Name

public extension StatusParametersCommand {
    
    public var name: String {
        
        return type(of: self).names[Int(rawValue)]
    }
    
    private static let names = [
        "Unknown",
        "Read Failed Contact Counter",
        "Reset Failed Contact Counter",
        "Read Link Quality",
        "Unknown",
        "Read RSSI",
        "Read AFH Channel Map",
        "Read Clock",
        "Read Encryption Key Size",
        "Read Local AMP Info",
        "Read Local AMP ASSOC",
        "Write Remote AMP ASSOC"
    ]
}
