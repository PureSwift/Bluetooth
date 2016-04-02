//
//  LinkControlCommand.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 1/13/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

public enum LinkControlCommand: UInt16, HCICommand {
    
    public static let opcodeGroupField = HCIOpcodeGroupField.LinkControl
    
    /// Command used to enter Inquiry mode where it discovers other Bluetooth devices.
    case Inquiry                    = 0x0001
    
    /// Command to cancel the Inquiry mode in which the Bluetooth device is in.
    case InquiryCancel              = 0x0002
    
    /// Command to set the device to enter Inquiry modes periodically according to the time interval set.
    case PeriodicInquiry            = 0x0003
    
    /// Command to exit the periodic Inquiry mode.
    case ExitPeriodicInquiry        = 0x0004
    
    /// Command to create an ACL connection to the device specified by the BD_ADDR in the parameters.
    case CreateConnection           = 0x0005
    
    /// Command to terminate the existing connection to a device.
    case Disconnect                 = 0x0006
    
    /// Create an SCO connection defined by the connection handle parameters.
    case AddSCOConnection           = 0x0007
    
    /// Cancel Create Connection
    case CreateConnectionCancel     = 0x0008
    
    /// Command to accept a new connection request.
    case AcceptConnection           = 0x0009
    
    /// Command to reject a new connection request.
    case RejectConnection           = 0x000A
    
    /// Reply command to a link key request event sent from controller to the host.
    case LinkKeyReply               = 0x000B
    
    /// Reply command to a link key request event from the controller to the host if there is no link key associated with the connection.
    case LinkKeyNegativeReply       = 0x000C
    
    /// Reply command to a PIN code request event sent from a controller to the host.
    case PinCodeReply               = 0x000D
    
    /// Reply command to a PIN code request event sent from the controller to the host if there is no PIN associated with the connection.
    case PinCodeNegativeReply       = 0x000E
    
    /// Command to change the type of packets to be sent for an existing connection.
    case SetConnectionPacketType    = 0x000F
    
    /// Command to establish authentication between two devices specified by the connection handle.
    case AuthenticationRequested    = 0x0011
    
    /// Command to enable or disable the link level encryption.
    case SetConnectionEncryption    = 0x0013
    
    /// Command to force the change of a link key to a new one between two connected devices.
    case ChangeConnectionLinkKey    = 0x0015
    
    /// Command to force two devices to use the master's link key temporarily.
    case MasterLinkKey              = 0x0017
    
    /// Command to determine the user friendly name of the connected device.
    case RemoteNameRequest          = 0x0019
    
    /// Cancels the remote name request.
    case RemoteNameRequestCancel    = 0x001A
    
    /// Command to determine the features supported by the connected device.
    case ReadRemoteFeatures         = 0x001B
    
    /// Command to determine the extended features supported by the connected device.
    case ReadRemoteExtendedFeatures = 0x001C
    
    /// Command to determine the version information of the connected device.
    case ReadRemoteVersion          = 0x001D
    
    /// Command to read the clock offset of the remote device.
    case ReadClockOffset            = 0x001F
    
    /// Read LMP Handle
    case ReadLMPHandle              = 0x0020
}

