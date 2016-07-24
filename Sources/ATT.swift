//
//  ATT.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 2/29/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

import SwiftFoundation

// MARK: - Protocol Definitions

/// Bluetooth ATT protocol
public struct ATT {
    
    public static let PSM: ProtocolServiceMultiplexer   = .ATT
    
    public static let CID: UInt16                       = 4
    
    public static let MinimumPDULength                  = 1  /* At least 1 byte for the opcode. */
    
    /// ATT Timeout, in miliseconds
    public static let Timeout: Int                      = 30000 /* 30000 ms */
    
    /// Length of signature in write signed packet.
    public static let SignatureLength                   = 12
    
    public static let MaximumValueLength                = 512
    
    /// ATT MTU constants
    public struct MTU {
        
        public struct LowEnergy {
            
            public static let Default                   = 23
            
            public static let Maximum                   = 517
        }
    }
    
    // Namespace Typealiases
        
    public typealias Error                              = ATTError
    
    public typealias Opcode                             = ATTOpcode
    
    public typealias OpcodeType                         = ATTOpcodeType
    
    public typealias AttributePermission                = ATTAttributePermission
}

/// Error codes for Error response PDU.
public enum ATTError: UInt8, Error {
    
    /// The attribute handle given was not valid on this server.
    case InvalidHandle                              = 0x01
    
    /// The attribute cannot be read.
    case ReadNotPermitted                           = 0x02
    
    /// The attribute cannot be written.
    case WriteNotPermitted                          = 0x03
    
    /// The attribute PDU was invalid.
    case InvalidPDU                                 = 0x04
    
    /// The attribute requires authentication before it can be read or written.
    case Authentication                             = 0x05
    
    /// Attribute server does not support the request received from the client.
    case RequestNotSupported                        = 0x06
    
    /// Offset specified was past the end of the attribute.
    case InvalidOffset                              = 0x07
    
    /// The attribute requires authorization before it can be read or written.
    case InsufficientAuthorization                  = 0x08
    
    /// Too many prepare writes have been queued.
    case PrepareQueueFull                           = 0x09
    
    /// No attribute found within the given attribute handle range.
    case AttributeNotFound                          = 0x0A
    
    /// The attribute cannot be read or written using the *Read Blob Request*. 
    case AttributeNotLong                           = 0x0B
    
    /// The *Encryption Key Size* used for encrypting this link is insufficient.
    case InsufficientEncryptionKeySize              = 0x0C
    
    /// The attribute value length is invalid for the operation.
    case InvalidAttributeValueLength                = 0x0D
    
    /// The attribute request that was requested has encountered an error that was unlikely, 
    /// and therefore could not be completed as requested.
    case UnlikelyError                              = 0x0E
    
    /// The attribute requires encryption before it can be read or written.
    case InsufficientEncryption                     = 0x0F
    
    /// The attribute type is not a supported grouping attribute as defined by a higher layer specification.
    case UnsupportedGroupType                       = 0x10
    
    /// Insufficient Resources to complete the request.
    case InsufficientResources                      = 0x11
}

/// ATT protocol opcodes.
public enum ATTOpcode: UInt8 {
    
    // Masks
    public static let CommandMask                   = 0x40
    public static let SignedMask                    = 0x80
    
    /// Error response
    case ErrorResponse                              = 0x01
    
    // Exchange MTU
    case MaximumTransmissionUnitRequest             = 0x02
    case MaximumTransmissionUnitResponse            = 0x03
    
    // Find Information
    case FindInformationRequest                     = 0x04
    case FindInformationResponse                    = 0x05
    
    // Find By Type Value
    case FindByTypeRequest                          = 0x06
    case FindByTypeResponse                         = 0x07
    
    // Read By Type
    case ReadByTypeRequest                          = 0x08
    case ReadByTypeResponse                         = 0x09
    
    // Read
    case ReadRequest                                = 0x0a
    case ReadResponse                               = 0x0b
    
    // Read Blob
    case ReadBlobRequest                            = 0x0c
    case ReadBlobResponse                           = 0x0d
    
    // Read Multiple
    case ReadMultipleRequest                        = 0x0e
    case ReadMultipleResponse                       = 0x0f
    
    // Read By Group Type
    case ReadByGroupTypeRequest                     = 0x10
    case ReadByGroupTypeResponse                    = 0x11
    
    // Write
    case WriteRequest                               = 0x12
    case WriteResponse                              = 0x13
    case WriteCommand                               = 0x52
    case SignedWriteCommand                         = 0xD2
    
    // Prepare Write
    case PreparedWriteRequest                       = 0x16
    case PreparedWriteResponse                      = 0x17
    
    // Execute Write
    case ExecuteWriteRequest                        = 0x18
    case ExecuteWriteResponse                       = 0x19
    
    // Handle Value
    case HandleValueNotification                    = 0x1B
    case HandleValueIndication                      = 0x1D
    case HandleValueConfirmation                    = 0x1E
    
    /// Specifies the opcode category.
    public var type: ATT.OpcodeType {
        
        switch self {
        
        case .ErrorResponse:                    return .Response
        case .MaximumTransmissionUnitRequest:   return .Request
        case .MaximumTransmissionUnitResponse:  return .Response
        case .FindInformationRequest:           return .Request
        case .FindInformationResponse:          return .Response
        case .FindByTypeRequest:                return .Request
        case .FindByTypeResponse:               return .Response
        case .ReadByTypeRequest:                return .Request
        case .ReadByTypeResponse:               return .Response
        case .ReadRequest:                      return .Request
        case .ReadResponse:                     return .Response
        case .ReadBlobRequest:                  return .Request
        case .ReadBlobResponse:                 return .Response
        case .ReadMultipleRequest:              return .Request
        case .ReadMultipleResponse:             return .Response
        case .ReadByGroupTypeRequest:           return .Request
        case .ReadByGroupTypeResponse:          return .Response
        case .WriteRequest:                     return .Request
        case .WriteResponse:                    return .Response
        case .WriteCommand:                     return .Command
        case .SignedWriteCommand:               return .Command
        case .PreparedWriteRequest:             return .Request
        case .PreparedWriteResponse:            return .Response
        case .ExecuteWriteRequest:              return .Request
        case .ExecuteWriteResponse:             return .Response
        case .HandleValueNotification:          return .Notification
        case .HandleValueIndication:            return .Indication
        case .HandleValueConfirmation:          return .Confirmation
        
        }
    }
}

/// ATT protocol opcode categories.
public enum ATTOpcodeType {
    
    case Request
    case Response
    case Command
    case Indication
    case Notification
    case Confirmation
}

/// ATT attribute permission bitfield values. Permissions are grouped as
/// "Access", "Encryption", "Authentication", and "Authorization". A bitmask of
/// permissions is a byte that encodes a combination of these.
public enum ATTAttributePermission: UInt8, BitMaskOption {
    
    // Access
    case Read                                       = 0x01
    case Write                                      = 0x02
    
    // Encryption
    public static let Encrypt                       = [ReadEncrypt, WriteEncrypt]
    case ReadEncrypt                                = 0x04
    case WriteEncrypt                               = 0x08
    
    // The following have no effect on Darwin
    
    // Authentication
    public static let  Authentication               = [ReadAuthentication, WriteAuthentication]
    case ReadAuthentication                         = 0x10
    case WriteAuthentication                        = 0x20
    
    // Authorization
    case Authorized                                 = 0x40
    case None                                       = 0x80
}


