//
//  LinkControlCommand.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 1/13/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

public enum LinkControlCommand: UInt16, HCICommand {
    
    public static let opcodeGroupField = HCIOpcodeGroupField.linkControl
    
    /// Command used to enter Inquiry mode where it discovers other Bluetooth devices.
    case inquiry                    = 0x0001
    
    /// Command to cancel the Inquiry mode in which the Bluetooth device is in.
    case inquiryCancel              = 0x0002
    
    /// Command to set the device to enter Inquiry modes periodically according to the time interval set.
    case periodicInquiry            = 0x0003
    
    /// Command to exit the periodic Inquiry mode.
    case exitPeriodicInquiry        = 0x0004
    
    /// Command to create an ACL connection to the device specified by the BD_ADDR in the parameters.
    case createConnection           = 0x0005
    
    /// Command to terminate the existing connection to a device.
    case disconnect                 = 0x0006
    
    /// Create an SCO connection defined by the connection handle parameters.
    case addSCOConnection           = 0x0007
    
    /// Cancel Create Connection
    case createConnectionCancel     = 0x0008
    
    /// Command to accept a new connection request.
    case acceptConnection           = 0x0009
    
    /// Command to reject a new connection request.
    case rejectConnection           = 0x000A
    
    /// Reply command to a link key request event sent from controller to the host.
    case linkKeyReply               = 0x000B
    
    /// Reply command to a link key request event from the controller to the host if there is no link key associated with the connection.
    case linkKeyNegativeReply       = 0x000C
    
    /// Reply command to a PIN code request event sent from a controller to the host.
    case pinCodeReply               = 0x000D
    
    /// Reply command to a PIN code request event sent from the controller to the host if there is no PIN associated with the connection.
    case pinCodeNegativeReply       = 0x000E
    
    /// Command to change the type of packets to be sent for an existing connection.
    case setConnectionPacketType    = 0x000F
    
    /// Command to establish authentication between two devices specified by the connection handle.
    case authenticationRequested    = 0x0011
    
    /// Command to enable or disable the link level encryption.
    case setConnectionEncryption    = 0x0013
    
    /// Command to force the change of a link key to a new one between two connected devices.
    case changeConnectionLinkKey    = 0x0015
    
    /// Command to force two devices to use the master's link key temporarily.
    case masterLinkKey              = 0x0017
    
    /// Command to determine the user friendly name of the connected device.
    case remoteNameRequest          = 0x0019
    
    /// Cancels the remote name request.
    case remoteNameRequestCancel    = 0x001A
    
    /// Command to determine the features supported by the connected device.
    case readRemoteFeatures         = 0x001B
    
    /// Command to determine the extended features supported by the connected device.
    case readRemoteExtendedFeatures = 0x001C
    
    /// Command to determine the version information of the connected device.
    case readRemoteVersion          = 0x001D
    
    /// Command to read the clock offset of the remote device.
    case readClockOffset            = 0x001F
    
    /// Read LMP Handle
    case readLMPHandle              = 0x0020
}

// MARK: - Name

public extension LinkControlCommand {
    
    public var name: String {
        
        return type(of: self).names[Int(rawValue)]
    }
    
    private static let names = [
        "Unknown",
        "Inquiry",
        "Inquiry Cancel",
        "Periodic Inquiry Mode",
        "Exit Periodic Inquiry Mode",
        "Create Connection",
        "Disconnect",
        "Add SCO Connection",
        "Create Connection Cancel",
        "Accept Connection Request",
        "Reject Connection Request",
        "Link Key Request Reply",
        "Link Key Request Negative Reply",
        "PIN Code Request Reply",
        "PIN Code Request Negative Reply",
        "Change Connection Packet Type",
        "Unknown",
        "Authentication Requested",
        "Unknown",
        "Set Connection Encryption",
        "Unknown",
        "Change Connection Link Key",
        "Unknown",
        "Master Link Key",
        "Unknown",
        "Remote Name Request",
        "Remote Name Request Cancel",
        "Read Remote Supported Features",
        "Read Remote Extended Features",
        "Read Remote Version Information",
        "Unknown",
        "Read Clock Offset",
        "Read LMP Handle",
        "Unknown",
        "Unknown",
        "Unknown",
        "Unknown",
        "Unknown",
        "Unknown",
        "Unknown",
        "Setup Synchronous Connection",
        "Accept Synchronous Connection",
        "Reject Synchronous Connection",
        "IO Capability Request Reply",
        "User Confirmation Request Reply",
        "User Confirmation Request Negative Reply",
        "User Passkey Request Reply",
        "User Passkey Request Negative Reply",
        "Remote OOB Data Request Reply",
        "Unknown",
        "Unknown",
        "Remote OOB Data Request Negative Reply",
        "IO Capability Request Negative Reply",
        "Create Physical Link",
        "Accept Physical Link",
        "Disconnect Physical Link",
        "Create Logical Link",
        "Accept Logical Link",
        "Disconnect Logical Link",
        "Logical Link Cancel",
        "Flow Spec Modify"
    ]
}
