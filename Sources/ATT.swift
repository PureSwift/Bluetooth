//
//  ATT.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 2/29/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Protocol Definitions

/// Bluetooth ATT protocol
public enum ATT {
    
    public static let PSM: ProtocolServiceMultiplexer   = .att
    
    public static let CID: UInt16                       = 4
    
    public static let minimumPDULength                  = 1  /* At least 1 byte for the opcode. */
    
    /// ATT Timeout, in miliseconds
    public static let timeout: Int                      = 30_000 /* 30 seconds / 30,000 ms */
    
    /// Length of signature in write signed packet.
    public static let signatureLength                   = 12
    
    public static let maximumValueLength                = 512
    
    // Namespace Typealiases
        
    public typealias Error                              = ATTError
    
    public typealias Opcode                             = ATTOpcode
    
    public typealias OpcodeType                         = ATTOpcodeType
    
    public typealias AttributePermission                = ATTAttributePermission
    
    public typealias MaximumTransmissionUnit            = ATTMaximumTransmissionUnit
}

/// ATT protocol opcodes.
public enum ATTOpcode: UInt8 {
    
    /// Error response
    case errorResponse                              = 0x01
    
    // Exchange MTU
    case maximumTransmissionUnitRequest             = 0x02
    case maximumTransmissionUnitResponse            = 0x03
    
    // Find Information
    case findInformationRequest                     = 0x04
    case findInformationResponse                    = 0x05
    
    // Find By Type Value
    case findByTypeRequest                          = 0x06
    case findByTypeResponse                         = 0x07
    
    // Read By Type
    case readByTypeRequest                          = 0x08
    case readByTypeResponse                         = 0x09
    
    // Read
    case readRequest                                = 0x0a
    case readResponse                               = 0x0b
    
    // Read Blob
    case readBlobRequest                            = 0x0c
    case readBlobResponse                           = 0x0d
    
    // Read Multiple
    case readMultipleRequest                        = 0x0e
    case readMultipleResponse                       = 0x0f
    
    // Read By Group Type
    case readByGroupTypeRequest                     = 0x10
    case readByGroupTypeResponse                    = 0x11
    
    // Write
    case writeRequest                               = 0x12
    case writeResponse                              = 0x13
    case writeCommand                               = 0x52
    case signedWriteCommand                         = 0xD2
    
    // Prepare Write
    case preparedWriteRequest                       = 0x16
    case preparedWriteResponse                      = 0x17
    
    // Execute Write
    case executeWriteRequest                        = 0x18
    case executeWriteResponse                       = 0x19
    
    // Handle Value
    case handleValueNotification                    = 0x1B
    case handleValueIndication                      = 0x1D
    case handleValueConfirmation                    = 0x1E
    
    /// Specifies the opcode category.
    public var type: ATT.OpcodeType {
        
        switch self {
        case .errorResponse:                    return .response
        case .maximumTransmissionUnitRequest:   return .request
        case .maximumTransmissionUnitResponse:  return .response
        case .findInformationRequest:           return .request
        case .findInformationResponse:          return .response
        case .findByTypeRequest:                return .request
        case .findByTypeResponse:               return .response
        case .readByTypeRequest:                return .request
        case .readByTypeResponse:               return .response
        case .readRequest:                      return .request
        case .readResponse:                     return .response
        case .readBlobRequest:                  return .request
        case .readBlobResponse:                 return .response
        case .readMultipleRequest:              return .request
        case .readMultipleResponse:             return .response
        case .readByGroupTypeRequest:           return .request
        case .readByGroupTypeResponse:          return .response
        case .writeRequest:                     return .request
        case .writeResponse:                    return .response
        case .writeCommand:                     return .command
        case .signedWriteCommand:               return .command
        case .preparedWriteRequest:             return .request
        case .preparedWriteResponse:            return .response
        case .executeWriteRequest:              return .request
        case .executeWriteResponse:             return .response
        case .handleValueNotification:          return .notification
        case .handleValueIndication:            return .indication
        case .handleValueConfirmation:          return .confirmation
        }
    }
    
    // swiftlint:disable comma
    private static let requestResponseMap: [(request: ATTOpcode,  response: ATTOpcode)] = [
        (maximumTransmissionUnitRequest,     maximumTransmissionUnitResponse),
        (findInformationRequest,             findInformationResponse),
        (findByTypeRequest,                  findByTypeResponse),
        (readByTypeRequest,                  readByTypeResponse),
        (readRequest,                        readResponse),
        (readBlobRequest,                    readBlobResponse),
        (readMultipleRequest,                readMultipleResponse),
        (readByGroupTypeRequest,             readByGroupTypeResponse),
        (writeRequest,                       writeResponse),
        (preparedWriteRequest,               preparedWriteResponse),
        (executeWriteRequest,                executeWriteResponse)
    ]
    // swiftlint:enable comma
    
    private static let responsesByRequest: [ATTOpcode: ATTOpcode] = {
        
        var dictionary = [ATTOpcode: ATTOpcode](minimumCapacity: requestResponseMap.count)
        requestResponseMap.forEach { dictionary[$0.request] = $0.response }
        return dictionary
    }()
    
    private static let requestsByResponse: [ATTOpcode: ATTOpcode] = {
        
        var dictionary = [ATTOpcode: ATTOpcode](minimumCapacity: requestResponseMap.count)
        requestResponseMap.forEach { dictionary[$0.response] = $0.request }
        return dictionary
    }()
    
    /// Get the equivalent response for the current request opcode (if applicable).
    public var response: ATTOpcode? {
        
        return ATTOpcode.responsesByRequest[self]
    }
    
    /// Get the equivalent request for the current response opcode (if applicable).
    public var request: ATTOpcode? {
        
        return ATTOpcode.requestsByResponse[self]
    }
}

/// ATT protocol opcode categories.
public enum ATTOpcodeType {
    
    case request
    case response
    case command
    case indication
    case notification
    case confirmation
}

// MARK: - Attribute Permission

/// ATT attribute permission bitfield values. Permissions are grouped as
/// "Access", "Encryption", "Authentication", and "Authorization". A bitmask of
/// permissions is a byte that encodes a combination of these.
public enum ATTAttributePermission: UInt8, BitMaskOption {
    
    #if swift(>=3.2)
    #elseif swift(>=3.0)
    public typealias RawValue = UInt8
    #endif
    
    // Access
    case read                                       = 0x01
    case write                                      = 0x02
    
    // Encryption
    public static let encrypt                       = BitMaskOptionSet<ATTAttributePermission>([.readEncrypt, .writeEncrypt])
    case readEncrypt                                = 0x04
    case writeEncrypt                               = 0x08
    
    // The following have no effect on Darwin
    
    // Authentication
    public static let  authentication               = BitMaskOptionSet<ATTAttributePermission>([.readAuthentication, .writeAuthentication])
    case readAuthentication                         = 0x10
    case writeAuthentication                        = 0x20
    
    // Authorization
    case authorized                                 = 0x40
    case noAuthorization                            = 0x80
    
    public static let all: Set<ATTAttributePermission> = [.read,
                                                          .write,
                                                          .readEncrypt,
                                                          .writeEncrypt,
                                                          .readAuthentication,
                                                          .writeAuthentication,
                                                          .authorized,
                                                          .noAuthorization]
}

public extension ATTAttributePermission {
    
    var name: String {
        
        switch self {
        case .read: return "Read"
        case .write: return "Write"
        case .readEncrypt: return "Read Encrypt"
        case .writeEncrypt: return "Write Encrypt"
        case .readAuthentication: return "Read Authentication"
        case .writeAuthentication: return "Write Authentication"
        case .authorized: return "Authorized"
        case .noAuthorization: return "No Authorization"
        }
    }
}

// MARK: CustomStringConvertible

extension ATTAttributePermission: CustomStringConvertible {
    
    public var description: String {
        
        return name
    }
}
