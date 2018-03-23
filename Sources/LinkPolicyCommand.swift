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
