//
//  InformationalParametersCommand.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 3/23/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

public enum InformationalCommand: UInt16, HCICommand {
    
     public static let opcodeGroupField = HCIOpcodeGroupField.informational
    
    /// Read Local Version Information
    ///
    /// This command reads the values for the version information for the local Controller.
    case readLocalVersionInformation = 0x0001
    
    /// Read Local Supported Commands
    ///
    /// This command reads the list of HCI commands supported for the local Controller.
    case readLocalSupportedCommands = 0x0002
    
    /// Read Local Supported Features
    ///
    /// This command requests a list of the supported features for the local BR/EDR Controller.
    /// This command will return a list of the LMP features.
    case readLocalSupportedFeatures = 0x0003
    
    /// Read Local Extended Features
    ///
    /// This command returns the requested page of the extended LMP features.
    case readLocalExtendedFeatures = 0x0004
    
    /// Read Buffer Size
    ///
    /// Used to read the maximum size of the data portion of HCI ACL and synchronous Data Packets sent from the Host to the Controller.
    case readBufferSize = 0x0005
    
    /// Read Device Address
    ///
    /// On a BR/EDR Controller, this command reads the Bluetooth Controller address (BD_ADDR).
    ///
    /// On an LE Controller, this command shall read the Public Device Address.
    /// If this Controller does not have a Public Device Address, the value 0x000000000000 shall be returned.
    ///
    /// - Note: On a BR/EDR/LE Controller, the public address shall be the same as the `BD_ADDR`.
    case readDeviceAddress = 0x0009
    
    /// Read Data Block Size
    ///
    /// This command is used to read values regarding the maximum permitted data transfers over the Controller and
    /// the data buffering available in the Controller.
    case readDataBlockSize = 0x000A
    
    /// Read Local Supported Codecs
    ///
    /// This command reads a list of the Bluetooth SIG approved codecs supported by the Controller, as well as vendor specific codecs,
    /// which are defined by an individual manufacturer.
    case readLocalSupportedCodecs = 0x000B
}

// MARK: - Name

public extension InformationalCommand {
    
    public var name: String {
        
        switch self {
        case .readLocalVersionInformation: return "Read Local Version Information"
        case .readLocalSupportedCommands: return "Read Local Supported Commands"
        case .readLocalSupportedFeatures: return "Read Local Supported Features"
        case .readLocalExtendedFeatures: return "Read Local Extended Features"
        case .readBufferSize: return "Read Buffer Size"
        case .readDeviceAddress: return "Read Device Address"
        case .readDataBlockSize: return "Read Data Block Size"
        case .readLocalSupportedCodecs: return "Read Local Supported Codecs"
        }
    }
}
