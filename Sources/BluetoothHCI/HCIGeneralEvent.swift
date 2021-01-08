//
//  HCIGeneralEvent.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 3/3/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

/// Bluetooth HCI Events (not categorized)
@frozen
public enum HCIGeneralEvent: UInt8, HCIEvent {
    
    /// Inquiry Complete
    case inquiryComplete = 0x01
    
    /// Inquiry Result
    case inquiryResult = 0x02
    
    /// Connection Complete
    case connectionComplete = 0x03
    
    /// Connection Request
    case connectionRequest = 0x04
    
    /// Disconnection Complete
    case disconnectionComplete = 0x05
    
    /// Authentication Complete
    case authenticationComplete = 0x06
    
    /// Remote Name Request Complete
    case remoteNameRequestComplete = 0x07
    
    /// Encryption Change
    case encryptionChange = 0x08
    
    /// Change Connection Link Key Complete
    case changeConnectionLinkKeyComplete = 0x09
    
    /// Master Link Key Complete
    case masterLinkKeyComplete = 0x0A
    
    /// Read Remote Supported Features Complete
    case readRemoteSupportedFeaturesComplete = 0x0B
    
    /// ead Remote Version Information Complete
    case readRemoteVersionInformationCompleteEvent = 0x0c
    
    /// QoS Setup Complete
    case qosSetupComplete = 0x0D
    
    /// Command Complete
    case commandComplete = 0x0E
    
    /// Command Status
    case commandStatus = 0x0F
    
    /// Hardware Error
    case hardwareError = 0x10
    
    /// Flush Occurred
    case flushOcurred = 0x11
    
    /// Role Changed
    case roleChanged = 0x12
    
    /// Number of Completed Packets
    case numberOfCompletedPackets = 0x13
    
    /// Mode Change
    case modeChangeEvent = 0x14
    
    /// Return Link Keys
    case returnLinkKeys = 0x15
    
    /// PIN Code Request
    case pinCodeRequest = 0x16
    
    /// Link Key Request
    case linkKeyRequest = 0x17
    
    /// Link Key Notification
    case linkKeyNotification = 0x18
    
    /// Looback Command
    case lookbackCommand = 0x19
    
    /// Data Buffer Overflow
    case dataBufferOverflow = 0x1A
    
    /// Max Slots Change
    case maxSlotsChange = 0x1B
    
    /// Read Clock Offset Complete
    case readClockOffsetComplete = 0x1C
    
    /// Connection Packet Type Changed
    case connectionPacketTypeChanged = 0x1D
    
    /// QoS Violation
    case qosViolation = 0x1E
    
    /// Page Scan Repetition Mode Change
    case pageScanRepetitionModeChange = 0x20
    
    /// Flow Specification Complete
    case flowSpecificationComplete = 0x21
    
    /// Inquiry Result with RSSI
    case inquiryResultWithRSSI = 0x22
    
    /// Read Remote Extended Features Complete
    case readRemoteExtendedFeaturesComplete = 0x23
    
    /// Synchronous Connection Complete
    case synchronousConnectionComplete = 0x2C
    
    /// Synchronous Connection Changed
    case synchronousConnectionChanged = 0x2D
    
    /// Sniff Subrating
    case sniffSubrating = 0x2E
    
    /// Extended Inquiry Result
    case extendedInquiryResult = 0x2F
    
    /// Encryption Key Refresh Complete
    case encryptionKeyRefreshComplete = 0x30
    
    /// IO Capability Request
    case ioCapabilityRequest = 0x31
    
    /// IO Capability Response
    case ioCapabilityResponse = 0x32
    
    /// User Confirmation Request
    case userConfirmationRequest = 0x33
    
    /// User Passkey Request
    case userPasskeyRequest = 0x34
    
    /// Remote OOB Data Request
    case remoteOBBDataRequest = 0x35
    
    /// Simple Pairing Complete
    case simplePairingComplete = 0x36
    
    /// Link Supervision Timeout Changed
    case linkSupervisionTimeoutChanged = 0x38
    
    /// Enhanced Flush Complete
    case enhancedFlushComplete = 0x39
    
    /// User Passkey Notification
    case userPasskeyNotification = 0x3B
    
    /// Keypress Notification
    case keypressNotification = 0x3C
    
    /// Remote Host Supported Features Notification
    case remoteHostSupportedFeaturesNotification = 0x3D
    
    /// Physical Link Complete
    case physicalLinkComplete = 0x40
    
    /// Channel Selected
    case channelSelected = 0x41
    
    /// Disconnection Physical Link Complete
    case disconnectionPhysicalLinkComplete = 0x42
    
    /// Physical Link Loss Early Warning
    case physicalLinkLossEarlyWarning = 0x43
    
    /// Physical Link Recovery
    case physicalLinkRecovery = 0x44
    
    /// Logical Link Complete
    case logicalLinkComplete = 0x45
    
    /// Disconnection Logical Link Complete
    case disconnectionLogicalLinkComplete = 0x46
    
    /// Flow Spec Modify Complete
    case flowSpecModifyComplete = 0x47
    
    /// Number Of Completed Data Blocks
    case numberOfCompletedDataBlocks = 0x48
    
    /// Short Range Mode Change Complete
    case shortRangeModeChangeComplete = 0x4C
    
    /// AMP Status Change
    case ampStatusChange = 0x4D
    
    /// AMP Start Test
    case ampStartTest = 0x49
    
    /// AMP Test End
    case ampTestEnd = 0x4A
    
    /// AMP Receiver Report
    case ampReceiverReport = 0x4B
    
    /// Low Energy Meta Event.
    case lowEnergyMeta = 0x3E
}

// MARK: - Name

public extension HCIGeneralEvent {
    
    var name: String {
        
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
