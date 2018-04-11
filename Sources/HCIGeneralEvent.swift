//
//  HCIGeneralEvent.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 3/3/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

/// Bluetooth HCI Events (not categorized)
public enum HCIGeneralEvent: UInt8, HCIEvent {
    
    /// Inquiry Complete
    case inquiryComplete                    = 0x01
    
    /// Inquiry Result
    case inquiryResult                      = 0x02
    
    /// Connection Complete
    case connectionComplete                 = 0x03
    
    // TODO: Complete all HCI events
    
    /// Remote Name Request Complete
    case remoteNameRequestComplete          = 0x07
    
    /// Encryption Change
    case encryptionChange                   = 0x08
    
    /// Command Complete
    case commandComplete                    = 0x0E
    
    /// Command Status
    case commandStatus                      = 0x0F
    
    /// Encryption Key Refresh Complete
    case encryptionKeyRefreshComplete       = 0x30
    
    /// Low Energy Meta Event.
    case lowEnergyMeta                      = 0x3E
}

// MARK: - Name

public extension HCIGeneralEvent {
    
    public var name: String {
        
        return type(of: self).names[Int(rawValue)]
    }
    
    private static let names = [
        "Unknown",
        "Inquiry Complete",
        "Inquiry Result",
        "Connect Complete",
        "Connect Request",
        "Disconn Complete",
        "Auth Complete",
        "Remote Name Req Complete",
        "Encrypt Change",
        "Change Connection Link Key Complete",
        "Master Link Key Complete",
        "Read Remote Supported Features",
        "Read Remote Ver Info Complete",
        "QoS Setup Complete",
        "Command Complete",
        "Command Status",
        "Hardware Error",
        "Flush Occurred",
        "Role Change",
        "Number of Completed Packets",
        "Mode Change",
        "Return Link Keys",
        "PIN Code Request",
        "Link Key Request",
        "Link Key Notification",
        "Loopback Command",
        "Data Buffer Overflow",
        "Max Slots Change",
        "Read Clock Offset Complete",
        "Connection Packet Type Changed",
        "QoS Violation",
        "Page Scan Mode Change",
        "Page Scan Repetition Mode Change",
        "Flow Specification Complete",
        "Inquiry Result with RSSI",
        "Read Remote Extended Features",
        "Unknown",
        "Unknown",
        "Unknown",
        "Unknown",
        "Unknown",
        "Unknown",
        "Unknown",
        "Unknown",
        "Synchronous Connect Complete",
        "Synchronous Connect Changed",
        "Sniff Subrate",
        "Extended Inquiry Result",
        "Encryption Key Refresh Complete",
        "IO Capability Request",
        "IO Capability Response",
        "User Confirmation Request",
        "User Passkey Request",
        "Remote OOB Data Request",
        "Simple Pairing Complete",
        "Unknown",
        "Link Supervision Timeout Change",
        "Enhanced Flush Complete",
        "Unknown",
        "User Passkey Notification",
        "Keypress Notification",
        "Remote Host Supported Features Notification",
        "LE Meta Event",
        "Unknown",
        "Physical Link Complete",
        "Channel Selected",
        "Disconnection Physical Link Complete",
        "Physical Link Loss Early Warning",
        "Physical Link Recovery",
        "Logical Link Complete",
        "Disconnection Logical Link Complete",
        "Flow Spec Modify Complete",
        "Number Of Completed Data Blocks",
        "AMP Start Test",
        "AMP Test End",
        "AMP Receiver Report",
        "Short Range Mode Change Complete",
        "AMP Status Change"
    ]
}
