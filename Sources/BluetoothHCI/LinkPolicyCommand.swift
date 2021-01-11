//
//  LinkPolicyCommand.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 3/23/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

@frozen
public enum LinkPolicyCommand: UInt16, HCICommand {
    
    public static let opcodeGroupField = HCIOpcodeGroupField.linkPolicy
    
    /// Hold Mode Command
    ///
    /// The Hold Mode command is used to alter the behavior of the Link Manager,
    /// and have it place the ACL baseband connection associated by the specified
    /// Connection Handle into the hold mode.
    case holdMode = 0x0001
    
    /// Sniff Mode Command
    ///
    /// The Sniff_Mode command is used to alter the behavior of the Link Manager and have it place the ACL baseband connection associated with the specified Connection_Handle into the sniff mode.
    case sniffMode = 0x0003
    
    /// Exit Sniff Mode Command
    ///
    /// The Exit_Sniff_Mode command is used to end the sniff mode for a Connection_Handle, which is currently in sniff mode.
    case exitSniffMode = 0x0004
    
    /// Park State Command
    ///
    /// The Park_State command is used to alter the behavior of the Link Manager, and have the LM place the baseband connection associated by the specified Connection_Handle into Park state.
    case parkState = 0x0005
    
    /// Exit Park State Command
    ///
    /// The Exit_Park_State command is used to switch the BR/EDR Controller from park state back to the active mode.
    case exitParkState = 0x0006
    
    /// QoS Setup Command
    ///
    /// The QoS_Setup command is used to specify Quality of Service parameters for a Connection_Handle.
    case qosSetup = 0x0007
    
    /// Role Discovery Command
    ///
    /// The Role_Discovery command is used for a Host to determine which role the device is performing for a particular Connection_Handle.
    case roleDiscovery = 0x0009
    
    /// Switch Role Command
    ///
    /// The Switch_Role command is used to switch the current BR/EDR role the device is performing for a particular connection with another specified BR/EDR Controller.
    case switchRole = 0x000B
    
    /// Read Link Policy Settings Command
    ///
    /// This command will read the Link Policy setting for the specified Connection_Handle.
    case readLinkPolicySettings = 0x000C
    
    /// Write Link Policy Settings Command
    ///
    /// This command writes the Link Policy setting for the specified Connection_Handle.
    case writeLinkPolicySettings = 0x000D
    
    /// Read Default Link Policy Settings Command
    ///
    /// This command reads the Default Link Policy setting for all new BR/EDR con- nections.
    case readDefaultLinkPolicySettings = 0x000E
    
    /// Write Default Link Policy Settings Command
    ///
    /// This command writes the Default Link Policy configuration value.
    case writeDefaultLinkPolicySettings = 0x000F
    
    /// Flow Specification Command
    ///
    /// The Flow_Specification command is used to specify the flow parameters for the traffic carried over the ACL connection identified by the Connection_Handle.
    case flowSpecification = 0x0010
    
    /// Sniff Subrating Command
    ///
    /// The Sniff_Subrating command specifies the parameters for sniff subrating for a given link.
    case sniffSubrating = 0x0011
}

// MARK: - Name

public extension LinkPolicyCommand {
    
    var name: String {
        
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
