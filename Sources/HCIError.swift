//
//  HCIError.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 11/28/17.
//  Copyright © 2017 PureSwift. All rights reserved.
//

/// Bluetooth HCI Errors
///
/// If an HCI Command that should generate a Command Complete event generates an error 
/// then this error shall be reported in the Command Complete event.
///
/// If an HCI Command that sent a Command Status with the error code ‘Success’
/// to the Host before processing may find an error during execution then the error may 
/// be reported in the normal completion command for the original command or in a Command Status event.
///
/// Some HCI Commands may generate errors that need to be reported to the Host, 
/// but there is insufficient information to determine how the command would normally be processed.
/// In this case, two events can be used to indicate this to the Host, the Command Complete event 
/// and Command Status events. Which of the two events is used is implementation-dependent.
public enum HCIError: UInt8, Error {
    
    /// Unknown HCI Command
    case unknownCommand                     = 0x01
    
    /// Unknown Connection Identifier
    case noConnection                       = 0x02
    
    /// Hardware Failure
    case hardwareFailure                    = 0x03
    
    /// Page Timeout
    case pageTimeout                        = 0x04
    
    /// Authentication Failure
    case authenticationFailure              = 0x05
    
    /// PIN or Key Missing
    case keyMissing                         = 0x06
    
    /// Memory Capacity Exceeded
    case memoryFull                         = 0x07
    
    /// Connection Timeout
    case connectionTimeout                  = 0x08
    
    /// Connection Limit Exceeded
    case maxConnections                     = 0x09
    
    /// Synchronous Connection Limit To A Device Exceeded
    case maxSCOConnections                  = 0x0A
    
    /// ACL Connection Already Exists
    case aclConnectionExists                = 0x0B
    
    /// Command Disallowed
    case commandDisallowed                  = 0x0C
    
    /// Connection Rejected due to Limited Resources
    case rejectedLimitedResources           = 0x0D
    
    /// Connection Rejected Due To Security Reasons
    case rejectedSecurity                   = 0x0E
    
    /// Connection Rejected due to Unacceptable `Bluetooth.Address`
    case rejectedPersonal                   = 0x0F
    
    /// Connection Accept Timeout Exceeded
    case hostTimeout                        = 0x10
    
    /// Unsupported Feature or Parameter Value
    case unsupportedFeature                 = 0x11
    
    /// Invalid HCI Command Parameters
    case invalidParameters                  = 0x012
    
    /// Remote User Terminated Connection
    case remoteUserEndedConnection          = 0x13
    
    /// Remote Device Terminated Connection due to Low Resources
    case remoteLowResources                 = 0x14
    
    /// Remote Device Terminated Connection due to Power Off
    case remotePowerOff                     = 0x15
    
    /// Connection Terminated By Local Host
    case connectionTerminated               = 0x16
    
    /// Repeated Attempts
    case repeatedAttempts                   = 0x17
    
    /// Pairing Not Allowed
    case pairingNotAllowed                  = 0x18
    
    /// Unknown LMP PDU
    case unknownLMPPDU                      = 0x19
    
    /// Unsupported Remote Feature / Unsupported LMP Feature
    case unsupportedRemoteFeature           = 0x1A
    
    /// SCO Offset Rejected
    case scoOffsetRejected                  = 0x1B
    
    /// SCO Interval Rejected
    case scoIntervalRejected                = 0x1C
    
    /// SCO Air Mode Rejected
    case scoAirModeRejected                 = 0x1D
    
    /// Invalid LMP Parameters
    case invalidLMPParameters               = 0x1E
    
    /// Unspecified Error
    case unspecifiedError                   = 0x1F
    
    /// Unsupported LMP Parameter Value
    case unsupportedLMPParameterValue       = 0x20
    
    /// Role Change Not Allowed
    case roleChangeNotAllowed               = 0x21
    
    /// LMP Response Timeout / LL Response Timeout
    case lmpResponseTimeout                 = 0x22
    
    /// LMP Error Transaction Collision
    case lmpErrorTransactionCollision       = 0x23
    
    /// LMP PDU Not Allowed
    case lmpPDUNotAllowed                   = 0x24
    
    /// Encryption Mode Not Acceptable
    case encryptionModeNotAcceptable        = 0x25
    
    /// Link Key cannot be Changed
    case linkKeyCannotChange                = 0x26
    
    /// Requested QoS Not Supported
    case requestedQoSNotSupported           = 0x27
    
    /// Instant Passed
    case instantPassed                      = 0x28
    
    /// Pairing With Unit Key Not Supported
    case pairingWithUnitKeyNotSupported     = 0x29
    
    /// Different Transaction Collision
    case differentTransactionCollision      = 0x2A
    
    /// Reserved
    case reserved2B                         = 0x2B
    
    /// QoS Unacceptable Parameter
    case qosUnacceptableParameter           = 0x2C
    
    /// QoS Rejected
    case qosRejected                        = 0x2D
    
    /// Channel Classification Not Supported
    case channelClassificationNotSupported  = 0x2E
    
    /// Insufficient Security
    case insufficientSecurity               = 0x2F
    
    /// Parameter Out Of Mandatory Range
    case parameterOutOfMandatoryRange       = 0x30
    
    /// Reserved
    case reserved31                         = 0x31
    
    /// Role Switch Pending
    case roleSwitchPending                  = 0x32
    
    /// Reserved
    case reserved33                         = 0x33
    
    /// Reserved Slot Violation
    case reservedSlotViolation              = 0x34
    
    /// Role Switch Failed
    case roleSwitchFailed                   = 0x35
    
    /// Extended Inquiry Response Too Large
    case extendedInquiryResponseTooLarge    = 0x36
    
    /// Secure Simple Pairing Not Supported By Host
    case secureSimplePairingNotSupported    = 0x37
    
    /// Host Busy - Pairing
    case hostBusyPairing                    = 0x38
    
    /// Connection Rejected due to No Suitable Channel Found
    case noSuitableChannelFound             = 0x39
    
    /// Controller Busy
    case controllerBusy                     = 0x3A
    
    /// Unacceptable Connection Interval
    case unacceptableConnectionInterval     = 0x3B
    
    /// Directed Advertising Timeout
    case directedAdvertisingTimeout         = 0x3C
    
    /// Connection Terminated due to MIC Failure
    case micFailure                         = 0x3D
    
    /// Connection Failed to be Established
    case connectionFailed                   = 0x3E
    
    /// MAC Connection Failed
    case macConnectionFailed                = 0x3F
}
