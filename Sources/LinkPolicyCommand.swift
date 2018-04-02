//
//  LinkPolicyCommand.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 3/23/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

public enum LinkPolicyCommand: UInt16, HCICommand {
    
    public static let opcodeGroupField = HCIOpcodeGroupField.linkPolicy
    
    /// Hold Mode Command
    ///
    /// The Hold Mode command is used to alter the behavior of the Link Manager,
    /// and have it place the ACL baseband connection associated by the specified
    /// Connection Handle into the hold mode.
    case holdMode                    = 0x0001
    
}

// MARK: - Name

public extension LinkPolicyCommand {
    
    public var name: String {
        
        return type(of: self).names[Int(rawValue)]
    }
    
    private static let names = [
        "Unknown",
        "Hold Mode",
        "Unknown",
        "Sniff Mode",
        "Exit Sniff Mode",
        "Park State",
        "Exit Park State",
        "QoS Setup",
        "Unknown",
        "Role Discovery",
        "Unknown",
        "Switch Role",
        "Read Link Policy Settings",
        "Write Link Policy Settings",
        "Read Default Link Policy Settings",
        "Write Default Link Policy Settings",
        "Flow Specification",
        "Sniff Subrating"
    ]
}
